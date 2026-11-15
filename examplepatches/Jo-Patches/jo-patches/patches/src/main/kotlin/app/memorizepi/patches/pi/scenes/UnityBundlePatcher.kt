package app.memorizepi.patches.pi.scenes

import app.morphe.patcher.patch.PatchException
import java.nio.charset.StandardCharsets
import java.util.logging.Logger

/**
 * Patches the cross-promotion objects inside the Unity scene bundle
 * `assets/bin/Data/data.unity3d`.
 *
 * The bundle is a UnityFS container with LZ4-compressed blocks. Inside it,
 * `level0`-`level3` are Unity SerializedFiles. The patch edits the following
 * objects in place (their size does not change, so offsets and metadata stay
 * valid):
 *
 *  - every `GameObject` named `PromoteIcon` and its whole Transform subtree:
 *    `m_IsActive = false`, `m_LocalScale = (0, 0, 0)`
 *  - the `GameObject` named `Prime Button` in `level0` and its Transform:
 *    `m_IsActive = false`, `m_LocalScale = (0, 0, 0)`
 *
 * Zero scale is deliberate: the menu scripts re-activate the objects at
 * runtime, and zero scale also shrinks their box colliders so the invisible
 * elements cannot be tapped.
 *
 * Everything else in the bundle stays byte-identical.
 *
 * Unity serializes the fields at fixed offsets for this layout:
 *
 *  GameObject: int32 componentCount, ComponentPair[12 * count], uint32 layer,
 *              string name (int32 length + bytes + 4-byte alignment),
 *              uint16 tag, uint8 m_IsActive
 *  Transform:  PPtr m_GameObject (12), Quaternion m_LocalRotation (16),
 *              Vector3 m_LocalPosition (12), Vector3 m_LocalScale (12),
 *              vector<PPtr> m_Children, PPtr m_Father
 *
 * Any deviation (different bundle version, encryption, unknown Transform
 * layout) aborts the patch instead of writing a broken bundle.
 */
internal enum class SceneTargetKind { PROMOTE_ICON, PRIME_BUTTON }

/** State of one patched object, used by verification and tests. */
internal data class SceneTarget(
    val kind: SceneTargetKind,
    val scene: String,
    val pathId: Long,
    val classId: Int,
    /** For GameObjects: whether m_IsActive is false. Null for Transforms. */
    val inactive: Boolean?,
    /** For Transforms: whether m_LocalScale is (0, 0, 0). Null for GameObjects. */
    val scaledToZero: Boolean?,
)

internal data class ScenePatchOutcome(
    val bundle: ByteArray,
    val targets: List<SceneTarget>,
    val gameObjectsChanged: Int,
    val transformsChanged: Int,
    val alreadyPatched: Boolean,
)

internal object UnityBundlePatcher {
    const val BUNDLE_ENTRY = "assets/bin/Data/data.unity3d"

    private val logger: Logger = Logger.getLogger(UnityBundlePatcher::class.java.name)

    /**
     * Patches the bundle and returns the new bytes. If every target is
     * already inactive and scaled to zero, the input is returned unchanged.
     */
    fun patch(bundleBytes: ByteArray): ScenePatchOutcome {
        val bundle = parseBundle(bundleBytes)
        val targets = collectTargets(bundle)
        if (targets.isEmpty()) fail("No cross-promotion objects found in the bundle")

        val data = bundle.data.copyOf()
        var gameObjectsChanged = 0
        var transformsChanged = 0

        for (target in targets) {
            target.activeOffset?.let { offset ->
                if (data[offset].toInt() != 0) {
                    data[offset] = 0
                    gameObjectsChanged++
                }
            }
            target.scaleOffset?.let { offset ->
                val scaled = data.readF32LE(offset) != 0f ||
                    data.readF32LE(offset + 4) != 0f ||
                    data.readF32LE(offset + 8) != 0f
                if (scaled) {
                    data.writeF32LE(offset, 0f)
                    data.writeF32LE(offset + 4, 0f)
                    data.writeF32LE(offset + 8, 0f)
                    transformsChanged++
                }
            }
        }

        if (gameObjectsChanged == 0 && transformsChanged == 0) {
            logger.info("Cross-promotion objects are already patched; leaving the bundle untouched")
            return ScenePatchOutcome(bundleBytes, describe(bundle, targets), 0, 0, alreadyPatched = true)
        }

        val rebuilt = bundle.rebuild(data)

        // Round-trip check: a faulty compressor must never reach the APK.
        if (!parseBundle(rebuilt).data.contentEquals(data)) {
            fail("Rebuilt bundle does not round-trip through the LZ4 decoder")
        }

        logger.info(
            "Patched Unity scenes: $gameObjectsChanged GameObjects deactivated, " +
                "$transformsChanged Transforms scaled to zero, ${rebuilt.size} bytes",
        )

        return ScenePatchOutcome(
            bundle = rebuilt,
            targets = describe(bundle, targets),
            gameObjectsChanged = gameObjectsChanged,
            transformsChanged = transformsChanged,
            alreadyPatched = false,
        )
    }

