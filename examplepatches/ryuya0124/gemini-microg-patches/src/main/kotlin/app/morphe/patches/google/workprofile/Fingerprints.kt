package app.morphe.patches.google.workprofile

import app.morphe.patcher.Fingerprint
import app.morphe.patches.google.common.TargetSpec

/**
 * Google アプリ（AGSA）内でセキュアフォルダ（Work Profile）検知時に
 * ブラウザ版へリダイレクト（トランポリン）する Deeplink ハンドラーを特定するプライマリ Fingerprint
 */
class WorkProfileTrampolineFingerprint(spec: TargetSpec) : Fingerprint(
    strings = listOf(
        spec.anchorStrings[0]
    )
)

/**
 * トランポリンをスキップする旨のログ文字列を特定するセカンダリ Fingerprint
 * 将来のバージョンでフォーマット指定子が外れた場合などのフォールバック用
 */
class WorkProfileSkipFingerprint(spec: TargetSpec) : Fingerprint(
    strings = listOf(
        spec.anchorStrings[1]
    )
)
