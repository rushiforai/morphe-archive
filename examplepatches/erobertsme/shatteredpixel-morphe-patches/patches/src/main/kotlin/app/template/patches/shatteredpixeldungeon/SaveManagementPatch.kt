package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON
import org.w3c.dom.Element

private const val PROVIDER_CLASS = "app.template.extension.shatteredpixeldungeon.SaveFilesProvider"
private const val LOCATION_CLASS = "Lapp/template/extension/shatteredpixeldungeon/SaveLocation;"
private const val ACTIVITY_CLASS = "app.template.extension.shatteredpixeldungeon.SaveBackupActivity"
private const val ACTION_EXPORT = "app.template.extension.shatteredpixeldungeon.EXPORT_SAVES"
private const val ACTION_IMPORT = "app.template.extension.shatteredpixeldungeon.IMPORT_SAVES"
private const val SHORTCUTS_RESOURCE = "morphe_save_backup_shortcuts"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

internal val publicSaveFolderOption = booleanOption(
	key = "publicSaveFolder",
	default = true,
	title = "Public save folder",
	description = "Stores save files in a public folder on the device so they can be opened with any file manager. Asks for storage access on first launch and copies existing saves over.",
)

internal val saveFolderNameOption = stringOption(
	key = "folderName",
	default = "Documents/ShatteredPixelDungeon",
	title = "Save folder",
	description = "Folder for the public save folder, relative to the root of the device storage.",
	required = true,
) { !it.isNullOrBlank() && !it.contains('"') && !it.contains('\\') }

internal val uncompressedSavesOption = booleanOption(
	key = "uncompressedSaves",
	default = true,
	title = "Uncompressed saves",
	description = "Writes save files as plain JSON instead of GZIP so they can be edited in any text editor. Existing compressed saves still load and are converted the next time the game saves.",
)

internal val saveFileAccessOption = booleanOption(
	key = "saveFileAccess",
	default = true,
	title = "Save file access",
	description = "Shows the game's private save folder in the system file picker and Files app.",
)

private val saveFilesProviderManifestPatch = resourcePatch {
	execute {
		val fileAccess by saveFileAccessOption
		if (fileAccess != true) return@execute

		document("AndroidManifest.xml").use { document ->
			val manifest = document.documentElement
			val packageName = manifest.getAttribute("package")
			val application = document.getElementsByTagName("application").item(0)

			val provider = document.createElement("provider").apply {
				setAttributeNS(ANDROID_NS, "android:name", PROVIDER_CLASS)
				setAttributeNS(ANDROID_NS, "android:authorities", "$packageName.savefiles")
				setAttributeNS(ANDROID_NS, "android:exported", "true")
				setAttributeNS(ANDROID_NS, "android:grantUriPermissions", "true")
				setAttributeNS(ANDROID_NS, "android:permission", "android.permission.MANAGE_DOCUMENTS")
			}

			val intentFilter = document.createElement("intent-filter")
			val action = document.createElement("action").apply {
				setAttributeNS(ANDROID_NS, "android:name", "android.content.action.DOCUMENTS_PROVIDER")
			}
			intentFilter.appendChild(action)
			provider.appendChild(intentFilter)
			application.appendChild(provider)
		}
	}
}

private val storagePermissionManifestPatch = resourcePatch {
	execute {
		val publicFolder by publicSaveFolderOption
		if (publicFolder != true) return@execute

		document("AndroidManifest.xml").use { document ->
			val manifest = document.documentElement
			val application = document.getElementsByTagName("application").item(0) as org.w3c.dom.Element

			fun addPermission(name: String, maxSdk: Int? = null) {
				val permission = document.createElement("uses-permission").apply {
					setAttributeNS(ANDROID_NS, "android:name", name)
					if (maxSdk != null) setAttributeNS(ANDROID_NS, "android:maxSdkVersion", maxSdk.toString())
				}
				manifest.insertBefore(permission, application)
			}

			addPermission("android.permission.MANAGE_EXTERNAL_STORAGE")
			addPermission("android.permission.WRITE_EXTERNAL_STORAGE", 29)
			addPermission("android.permission.READ_EXTERNAL_STORAGE", 29)
			application.setAttributeNS(ANDROID_NS, "android:requestLegacyExternalStorage", "true")
		}
	}
}