    /** Reads the current state of all cross-promotion objects without modifying anything. */
    fun inspect(bundleBytes: ByteArray): List<SceneTarget> {
        val bundle = parseBundle(bundleBytes)
        return describe(bundle, collectTargets(bundle))
    }

    /** Returns the raw object bytes of every target, keyed by `scene:pathId`. */
    fun targetObjects(bundleBytes: ByteArray): Map<String, ByteArray> {
        val bundle = parseBundle(bundleBytes)
        return collectTargets(bundle).associate { target ->
            "${target.scene}:${target.pathId}" to
                bundle.data.copyOfRange(target.start, target.start + target.size)
        }
    }

    /** Byte ranges of every target object (test helper). */
    fun targetRanges(bundleBytes: ByteArray): List<IntRange> {
        val bundle = parseBundle(bundleBytes)
        return collectTargets(bundle).map { it.start until (it.start + it.size) }
    }

    /** Decompresses the bundle without modifying it (test helper). */
    fun unpack(bundleBytes: ByteArray): ByteArray = parseBundle(bundleBytes).data

    private fun describe(bundle: Bundle, targets: List<Target>): List<SceneTarget> = targets.map { target ->
        SceneTarget(
            kind = target.kind,
            scene = target.scene,
            pathId = target.pathId,
            classId = target.classId,
            inactive = target.activeOffset?.let { bundle.data[it].toInt() == 0 },
            scaledToZero = target.scaleOffset?.let { offset ->
                bundle.data.readF32LE(offset) == 0f &&
                    bundle.data.readF32LE(offset + 4) == 0f &&
                    bundle.data.readF32LE(offset + 8) == 0f
            },
        )
    }
}

// ---------------------------------------------------------------- patch targets

private const val PROMOTE_ICON = "PromoteIcon"
private const val PRIME_BUTTON = "Prime Button"
private const val PRIME_BUTTON_SCENE = "level0"

private const val GAME_OBJECT_CLASS_ID = 1
private const val TRANSFORM_CLASS_ID = 4

private val LEVEL_NAME = Regex("level\\d+")

private class Target(
    val kind: SceneTargetKind,
    val scene: String,
    val pathId: Long,
    val classId: Int,
    val start: Int,
    val size: Int,
    val activeOffset: Int?,
    val scaleOffset: Int?,
)

