package app.template.patches.tabletspoof

// 아직 직접 빌드/시험해 보지 못한 추가 기능입니다. 컴파일 에러가 나면 메시지를 알려주세요.
//
// 이 패치는 두 가지 일을 합니다.
// 1) Build.MODEL / Build.MANUFACTURER 를 Galaxy Tab S10 Ultra 값으로 바꾼다. (기존과 동일)
// 2) 앱이 PackageManager#getPackageInfo(...) 로 자기 서명을 조회하는 모든 지점을 찾아,
//    결과의 PackageInfo.signatures 를 원본(패치 전) 서명 인증서로 되돌려 놓는다.
//    (LSPatch 의 서명 우회 "레벨 1"과 같은 목적의 정적 패치 버전)

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val COMPATIBILITY_KAKAOTALK = Compatibility(
    name = "KakaoTalk",
    packageName = "com.kakao.talk",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xFFE812,
    targets = listOf(
        AppTarget(version = null, isExperimental = true)
    )
)

private const val BUILD_CLASS = "Landroid/os/Build;"
private const val EXTENSION_CLASS = "Lapp/template/extension/extension/SignatureSpoof;"
private const val PACKAGE_INFO_TYPE = "Landroid/content/pm/PackageInfo;"

// Galaxy Tab S10 Ultra (Wi-Fi) 로 위장할 값.
// TabletSpoof (LSPosed) 모듈을 APK 분석해서 확인한 값과 동일하게 맞췄다.
private val SPOOFED_BUILD_FIELDS = mapOf(
    "MODEL" to "SM-X920N",
    "MANUFACTURER" to "samsung",
)

@Suppress("unused")
val tabletSpoofPatch = bytecodePatch(
    name = "Spoof device as Galaxy Tab S10 Ultra",
    description = "Spoofs Build.MODEL / MANUFACTURER, and restores the original signing certificate " +
        "wherever the app queries its own signature via PackageManager#getPackageInfo.",
    default = true
) {
    compatibleWith(COMPATIBILITY_KAKAOTALK)

    extendWith("extensions/extension.mpe")

    execute {
        // --- 1) Build 필드 스푸핑 (기존 기능) ---
        SPOOFED_BUILD_FIELDS.forEach { (fieldName, value) ->
            val filter = fieldAccess(smali = "$BUILD_CLASS->$fieldName:Ljava/lang/String;")

            Fingerprint(filters = listOf(filter)).matchAllOrNull()?.forEach { match ->
                match.method.apply {
                    val instructions = implementation!!.instructions
                    for (index in instructions.indices.reversed()) {
                        val instruction = instructions[index]
                        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                            ?: continue
                        if (ref.definingClass != BUILD_CLASS || ref.name != fieldName) continue

                        val register = (instruction as OneRegisterInstruction).registerA
                        replaceInstruction(index, "const-string v$register, \"$value\"")
                    }
                }
            }
        }

        // --- 2) 서명 조회 결과를 원본 인증서로 되돌리기 ---
        // getPackageInfo(...)를 호출하고 PackageInfo 를 돌려받는 모든 지점을 찾는다.
        // 레거시 getPackageInfo(String, int) 와 API 33+ getPackageInfo(String, PackageInfoFlags)
        // 모두 이름/리턴타입이 같으므로 함께 잡힌다.
        val callFilter = app.morphe.patcher.methodCall(
            name = "getPackageInfo",
            returnType = PACKAGE_INFO_TYPE,
        )

        Fingerprint(filters = listOf(callFilter)).matchAllOrNull()?.forEach { match ->
            match.method.apply {
                val instructions = implementation!!.instructions
                // 뒤에서부터 처리해서 인덱스가 어긋나지 않게 한다.
                for (index in instructions.indices.reversed()) {
                    val instruction = instructions[index]
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: continue
                    if (ref.name != "getPackageInfo" || ref.returnType != PACKAGE_INFO_TYPE) continue

                    // 바로 다음 명령이 move-result-object 여야 결과를 받은 레지스터를 알 수 있다.
                    val nextIndex = index + 1
                    if (nextIndex >= instructions.size) continue
                    val next = instructions[nextIndex]
                    if (next.opcode != Opcode.MOVE_RESULT_OBJECT) continue

                    val register = (next as OneRegisterInstruction).registerA

                    // move-result-object 직후에 스푸핑 호출을 끼워 넣는다.
                    addInstructions(
                        nextIndex + 1,
                        """
                            invoke-static {v$register}, $EXTENSION_CLASS->spoof($PACKAGE_INFO_TYPE)$PACKAGE_INFO_TYPE
                            move-result-object v$register
                        """.trimIndent()
                    )
                }
            }
        }
    }
}