private val saveBackupResourcePatch = resourcePatch {
	execute {
		val packageName = document("AndroidManifest.xml").use { document ->
			val manifest = document.documentElement
			val packageName = manifest.getAttribute("package")
			val application = document.getElementsByTagName("application").item(0) as Element

			val activity = document.createElement("activity").apply {
				setAttributeNS(ANDROID_NS, "android:name", ACTIVITY_CLASS)
				setAttributeNS(ANDROID_NS, "android:exported", "true")
				setAttributeNS(ANDROID_NS, "android:excludeFromRecents", "true")
				setAttributeNS(ANDROID_NS, "android:taskAffinity", "$packageName.savebackup")
				setAttributeNS(ANDROID_NS, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
			}
			application.appendChild(activity)

			val activities = document.getElementsByTagName("activity")
			val launcher = (0 until activities.length)
				.map { activities.item(it) as Element }
				.first { it.getAttributeNS(ANDROID_NS, "name").endsWith("AndroidLauncher") || it.getAttribute("android:name").endsWith("AndroidLauncher") }

			val metaData = document.createElement("meta-data").apply {
				setAttributeNS(ANDROID_NS, "android:name", "android.app.shortcuts")
				setAttributeNS(ANDROID_NS, "android:resource", "@xml/$SHORTCUTS_RESOURCE")
			}
			launcher.appendChild(metaData)

			packageName
		}

		get("res/values/strings.xml", false).apply {
			val text = if (exists()) readText() else "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>"
			val closing = text.lastIndexOf("</resources>")
			if (closing < 0) throw PatchException("res/values/strings.xml has no closing resources tag")

			val strings = mapOf(
				"morphe_export_saves_short" to "Export saves",
				"morphe_export_saves_long" to "Export saves to a backup file",
				"morphe_import_saves_short" to "Import saves",
				"morphe_import_saves_long" to "Import saves from a backup file",
			).entries.joinToString("") { (name, value) -> "\t<string name=\"$name\">$value</string>\n" }

			parentFile.mkdirs()
			writeText(text.substring(0, closing) + strings + text.substring(closing))
		}

		get("res/xml/$SHORTCUTS_RESOURCE.xml", false).apply {
			parentFile.mkdirs()
			writeText(
				"""
				<?xml version="1.0" encoding="utf-8"?>
				<shortcuts xmlns:android="$ANDROID_NS">
					<shortcut
						android:shortcutId="export_saves"
						android:enabled="true"
						android:icon="@mipmap/ic_launcher"
						android:shortcutShortLabel="@string/morphe_export_saves_short"
						android:shortcutLongLabel="@string/morphe_export_saves_long">
						<intent
							android:action="$ACTION_EXPORT"
							android:targetPackage="$packageName"
							android:targetClass="$ACTIVITY_CLASS" />
					</shortcut>
					<shortcut
						android:shortcutId="import_saves"
						android:enabled="true"
						android:icon="@mipmap/ic_launcher"
						android:shortcutShortLabel="@string/morphe_import_saves_short"
						android:shortcutLongLabel="@string/morphe_import_saves_long">
						<intent
							android:action="$ACTION_IMPORT"
							android:targetPackage="$packageName"
							android:targetClass="$ACTIVITY_CLASS" />
					</shortcut>
				</shortcuts>
				""".trimIndent(),
			)
		}
	}
}

@Suppress("unused")
val saveManagementPatch = bytecodePatch(
	name = "Save management",
	description = "Export and import all saves as a zip, keep up to 10 saves of each game, and Undo / Redo. Optional public, uncompressed save files.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(saveFilesProviderManifestPatch, storagePermissionManifestPatch, saveBackupResourcePatch, cloverlordMenuPatch)

	publicSaveFolderOption()
	saveFolderNameOption()
	uncompressedSavesOption()
	saveFileAccessOption()

	execute {
		SaveBackupAvailableFingerprint.returnTrue()

		GameSceneCreateFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/UndoTags;->onSceneCreated(Ljava/lang/Object;)V")
		HeroReadyFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/UndoHistory;->onHeroReady()V")
		HeroReadyFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameSaves;->onHeroReady()V")
		DungeonSwitchLevelFingerprint.method.addInstruction(0, "invoke-static { }, $EXTENSION_PACKAGE/GameSaves;->onLevelSwitch()V")
		DungeonDeleteGameFingerprint.method.addInstruction(0, "invoke-static { p0 }, $EXTENSION_PACKAGE/UndoHistory;->beforeDeleteGame(I)V")
		GameSceneGameOverFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/UndoHistory;->afterGameOver()V")

		if (LocalBackupRestoreConfirmedFingerprint.methodOrNull != null) {
			LocalBackupRestoreConfirmedFingerprint.skipWhen("invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/BackupRestore;->beforeRestore(Ljava/lang/Object;)Z")
			LocalBackupRestoreConfirmedFingerprint.replaceCalls(
				"Lcom/shatteredpixel/shatteredpixeldungeon/Dungeon;->deleteGame(IZ)V",
				"$EXTENSION_PACKAGE/BackupRestore;->deleteGame(IZ)V",
			)
		}

		val uncompressed by uncompressedSavesOption
		if (uncompressed == true) BundleWriteFingerprint.method.addInstruction(0, "const/4 p2, 0x0")

		val publicFolder by publicSaveFolderOption
		if (publicFolder != true) return@execute

		val folderName by saveFolderNameOption
		val folder = folderName!!.trim('/', ' ')

		SaveFolderNameFingerprint.method.addInstructions(
			0,
			"""
				const-string v0, "$folder"
				return-object v0
			""",
		)

		val setDefaults = SetDefaultFilePropertiesFingerprint.method
		val fileType = setDefaults.parameterTypes.first().toString()
		if (!fileType.startsWith("L")) throw PatchException("Unexpected file type parameter: $fileType")

		setDefaults.addInstructions(
			0,
			"""
				invoke-static { p0 }, $LOCATION_CLASS->getFileType(Ljava/lang/Object;)Ljava/lang/Object;
				move-result-object p0
				check-cast p0, $fileType
				invoke-static { p1 }, $LOCATION_CLASS->getBasePath(Ljava/lang/String;)Ljava/lang/String;
				move-result-object p1
			""",
		)

		LauncherOnCreateFingerprint.method.addInstruction(
			0,
			"invoke-static { p0 }, $LOCATION_CLASS->onActivityCreated(Landroid/app/Activity;)V",
		)
		LauncherOnCreateFingerprint.method.addInstruction(0, "invoke-static { }, $EXTENSION_PACKAGE/CrashLog;->install()V")
	}
}