private fun collectTargets(bundle: Bundle): List<Target> {
    val targets = ArrayList<Target>()

    for (node in bundle.nodes) {
        if (!LEVEL_NAME.matches(node.name)) continue

        val scene = SceneFile(bundle.data, node.name, SerializedFile.parse(bundle.data, node.offset, node.size))
        val visited = HashSet<Long>()

        val promoteRoots = scene.objects.filter { obj ->
            obj.classId == GAME_OBJECT_CLASS_ID && scene.gameObject(obj).name == PROMOTE_ICON
        }
        for (root in promoteRoots) {
            val rootInfo = scene.gameObject(root)
            val rootTransform = scene.findTransform(root, rootInfo)
                ?: fail("GameObject '$PROMOTE_ICON' in ${node.name} has no Transform")

            val stack = ArrayDeque<Pair<Obj, Obj>>()
            stack.addLast(root to rootTransform)

            while (stack.isNotEmpty()) {
                val (gameObject, transform) = stack.removeLast()
                if (!visited.add(gameObject.pathId)) continue

                val gameObjectInfo = scene.gameObject(gameObject)
                val transformInfo = scene.transform(transform)
                if (transformInfo.gameObjectPathId != gameObject.pathId) {
                    fail(
                        "Transform ${transform.pathId} in ${node.name} belongs to " +
                            "GameObject ${transformInfo.gameObjectPathId}, not ${gameObject.pathId}",
                    )
                }

                targets += Target(
                    kind = SceneTargetKind.PROMOTE_ICON,
                    scene = node.name,
                    pathId = gameObject.pathId,
                    classId = GAME_OBJECT_CLASS_ID,
                    start = gameObject.start,
                    size = gameObject.size,
                    activeOffset = gameObjectInfo.activeOffset,
                    scaleOffset = null,
                )
                targets += Target(
                    kind = SceneTargetKind.PROMOTE_ICON,
                    scene = node.name,
                    pathId = transform.pathId,
                    classId = TRANSFORM_CLASS_ID,
                    start = transform.start,
                    size = transform.size,
                    activeOffset = null,
                    scaleOffset = transformInfo.scaleOffset,
                )

                for (childPathId in transformInfo.children) {
                    val childTransform = scene.byPathId[childPathId]
                        ?: fail("Child Transform $childPathId of ${transform.pathId} not found in ${node.name}")
                    if (childTransform.classId != TRANSFORM_CLASS_ID) {
                        fail("Child $childPathId in ${node.name} is not a Transform")
                    }
                    val childInfo = scene.transform(childTransform)
                    val childGameObject = scene.byPathId[childInfo.gameObjectPathId]
                        ?: fail(
                            "GameObject ${childInfo.gameObjectPathId} of Transform " +
                                "$childPathId not found in ${node.name}",
                        )
                    if (childGameObject.classId != GAME_OBJECT_CLASS_ID) {
                        fail("Object ${childGameObject.pathId} in ${node.name} is not a GameObject")
                    }
                    stack.addLast(childGameObject to childTransform)
                }
            }
        }

        if (node.name == PRIME_BUTTON_SCENE) {
            val primeButton = scene.objects.firstOrNull { obj ->
                obj.classId == GAME_OBJECT_CLASS_ID && scene.gameObject(obj).name == PRIME_BUTTON
            } ?: fail("GameObject '$PRIME_BUTTON' not found in $PRIME_BUTTON_SCENE")

            if (visited.add(primeButton.pathId)) {
                val info = scene.gameObject(primeButton)
                targets += Target(
                    kind = SceneTargetKind.PRIME_BUTTON,
                    scene = node.name,
                    pathId = primeButton.pathId,
                    classId = GAME_OBJECT_CLASS_ID,
                    start = primeButton.start,
                    size = primeButton.size,
                    activeOffset = info.activeOffset,
                    scaleOffset = null,
                )
                val transform = scene.findTransform(primeButton, info)
                    ?: fail("GameObject '$PRIME_BUTTON' in $PRIME_BUTTON_SCENE has no Transform")
                val transformInfo = scene.transform(transform)
                targets += Target(
                    kind = SceneTargetKind.PRIME_BUTTON,
                    scene = node.name,
                    pathId = transform.pathId,
                    classId = TRANSFORM_CLASS_ID,
                    start = transform.start,
                    size = transform.size,
                    activeOffset = null,
                    scaleOffset = transformInfo.scaleOffset,
                )
            }
        }
    }

    return targets
}

/** Caches the parsed fields of one scene file. */
private class SceneFile(
    private val data: ByteArray,
    val name: String,
    val file: SerializedFile,
) {
    val objects: List<Obj> = file.objects
    val byPathId: Map<Long, Obj> = objects.associateBy { it.pathId }
    private val gameObjects = HashMap<Long, GameObjectInfo>()
    private val transforms = HashMap<Long, TransformInfo>()

    fun gameObject(obj: Obj): GameObjectInfo =
        gameObjects.getOrPut(obj.pathId) { readGameObject(data, obj) }

    fun transform(obj: Obj): TransformInfo =
        transforms.getOrPut(obj.pathId) { readTransform(data, obj) }

    fun findTransform(gameObject: Obj, info: GameObjectInfo): Obj? {
        for (pathId in info.componentPathIds) {
            val candidate = byPathId[pathId] ?: continue
            if (candidate.classId == TRANSFORM_CLASS_ID) return candidate
        }
        return null
    }
}

// ----------------------------------------------------------- serialized fields

private class GameObjectInfo(
    val name: String,
    val activeOffset: Int,
    val componentPathIds: LongArray,
)

private class TransformInfo(
    val gameObjectPathId: Long,
    val scaleOffset: Int,
    val children: LongArray,
)

/**
 * GameObject: int32 componentCount, ComponentPair[count], uint32 layer,
 * string name, uint16 tag, uint8 m_IsActive.
 */
