package app.xposed.patches.twitter.badges

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.Constants.MODEL_BRIDGE_CLASS
import app.xposed.patches.twitter.util.argumentRegisters
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.stringRef
import app.xposed.patches.twitter.util.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val RETURNS = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)

/**
 * Writes ModelBridge, which reads X's models for the filters, and hooks the constructors of
 * CanonicalPost and ProfileUser, which carry the post language and the profile details that
 * timeline users lack. Everything is found from toString() labels and checked by type.
 */
internal fun BytecodePatchContext.writeModelBridge(user: UserModel, availablePost: ClassDef, postFields: Map<String, FieldReference>) {
    // User interface accessors, found through the getters MinimalUser implements them with.
    val minimal = MinimalUserToStringFingerprint.matchSingle()
    val minimalClass = minimal.originalClassDef
    if (user.type !in minimalClass.interfaces) throw PatchException("MinimalUser does not implement ${user.type}")
    val minimalFields = toStringFields(minimal.originalMethod)
    fun accessor(label: String, type: String? = null): MethodReference {
        val field = minimalFields.field("MinimalUser", label, type)
        return interfaceAccessor(user.type, minimalClass, field)
    }
    val name = accessor("name", STRING)
    val bio = accessor("profileDescription", STRING)
    val verifiedType = accessor("verifiedType")
    val userLabel = accessor("userLabel")
    val entities = accessor("entities")
    val counts = accessor("relationshipCounts")
    val pcf = accessor("parodyCommentaryFanLabel")
    val friendship = accessor("friendship")

    val verification = enumConstants(verifiedType.returnType, "Government")
    val labels = enumConstants(pcf.returnType, "Parody", "Commentary", "Fan")

    val following = toStringFields(RelationshipCountsToStringFingerprint.matchSingle().originalMethod)
        .field("RelationshipCounts", "following", "J")
    requireDefinedIn(following, counts.returnType)
    val labelDescription = toStringFields(UserLabelToStringFingerprint.matchSingle().originalMethod)
        .field("UserLabel", "description", STRING)
    requireDefinedIn(labelDescription, userLabel.returnType)
    val urls = toStringFields(PostEntityListToStringFingerprint.matchSingle().originalMethod)
        .field("PostEntityList", "urls", "Ljava/util/List;")
    requireDefinedIn(urls, entities.returnType)
    val urlEntity = UrlEntityToStringFingerprint.matchSingle()
    val expandedUrl = toStringFields(urlEntity.originalMethod).field("UrlEntity", "expandedUrl", STRING)
    // "isFollowedByMe": the signed-in account follows this one (relationship_perspectives.following).
    val followedByMe = toStringFields(FriendshipToStringFingerprint.matchSingle().originalMethod)
        .field("Friendship", "isFollowedByMe", "Z")
    requireDefinedIn(followedByMe, friendship.returnType)

    val profile = ProfileUserToStringFingerprint.matchSingle()
    val profileClass = profile.originalClassDef.type
    if (user.type !in profile.originalClassDef.interfaces) throw PatchException("ProfileUser does not implement ${user.type}")
    val profileFields = toStringFields(profile.originalMethod)
    val location = profileFields.field("ProfileUser", "location", STRING)
    val website = profileFields.field("ProfileUser", "website", urlEntity.originalClassDef.type)
    val tweetCounts = profileFields.field("ProfileUser", "tweetCounts", "Ljava/lang/Long;")

    val postId = postFields.field("AvailablePost", "postId")
    val viewer = postFields.field("AvailablePost", "currentUserIdentifier", user.getId.returnType)
    val postAuthor = postFields.field("AvailablePost", "author", user.type)
    // The quoted post's item: an AvailablePost, or an UnavailablePost without an author.
    val quotePostState = postFields.field("AvailablePost", "quotePostState")
    if (quotePostState.type !in availablePost.interfaces) throw PatchException("quotePostState isn't a post item")
    val postIdValue = instanceField(postId.type, "long id field of ${postId.type}") { it.type == "J" }

    // Relations X-Posed follows to hide replies and quotes of filtered posts.
    val canonical = CanonicalPostToStringFingerprint.matchSingle()
    val canonicalClass = canonical.originalClassDef.type
    val canonicalFields = toStringFields(canonical.originalMethod)
    val canonicalId = canonicalFields.field("CanonicalPost", "id", postId.type)
    val language = canonicalFields.field("CanonicalPost", "language", STRING)
    val canonicalAuthor = canonicalFields.field("CanonicalPost", "author")
    if (canonicalAuthor.type != user.type && user.type !in classDefBy(canonicalAuthor.type).interfaces) {
        throw PatchException("CanonicalPost.author isn't a ${user.type}")
    }
    val repliedPostId = canonicalFields.field("CanonicalPost", "repliedPostId", "Ljava/lang/Long;")
    val repliedToHandle = canonicalFields.field("CanonicalPost", "repliedToUserScreenName", STRING)
    val quotedStatusId = canonicalFields.field("CanonicalPost", "quotedStatusId", postId.type)

    requirePublic(
        name, bio, verifiedType, userLabel, entities, counts, pcf, friendship, following, labelDescription, urls,
        expandedUrl, followedByMe, location, website, tweetCounts, postId, viewer, postAuthor, quotePostState, postIdValue,
        canonicalId, language, canonicalAuthor, repliedPostId, repliedToHandle, quotedStatusId,
        *verification.values.toTypedArray(), *labels.values.toTypedArray(),
    )

    fun stub(name: String, locals: Int, smali: String) = replaceStub(MODEL_BRIDGE_CLASS, name, locals, smali)
    fun userCall(accessor: MethodReference) = "check-cast p0, ${user.type}\ninvoke-interface { p0 }, ${accessor.descriptor}"

    stub("screenName", 1, "${userCall(user.screenName)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "userId", 2,
        """
        ${userCall(user.getId)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-wide v0, v0, ${user.idValue.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    stub("displayName", 1, "${userCall(name)}\nmove-result-object v0\nreturn-object v0")
    stub("bio", 1, "${userCall(bio)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "isGovernment", 2,
        """
        ${userCall(verifiedType)}
        move-result-object v0
        sget-object v1, ${verification.getValue("Government").descriptor}
        if-ne v0, v1, :other
        const/4 v0, 0x1
        return v0
        :other
        const/4 v0, 0x0
        return v0
        """,
    )
    stub(
        "label", 2,
        """
        ${userCall(pcf)}
        move-result-object v0
        sget-object v1, ${labels.getValue("Parody").descriptor}
        if-ne v0, v1, :not_parody
        const-string v0, "parody"
        return-object v0
        :not_parody
        sget-object v1, ${labels.getValue("Commentary").descriptor}
        if-ne v0, v1, :not_commentary
        const-string v0, "commentary"
        return-object v0
        :not_commentary
        sget-object v1, ${labels.getValue("Fan").descriptor}
        if-ne v0, v1, :none
        const-string v0, "fan"
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "following", 2,
        """
        ${userCall(counts)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-wide v0, v0, ${following.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    stub(
        "followedByMe", 1,
        """
        ${userCall(friendship)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-boolean v0, v0, ${followedByMe.descriptor}
        return v0
        :unknown
        const/4 v0, 0x0
        return v0
        """,
    )
    // Each path returns its own register: ART types a register merged from the label and its
    // String field as Object, and rejects the whole bridge class for returning that as String.
    stub(
        "affiliation", 1,
        """
        ${userCall(userLabel)}
        move-result-object v0
        if-eqz v0, :none
        iget-object v0, v0, ${labelDescription.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "bioLinks", 1,
        """
        ${userCall(entities)}
        move-result-object v0
        if-eqz v0, :none
        iget-object v0, v0, ${urls.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    val urlEntityClass = urlEntity.originalClassDef.type
    stub(
        "expandedUrl", 1,
        """
        instance-of v0, p0, $urlEntityClass
        if-eqz v0, :none
        check-cast p0, $urlEntityClass
        iget-object v0, p0, ${expandedUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "profileLocation", 1,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :none
        check-cast p0, $profileClass
        iget-object v0, p0, ${location.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "website", 1,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :none
        check-cast p0, $profileClass
        iget-object v0, p0, ${website.descriptor}
        if-eqz v0, :none
        iget-object v0, v0, ${expandedUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "postCount", 2,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :unknown
        check-cast p0, $profileClass
        iget-object v0, p0, ${tweetCounts.descriptor}
        if-eqz v0, :unknown
        invoke-virtual { v0 }, Ljava/lang/Long;->longValue()J
        move-result-wide v0
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    fun idStub(name: String, owner: String, field: FieldReference, value: FieldReference) = stub(
        name, 2,
        """
        check-cast p0, $owner
        iget-object v0, p0, ${field.descriptor}
        if-eqz v0, :unknown
        iget-wide v0, v0, ${value.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    idStub("postId", availablePost.type, postId, postIdValue)
    idStub("viewerId", availablePost.type, viewer, user.idValue)
    idStub("canonicalPostId", canonicalClass, canonicalId, postIdValue)
    idStub("quotedPostId", canonicalClass, quotedStatusId, postIdValue)
    fun fieldStub(name: String, owner: String, field: FieldReference) = stub(
        name, 1,
        """
        check-cast p0, $owner
        iget-object v0, p0, ${field.descriptor}
        return-object v0
        """,
    )
    fieldStub("language", canonicalClass, language)
    fieldStub("canonicalAuthor", canonicalClass, canonicalAuthor)
    fieldStub("repliedToHandle", canonicalClass, repliedToHandle)
    fieldStub("postAuthor", availablePost.type, postAuthor)
    stub(
        "repliedPostId", 2,
        """
        check-cast p0, $canonicalClass
        iget-object v0, p0, ${repliedPostId.descriptor}
        if-eqz v0, :unknown
        invoke-virtual { v0 }, Ljava/lang/Long;->longValue()J
        move-result-wide v0
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    stub(
        "quotedPost", 1,
        """
        check-cast p0, ${availablePost.type}
        iget-object v0, p0, ${quotePostState.descriptor}
        instance-of p0, v0, ${availablePost.type}
        if-nez p0, :available
        const/4 v0, 0x0
        :available
        return-object v0
        """,
    )

    hookConstructors(canonicalClass, "onCanonicalPost")
    hookConstructors(profileClass, "onProfileUser")
}

/** Calls Hooks.[hook](this) at the end of every constructor of [type]. */
private fun BytecodePatchContext.hookConstructors(type: String, hook: String) {
    val constructors = mutableClassDefBy(type).methods.filter { it.name == "<init>" }
    if (constructors.isEmpty()) throw PatchException("$type has no constructor")
    constructors.forEach { constructor ->
        constructor.instructionList
            .mapIndexedNotNull { i, instruction -> i.takeIf { instruction.opcode == Opcode.RETURN_VOID } }
            .reversed()
            .forEach { constructor.addInstructions(it, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->$hook(Ljava/lang/Object;)V") }
    }
}

/**
 * The method of interface [interfaceType] that [implementation] answers by returning [field].
 * R8 keeps interface methods callable by name, so the extension calls them with invoke-interface.
 */
private fun BytecodePatchContext.interfaceAccessor(interfaceType: String, implementation: ClassDef, field: FieldReference): MethodReference {
    val declared = classDefBy(interfaceType).methods.filter { it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val getter = implementation.methods.filter { method ->
        val instructions = method.instructionList
        method.parameterTypes.isEmpty() && instructions.size == 2 && instructions[1].opcode in RETURNS &&
            instructions[0].fieldRef?.descriptor == field.descriptor &&
            (instructions[0] as TwoRegisterInstruction).registerB == method.implementation!!.registerCount - 1 &&
            declared.any { it.name == method.name && it.returnType == method.returnType }
    }.single("getter of ${field.descriptor} declared by $interfaceType")
    return declared.first { it.name == getter.name && it.returnType == getter.returnType }
}

/** The static fields holding the constants [names] of enum [type], read from its static initializer. */
internal fun BytecodePatchContext.enumConstants(type: String, vararg names: String): Map<String, FieldReference> {
    val classDef = classDefBy(type)
    if (!AccessFlags.ENUM.isSet(classDef.accessFlags)) throw PatchException("$type is not an enum")
    val initializer: Method = classDef.methods.firstOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$type has no static initializer")
    val strings = mutableMapOf<Int, String>()
    val created = mutableMapOf<Int, String>()
    val constants = mutableMapOf<String, FieldReference>()
    initializer.instructionList.forEach { instruction ->
        when (instruction.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                strings[(instruction as OneRegisterInstruction).registerA] = instruction.stringRef!!

            Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> {
                val reference = instruction.methodRef!!
                if (reference.definingClass == type && reference.name == "<init>" && reference.parameterTypes.firstOrNull()?.toString() == STRING) {
                    val registers = instruction.argumentRegisters()
                    strings.remove(registers[1])?.let { created[registers[0]] = it }
                }
            }

            Opcode.SPUT_OBJECT -> {
                val field = instruction.fieldRef!!
                val register = (instruction as OneRegisterInstruction).registerA
                if (field.definingClass == type && field.type == type) created.remove(register)?.let { constants.putIfAbsent(it, field) }
            }

            else -> {}
        }
    }
    val wanted = names.associateWith { constants[it] ?: throw PatchException("$type has no constant $it (has ${constants.keys})") }
    if (wanted.values.map { it.name }.toSet().size != wanted.size) throw PatchException("$type constants $names share a field")
    return wanted
}

private fun requireDefinedIn(field: FieldReference, type: String) {
    if (field.definingClass != type) throw PatchException("${field.descriptor} is not a field of $type")
}
