package patches.ytmusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val ADAPTER = "Lapp/morphe/extension/music/patches/AndroidAutoPatch;"
private val REQUEST = ADAPTER.removeSuffix(";") + "\$BrowseRequest;"
private val PREPARED = ADAPTER.removeSuffix(";") + "\$PreparedItems;"
private val FOLDER = ADAPTER.removeSuffix(";") + "\$LibraryFolder;"
private val HOME_LOAD = ADAPTER.removeSuffix(";") + "\$HomeLoad;"
private val MODE = ADAPTER.removeSuffix(";") + "\$HomeLoad\$Mode;"
private val LOAD = ADAPTER.removeSuffix(";") + "\$Load;"
private const val LIBRARY_SUPPORT = "Lpatches/ytmusic/GearslipLibrarySupport;"
private const val CAPTURED_REQUEST = "Lpatches/ytmusic/GearslipLibrarySupport\$Request;"
private const val STRING = "Ljava/lang/String;"

/** Link Morphe's phone-session loaders after all selected source bundles install their hooks. */
internal val gearslipPersonalLibrary = bytecodePatch(default = false) {
    extendWith("extensions/gearslip-ytm-library.mpe")

    finalize {
        // Manager filters against the original package before GmsCore renames it. Other
        // sources create BrowseRequest bridges during execute, so resolve them only now.
        val policy = Fingerprint(returnType = "Z", filters = listOf(string(BrowserDiscovery.UID_DIAGNOSTIC)))
            .matchAll().map { it.method }.toList()
        check(policy.size == 1 && policy.single().name == "morpheOriginalCallerPolicy") {
            "Enable Gearslip music browser support with this patch (or use an APK that already contains it)"
        }
        val adapters = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { cls -> if (cls.type == ADAPTER) adapters.add(cls) }
        check(adapters.size == 1) { "Enable Morphe's Android Auto patch with Gearslip personal library" }
        val adapter = mutableClassDefBy(adapters.single())
        check(adapter.methods.none { it.name == "morpheHandleGearslipRequest" }) { "Gearslip personal library is already applied" }
        fun method(type: String, name: String, params: List<String>, result: String) = classDefBy(type).methods.singleOrNull {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == params && it.returnType == result && it.implementation != null
        } ?: error("Unsupported Morphe library adapter: missing $type->$name")
        val handler = adapter.methods.singleOrNull {
            it.name == "handleBrowseRequest" && it.parameterTypes.map(CharSequence::toString) == listOf(REQUEST) && it.returnType == "Z"
        } ?: error("Apply Morphe's Android Auto library enhancements before this patch")
        check(AccessFlags.STATIC.isSet(handler.accessFlags) && handler.implementation!!.registerCount >= 2)
        method(PREPARED, "<init>", emptyList(), "V")
        method(PREPARED, "add", listOf(STRING, STRING, STRING, STRING, "Z"), "V")
        method(FOLDER, "values", emptyList(), "[$FOLDER")
        val item = classDefBy(FOLDER).methods.single { it.name == "mediaItem" && it.parameterTypes.isEmpty() }
        check(item.returnType == "Landroid/support/v4/media/MediaBrowserCompat\$MediaItem;")
        check(classDefBy(FOLDER).fields.map { it.name }.containsAll(listOf("PLAYLISTS", "SONGS", "ALBUMS", "ARTISTS", "LAST_PLAYED")))
        method(LOAD, "start", emptyList(), "V")
        val homeConstructor = classDefBy(HOME_LOAD).methods.singleOrNull {
            it.name == "<init>" && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.size == 5 &&
                it.parameterTypes.take(4).map(CharSequence::toString) == listOf(REQUEST, MODE, STRING, "Ljava/util/List;")
        } ?: error("Unsupported Morphe library adapter: Home loader constructor changed")

        // Capture only the RemoteUserInfo supplied by the original service callback. Never use
        // the bundle's caller_package_name or a media ID as a substitute for caller identity.
        val infoType = Fingerprint(filters = listOf(string("MBS: getCurrentBrowserInfo() failed."))).matchAll()
            .map { it.method }.single { it.definingClass == "Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;" }.returnType
        val infoPackage = classDefBy(infoType).methods.single {
            it.parameterTypes.isEmpty() && it.returnType == STRING && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val requestClasses = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { cls -> if (REQUEST in cls.interfaces) requestClasses.add(cls) }
        val request = mutableClassDefBy(requestClasses.single())
        val info = request.fields.single { it.type == infoType && !AccessFlags.STATIC.isSet(it.accessFlags) }
        check(request.methods.none { it.name == "morphe_getCallerPackage" })
        request.interfaces.add(CAPTURED_REQUEST)
        val captured = ImmutableMethod(request.type, "morphe_getCallerPackage", emptyList(), STRING,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, emptySet(), emptySet(), MutableMethodImplementation(2)).toMutable()
        captured.addInstructions(0, """
            iget-object v0, p0, $info
            if-eqz v0, :missing_browser
            invoke-virtual { v0 }, $infoPackage
            move-result-object v0
            return-object v0
            :missing_browser
            const/4 v0, 0x0
            return-object v0
        """)
        request.methods.add(captured)
        val bridge = ImmutableMethod(ADAPTER, "morpheHandleGearslipRequest",
            listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(REQUEST, emptySet(), null)), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(), MutableMethodImplementation(9)).toMutable()
        bridge.addInstructions(0, """
            invoke-interface { p0 }, $REQUEST->patch_getRequestedMediaId()Ljava/lang/String;
            move-result-object v0
            invoke-static { p0, v0 }, $LIBRARY_SUPPORT->route(Ljava/lang/Object;Ljava/lang/String;)I
            move-result v0
            const/4 v1, 0x1
            if-eq v0, v1, :root
            const/4 v1, 0x2
            if-eq v0, v1, :home
            const/4 v1, 0x3
            if-eq v0, v1, :library
            const/4 v0, 0x0
            return v0
            :root
            new-instance v0, $PREPARED
            invoke-direct { v0 }, $PREPARED-><init>()V
            const-string v1, "morphe:gearslip:home"
            const-string v2, "Home"
            const-string v3, ""
            const-string v4, ""
            const/4 v5, 0x0
            invoke-virtual/range { v0 .. v5 }, $PREPARED->add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
            const-string v1, "morphe:gearslip:library"
            const-string v2, "Library"
            invoke-virtual/range { v0 .. v5 }, $PREPARED->add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
            goto :deliver
            :home
            new-instance v0, $HOME_LOAD
            move-object v1, p0
            sget-object v2, $MODE->HOME:$MODE
            const-string v3, ""
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v4
            const/4 v5, 0x0
            invoke-direct/range { v0 .. v5 }, $homeConstructor
            invoke-virtual { v0 }, $LOAD->start()V
            const/4 v0, 0x1
            return v0
            :library
            new-instance v0, $PREPARED
            invoke-direct { v0 }, $PREPARED-><init>()V
            invoke-static {}, $FOLDER->values()[$FOLDER
            move-result-object v1
            const/4 v2, 0x0
            array-length v3, v1
            :next_folder
            if-ge v2, v3, :deliver
            aget-object v4, v1, v2
            invoke-virtual { v4 }, Ljava/lang/Enum;->name()Ljava/lang/String;
            move-result-object v5
            const-string v6, "UPLOADED_"
            invoke-virtual { v5, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v5
            if-nez v5, :skip_folder
            invoke-virtual { v4 }, $item
            move-result-object v7
            invoke-virtual { v0, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            :skip_folder
            add-int/lit8 v2, v2, 0x1
            goto :next_folder
            :deliver
            invoke-interface { p0, v0 }, $REQUEST->patch_deliverBrowseItems(Ljava/util/List;)V
            const/4 v0, 0x1
            return v0
        """)
        adapter.methods.add(bridge)
        handler.addInstructions(0, """
            invoke-static/range { p0 .. p0 }, $ADAPTER->morpheHandleGearslipRequest($REQUEST)Z
            move-result v0
            if-eqz v0, :original_browse_request
            return v0
            :original_browse_request
        """)
    }
}