private fun readGameObject(data: ByteArray, obj: Obj): GameObjectInfo {
    if (obj.classId != GAME_OBJECT_CLASS_ID) {
        fail("Object ${obj.pathId} is not a GameObject (class ${obj.classId})")
    }
    var position = obj.start
    val componentCount = data.readI32LE(position)
    position += 4
    if (componentCount !in 0..10_000) {
        fail("Invalid component count $componentCount in GameObject ${obj.pathId}")
    }

    val components = LongArray(componentCount)
    var localComponents = 0
    for (index in 0 until componentCount) {
        val entry = position + index * 12
        val fileId = data.readI32LE(entry)
        val pathId = data.readI64LE(entry + 4)
        if (fileId == 0) components[localComponents++] = pathId
    }
    position += componentCount * 12

    data.readI32LE(position) // m_Layer
    position += 4

    val nameLength = data.readI32LE(position)
    position += 4
    if (nameLength !in 0..4_096) {
        fail("Invalid name length $nameLength in GameObject ${obj.pathId}")
    }
    if (position > obj.end - nameLength) {
        fail("GameObject ${obj.pathId} name exceeds its object bounds")
    }
    val name = String(data, position, nameLength, StandardCharsets.UTF_8)
    position += nameLength
    position = align4(position)

    position += 2 // m_Tag
    if (position >= obj.end) {
        fail("GameObject ${obj.pathId} has no m_IsActive field")
    }

    return GameObjectInfo(name, position, components.copyOf(localComponents))
}

/**
 * Transform: PPtr m_GameObject, Quaternion m_LocalRotation,
 * Vector3 m_LocalPosition, Vector3 m_LocalScale, vector<PPtr> m_Children,
 * PPtr m_Father. The size is validated for the exact layout.
 */
private fun readTransform(data: ByteArray, obj: Obj): TransformInfo {
    if (obj.classId != TRANSFORM_CLASS_ID) {
        fail("Object ${obj.pathId} is not a Transform (class ${obj.classId})")
    }
    if (obj.size < 68) {
        fail("Transform ${obj.pathId} is too small (${obj.size} bytes)")
    }

    val gameObjectPathId = data.readI64LE(obj.start + 4)
    val childrenOffset = obj.start + 52
    val childCount = data.readI32LE(childrenOffset)
    if (childCount !in 0..100_000) {
        fail("Invalid child count $childCount in Transform ${obj.pathId}")
    }

    val expectedSize = 68 + childCount * 12
    if (obj.size != expectedSize) {
        fail(
            "Unsupported Transform layout in ${obj.pathId}: ${obj.size} bytes for " +
                "$childCount children (expected $expectedSize)",
        )
    }

    val children = LongArray(childCount)
    var localChildren = 0
    for (index in 0 until childCount) {
        val entry = obj.start + 56 + index * 12
        val fileId = data.readI32LE(entry)
        val pathId = data.readI64LE(entry + 4)
        if (fileId == 0) children[localChildren++] = pathId
    }

    return TransformInfo(
        gameObjectPathId = gameObjectPathId,
        scaleOffset = obj.start + 40,
        children = children.copyOf(localChildren),
    )
}

// ------------------------------------------------------------ serialized file

private class Obj(
    val pathId: Long,
    val start: Int,
    val size: Int,
    val classId: Int,
) {
    val end: Int get() = start + size
}

private class SerializedFile(
    val objects: List<Obj>,
) {
    companion object {
        fun parse(bundleData: ByteArray, nodeOffset: Int, nodeSize: Int): SerializedFile {
            if (nodeSize < 48) fail("Scene file is too small ($nodeSize bytes)")
            val file = bundleData.copyOfRange(nodeOffset, nodeOffset + nodeSize)

            val version = file.readI32BE(8)
            if (version != 22) fail("Unsupported SerializedFile version $version (expected 22)")
            if (file.readU8(16) != 0) fail("Big-endian SerializedFiles are not supported")
            val declaredFileSize = file.readI64BE(24)
            if (declaredFileSize != nodeSize.toLong()) {
                fail("SerializedFile size $declaredFileSize does not match its bundle node ($nodeSize)")
            }

            val dataOffset = file.readI64BE(32)
            if (dataOffset < 0 || dataOffset > nodeSize) {
                fail("Invalid data offset $dataOffset in scene file")
            }

            var position = 48
            position = file.readCString(position).second
            position += 4 // target platform
            val typeTreeEnabled = file.readU8(position) != 0
            position += 1

            val typeCount = file.readI32LE(position)
            position += 4
            if (typeCount !in 0..100_000) fail("Invalid type count $typeCount")

            val classIds = IntArray(typeCount)
            for (index in 0 until typeCount) {
                val classId = file.readI32LE(position)
                position += 4
                classIds[index] = classId
                position += 1 // isStrippedType
                position += 2 // scriptTypeIndex
                if (classId == 114) position += 16 // MonoBehaviour script id
                position += 16 // old type hash
                if (typeTreeEnabled) {
                    val nodeCount = file.readI32LE(position)
                    position += 4
                    val stringBufferSize = file.readI32LE(position)
                    position += 4
                    if (nodeCount < 0 || stringBufferSize < 0) fail("Invalid type tree size")
                    position += nodeCount * 32 + stringBufferSize
                    val dependencyCount = file.readI32LE(position)
                    position += 4
                    if (dependencyCount < 0) fail("Invalid type dependency count")
                    position += dependencyCount * 4
                }
                if (position > file.size) fail("Type table exceeds the scene file")
            }

            val objectCount = file.readI32LE(position)
            position += 4
            if (objectCount !in 0..1_000_000) fail("Invalid object count $objectCount")

            val objects = ArrayList<Obj>(objectCount)
            for (index in 0 until objectCount) {
                position = align4(position)
                val pathId = file.readI64LE(position)
                position += 8
                val byteStart = file.readI64LE(position)
                position += 8
                val byteSize = file.readI32LE(position)
                position += 4
                val typeId = file.readI32LE(position)
                position += 4

                if (typeId !in classIds.indices) fail("Invalid type id $typeId for object $pathId")
                val available = nodeSize.toLong() - dataOffset
                if (byteStart < 0 || byteSize <= 0 || byteStart > available || byteSize > available - byteStart) {
                    fail("Object $pathId exceeds the scene file")
                }
                objects += Obj(
                    pathId = pathId,
                    start = nodeOffset + dataOffset.toInt() + byteStart.toInt(),
                    size = byteSize,
                    classId = classIds[typeId],
                )
            }

            return SerializedFile(objects)
        }
    }
}

// ----------------------------------------------------------------------- bundle

private const val COMPRESSION_MASK = 0x3F
private const val COMPRESSION_NONE = 0
private const val COMPRESSION_LZ4 = 2
private const val COMPRESSION_LZ4HC = 3
private const val FLAG_BLOCKS_AND_DIRECTORY = 0x40
private const val FLAG_BLOCKS_INFO_AT_END = 0x80
private const val FLAG_ALIGN_DATA = 0x200

private class Block(
    val uncompressedSize: Int,
    val compressedSize: Int,
    val flags: Int,
)

private class Node(
    val name: String,
    val offset: Int,
    val size: Int,
    val flags: Int,
)

private class Bundle(
    val formatVersion: Int,
    val playerVersion: String,
    val engineVersion: String,
    val blocks: List<Block>,
    val nodes: List<Node>,
    val data: ByteArray,
) {
    /** Recompresses the (already patched) data and writes a new UnityFS bundle. */
    fun rebuild(newData: ByteArray): ByteArray {
        var expectedSize = 0L
        for (block in blocks) expectedSize += block.uncompressedSize
        if (expectedSize != newData.size.toLong()) {
            fail("Bundle data changed size: ${newData.size} bytes, expected $expectedSize")
        }

        val compressedBlocks = ArrayList<ByteArray>(blocks.size)
        val newBlocks = ArrayList<Block>(blocks.size)
        var offset = 0
        for (block in blocks) {
            val compressed = Lz4Block.compress(newData, offset, block.uncompressedSize)
            if (compressed.size < block.uncompressedSize) {
                compressedBlocks += compressed
                newBlocks += Block(block.uncompressedSize, compressed.size, COMPRESSION_LZ4)
            } else {
                compressedBlocks += newData.copyOfRange(offset, offset + block.uncompressedSize)
                newBlocks += Block(block.uncompressedSize, block.uncompressedSize, COMPRESSION_NONE)
            }
            offset += block.uncompressedSize
        }

        val directorySize = 4 + nodes.sumOf { 20 + it.name.toByteArray(StandardCharsets.UTF_8).size + 1 }
        val info = ByteArray(16 + 4 + newBlocks.size * 10 + directorySize)
        var position = 16 // 16-byte hash, written as zeros (ignored by Unity)
        position = info.writeI32BE(position, newBlocks.size)
        for (block in newBlocks) {
            position = info.writeI32BE(position, block.uncompressedSize)
            position = info.writeI32BE(position, block.compressedSize)
            position = info.writeU16BE(position, block.flags)
        }

        position = info.writeI32BE(position, nodes.size)
        for (node in nodes) {
            position = info.writeI64BE(position, node.offset.toLong())
            position = info.writeI64BE(position, node.size.toLong())
            position = info.writeI32BE(position, node.flags)
            val nameBytes = node.name.toByteArray(StandardCharsets.UTF_8)
            nameBytes.copyInto(info, position)
            position += nameBytes.size
            info[position++] = 0
        }
        if (position != info.size) fail("Internal error while building the block directory")

        val compressedInfo = Lz4Block.compress(info, 0, info.size)
        val compressInfo = compressedInfo.size < info.size
        val infoBytes = if (compressInfo) compressedInfo else info
        val flags = FLAG_BLOCKS_AND_DIRECTORY or FLAG_BLOCKS_INFO_AT_END or
            (if (compressInfo) COMPRESSION_LZ4 else COMPRESSION_NONE)

        val headerPrefix = buildHeaderPrefix(formatVersion, playerVersion, engineVersion)
        val headerSize = align16(headerPrefix.size + 20)
        val dataSize = compressedBlocks.sumOf { it.size }
        val totalSize = headerSize + dataSize + infoBytes.size

        val output = ByteArray(totalSize)
        headerPrefix.copyInto(output, 0)
        var headerPosition = headerPrefix.size
        headerPosition = output.writeI64BE(headerPosition, totalSize.toLong())
        headerPosition = output.writeI32BE(headerPosition, infoBytes.size)
        headerPosition = output.writeI32BE(headerPosition, info.size)
        headerPosition = output.writeI32BE(headerPosition, flags)
        if (headerPosition > headerSize) fail("Internal error: bundle header exceeds its alignment")

        var destination = headerSize
        for (chunk in compressedBlocks) {
            chunk.copyInto(output, destination)
            destination += chunk.size
        }
        infoBytes.copyInto(output, destination)

        return output
    }
}

private fun buildHeaderPrefix(formatVersion: Int, playerVersion: String, engineVersion: String): ByteArray {
    val signature = "UnityFS".toByteArray(StandardCharsets.UTF_8)
    val player = playerVersion.toByteArray(StandardCharsets.UTF_8)
    val engine = engineVersion.toByteArray(StandardCharsets.UTF_8)
    val size = signature.size + 1 + 4 + player.size + 1 + engine.size + 1
    val output = ByteArray(size)
    var position = 0
    signature.copyInto(output, position)
    position += signature.size
    output[position++] = 0
    position = output.writeI32BE(position, formatVersion)
    player.copyInto(output, position)
    position += player.size
    output[position++] = 0
    engine.copyInto(output, position)
    position += engine.size
    output[position++] = 0
    if (position != size) fail("Internal error while building the bundle header")
    return output
}

private fun parseBundle(bytes: ByteArray): Bundle {
    if (bytes.size < 48) fail("File is too small to be a UnityFS bundle")

    val signature = bytes.readCString(0)
    if (signature.first != "UnityFS") fail("Unexpected bundle signature '${signature.first}'")

    var position = signature.second
    val formatVersion = bytes.readI32BE(position)
    position += 4
    if (formatVersion !in 6..8) fail("Unsupported UnityFS version $formatVersion")

    val player = bytes.readCString(position)
    position = player.second
    val engine = bytes.readCString(position)
    position = engine.second

    val engineYear = engine.first.substringBefore('.').toIntOrNull()
        ?: fail("Unsupported Unity version '${engine.first}'")
    if (engineYear < 2022) {
        fail("Unsupported Unity version '${engine.first}'; the archive flags cannot be read safely")
    }

    val declaredSize = bytes.readI64BE(position)
    position += 8
    val compressedInfoSize = bytes.readI32BE(position)
    position += 4
    val uncompressedInfoSize = bytes.readI32BE(position)
    position += 4
    val flags = bytes.readI32BE(position)
    position += 4

    if (compressedInfoSize <= 0 || uncompressedInfoSize <= 0) fail("Invalid block directory size")
    if (flags and FLAG_BLOCKS_AND_DIRECTORY == 0) {
        fail("Unsupported UnityFS layout: blocks and directory are stored separately")
    }

    if (formatVersion >= 7) position = align16(position)

    val infoAtEnd = flags and FLAG_BLOCKS_INFO_AT_END != 0
    val infoStart = if (infoAtEnd) {
        if (compressedInfoSize > bytes.size) fail("Block directory exceeds the file")
        bytes.size - compressedInfoSize
    } else {
        position
    }
    val info = bytes.decompress(infoStart, compressedInfoSize, uncompressedInfoSize, flags and COMPRESSION_MASK)

    val dataStart = if (infoAtEnd) {
        if (flags and FLAG_ALIGN_DATA != 0) align16(position) else position
    } else {
        val afterInfo = infoStart + compressedInfoSize
        if (flags and FLAG_ALIGN_DATA != 0) align16(afterInfo) else afterInfo
    }
    if (infoAtEnd && dataStart > infoStart) fail("Scene data overlaps the block directory")

    var infoPosition = 16
    val blockCount = info.readI32BE(infoPosition)
    infoPosition += 4
    if (blockCount !in 1..1_000_000) fail("Invalid block count $blockCount")

    val blocks = ArrayList<Block>(blockCount)
    for (index in 0 until blockCount) {
        val uncompressedSize = info.readI32BE(infoPosition)
        infoPosition += 4
        val compressedSize = info.readI32BE(infoPosition)
        infoPosition += 4
        val blockFlags = info.readU16BE(infoPosition)
        infoPosition += 2

        if (uncompressedSize <= 0 || compressedSize <= 0) fail("Invalid block size")
        val compression = blockFlags and COMPRESSION_MASK
        if (compression != COMPRESSION_NONE && compression != COMPRESSION_LZ4 && compression != COMPRESSION_LZ4HC) {
            fail("Unsupported block compression type $compression")
        }
        if (compression == COMPRESSION_NONE && compressedSize != uncompressedSize) {
            fail("Uncompressed block has different compressed and uncompressed sizes")
        }
        blocks += Block(uncompressedSize, compressedSize, blockFlags)
    }

    val nodeCount = info.readI32BE(infoPosition)
    infoPosition += 4
    if (nodeCount !in 1..100_000) fail("Invalid file count $nodeCount")

    val nodes = ArrayList<Node>(nodeCount)
    for (index in 0 until nodeCount) {
        val offset = info.readI64BE(infoPosition)
        infoPosition += 8
        val size = info.readI64BE(infoPosition)
        infoPosition += 8
        val nodeFlags = info.readI32BE(infoPosition)
        infoPosition += 4
        val name = info.readCString(infoPosition)
        infoPosition = name.second

        if (offset < 0 || size < 0 || offset > Int.MAX_VALUE || size > Int.MAX_VALUE) {
            fail("Invalid file entry in the bundle directory")
        }
        nodes += Node(name.first, offset.toInt(), size.toInt(), nodeFlags)
    }

    val totalSize = blocks.sumOf { it.uncompressedSize.toLong() }
    if (totalSize > Int.MAX_VALUE) fail("Bundle is too large to patch in memory")

    for (node in nodes) {
        if (node.offset.toLong() + node.size > totalSize) {
            fail("File '${node.name}' exceeds the bundle data")
        }
    }

    val data = ByteArray(totalSize.toInt())
    var source = dataStart
    var destination = 0
    for (block in blocks) {
        if (source > bytes.size - block.compressedSize) fail("Block data exceeds the file")
        when (block.flags and COMPRESSION_MASK) {
            COMPRESSION_NONE -> System.arraycopy(bytes, source, data, destination, block.uncompressedSize)
            COMPRESSION_LZ4, COMPRESSION_LZ4HC -> Lz4Block.decompress(
                bytes,
                source,
                block.compressedSize,
                data,
                destination,
                block.uncompressedSize,
            )
        }
        source += block.compressedSize
        destination += block.uncompressedSize
    }

    if (declaredSize > 0 && declaredSize != bytes.size.toLong()) {
        Logger.getLogger(UnityBundlePatcher::class.java.name)
            .warning("Bundle header size $declaredSize does not match the file size ${bytes.size}")
    }

    Logger.getLogger(UnityBundlePatcher::class.java.name).info(
        "UnityFS v$formatVersion (${engine.first}), ${blocks.size} blocks, " +
            "${nodes.size} files, ${data.size} uncompressed bytes",
    )

    return Bundle(formatVersion, player.first, engine.first, blocks, nodes, data)
}

// ---------------------------------------------------------------------- helpers

private fun fail(message: String): Nothing =
    throw PatchException("Unity scene patch: $message")

private fun align4(value: Int): Int = (value + 3) and 3.inv()

private fun align16(value: Int): Int = (value + 15) and 15.inv()

private fun ByteArray.decompress(
    offset: Int,
    compressedSize: Int,
    uncompressedSize: Int,
    compression: Int,
): ByteArray = when (compression) {
    COMPRESSION_NONE -> {
        if (compressedSize != uncompressedSize) fail("Uncompressed block directory has mismatched sizes")
        need(offset, compressedSize)
        copyOfRange(offset, offset + compressedSize)
    }
    COMPRESSION_LZ4, COMPRESSION_LZ4HC -> {
        need(offset, compressedSize)
        ByteArray(uncompressedSize).also { output ->
            Lz4Block.decompress(this, offset, compressedSize, output, 0, uncompressedSize)
        }
    }
    else -> fail("Unsupported compression type $compression")
}

private fun ByteArray.need(position: Int, count: Int) {
    if (position < 0 || count < 0 || position > size - count) {
        fail("Unexpected end of data at $position (need $count bytes, have ${size - position})")
    }
}

private fun ByteArray.readU8(position: Int): Int {
    need(position, 1)
    return this[position].toInt() and 0xFF
}

private fun ByteArray.readU16LE(position: Int): Int {
    need(position, 2)
    return (this[position].toInt() and 0xFF) or ((this[position + 1].toInt() and 0xFF) shl 8)
}

private fun ByteArray.readU16BE(position: Int): Int {
    need(position, 2)
    return ((this[position].toInt() and 0xFF) shl 8) or (this[position + 1].toInt() and 0xFF)
}

private fun ByteArray.readI32LE(position: Int): Int {
    need(position, 4)
    return (this[position].toInt() and 0xFF) or
        ((this[position + 1].toInt() and 0xFF) shl 8) or
        ((this[position + 2].toInt() and 0xFF) shl 16) or
        ((this[position + 3].toInt() and 0xFF) shl 24)
}

private fun ByteArray.readI64LE(position: Int): Long {
    need(position, 8)
    var value = 0L
    for (index in 0 until 8) {
        value = value or ((this[position + index].toLong() and 0xFF) shl (8 * index))
    }
    return value
}

private fun ByteArray.readI32BE(position: Int): Int {
    need(position, 4)
    return ((this[position].toInt() and 0xFF) shl 24) or
        ((this[position + 1].toInt() and 0xFF) shl 16) or
        ((this[position + 2].toInt() and 0xFF) shl 8) or
        (this[position + 3].toInt() and 0xFF)
}

private fun ByteArray.readI64BE(position: Int): Long {
    need(position, 8)
    var value = 0L
    for (index in 0 until 8) {
        value = (value shl 8) or (this[position + index].toLong() and 0xFF)
    }
    return value
}

private fun ByteArray.readF32LE(position: Int): Float = Float.fromBits(readI32LE(position))

private fun ByteArray.writeF32LE(position: Int, value: Float) {
    val bits = value.toRawBits()
    need(position, 4)
    this[position] = bits.toByte()
    this[position + 1] = (bits ushr 8).toByte()
    this[position + 2] = (bits ushr 16).toByte()
    this[position + 3] = (bits ushr 24).toByte()
}

private fun ByteArray.writeI32BE(position: Int, value: Int): Int {
    need(position, 4)
    this[position] = (value ushr 24).toByte()
    this[position + 1] = (value ushr 16).toByte()
    this[position + 2] = (value ushr 8).toByte()
    this[position + 3] = value.toByte()
    return position + 4
}

private fun ByteArray.writeU16BE(position: Int, value: Int): Int {
    need(position, 2)
    this[position] = (value ushr 8).toByte()
    this[position + 1] = value.toByte()
    return position + 2
}

private fun ByteArray.writeI64BE(position: Int, value: Long): Int {
    need(position, 8)
    for (index in 0 until 8) {
        this[position + index] = (value ushr (8 * (7 - index))).toByte()
    }
    return position + 8
}

private fun ByteArray.readCString(position: Int): Pair<String, Int> {
    var end = position
    while (end < size && this[end].toInt() != 0) end++
    if (end >= size) fail("Unterminated string at $position")
    return String(this, position, end - position, StandardCharsets.UTF_8) to (end + 1)
}
