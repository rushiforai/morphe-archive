package app.morphe.extension.pixiv.ui

import java.util.Locale

/** User-facing text of the Pixiv-Patched page, following the language of the app. */
object Strings {

    private val language: String = Locale.getDefault().language

    private fun pick(chinese: String, japanese: String, english: String): String = when {
        language.startsWith("zh") -> chinese
        language == "ja" -> japanese
        else -> english
    }

    val pageTitle: String get() = "Pixiv-Patched"

    val statusSection: String get() = pick("状态", "状態", "Status")
    val premium: String get() = pick("高级功能模拟", "プレミアム機能の再現", "Premium emulation")
    val adblock: String get() = pick("广告拦截", "広告ブロック", "Ad blocking")
    val aiFlag: String get() = pick("AI 作品标记", "AI作品のマーク", "AI work flagging")
    val historyCount: String get() = pick("本地浏览记录", "ローカル閲覧履歴", "Local browsing history")
    val enabled: String get() = pick("已开启", "有効", "On")

    val historySection: String get() = pick("本地浏览记录", "ローカル閲覧履歴", "Browsing history")
    val historyEmpty: String get() = pick(
        "还没有记录。打开任意插画或小说后会自动记录在这里。",
        "まだ記録がありません。イラストや小説を開くと自動で記録されます。",
        "Nothing yet. Open any illustration or novel and it will show up here."
    )
    val clearHistory: String get() = pick("清空本地记录", "履歴を消去", "Clear history")
    val historyCleared: String get() = pick("已清空本地记录", "履歴を消去しました", "History cleared")
    val countSuffix: String get() = pick("条", "件", "entries")
    val kindIllust: String get() = pick("插画", "イラスト", "Illustration")
    val kindNovel: String get() = pick("小说", "小説", "Novel")

    val historyIllustTab: String get() = pick("漫画", "マンガ", "Manga")
    val historyNovelTab: String get() = pick("小说", "小説", "Novels")
    val historyEmptyIllust: String get() = pick(
        "还没有漫画记录。打开任意插画或漫画后会自动记录在这里。",
        "マンガの記録はまだありません。イラストやマンガを開くと自動で記録されます。",
        "No manga yet. Open any illustration or manga and it will show up here."
    )
    val historyEmptyNovel: String get() = pick(
        "还没有小说记录。打开任意小说后会自动记录在这里。",
        "小説の記録はまだありません。小説を開くと自動で記録されます。",
        "No novels yet. Open any novel and it will show up here."
    )

    val settingsSection: String get() = pick("设置", "設定", "Settings")
    val aiSettingsEntry: String get() = pick("AI 作品显示设置", "AI作品の表示設定", "AI work display settings")
    val aiSettingsHint: String get() = pick(
        "缩略图变暗、隐藏 AI 作品、屏蔽 AI 作者与标签黑名单",
        "サムネイルを暗くする・AI作品を隠す・AI作者のブロック・タグのブラックリスト",
        "Dim thumbnails, hide AI works, block AI artists, tag blacklist"
    )

    val aiTitle: String get() = pick("AI 作品过滤设置", "AI作品フィルター設定", "AI Work Filter Settings")
    val aiDisplaySection: String get() = pick("显示偏好", "表示設定", "DISPLAY PREFERENCES")
    val aiHideWorks: String get() = pick("完全隐藏 AI 作品", "AI作品を完全に非表示", "Hide AI Works Completely")
    val aiHideWorksDesc: String get() = pick(
        "从信息流直接去掉 AI 作品，而不是用 [AI] 角标压暗。",
        "フィードからAI作品を取り除きます（[AI]バッジで暗くする代わり）。",
        "Completely remove AI works from feeds instead of dimming them with [AI] badge."
    )
    val aiAutoBlock: String get() = pick("自动屏蔽 AI 作者", "AI作者を自動ブロック", "Auto-Block AI Artists")
    val aiAutoBlockDesc: String get() = pick(
        "自动记录投稿 AI 作品的账号，隐藏其当前与今后的全部作品。",
        "AI作品を投稿したアカウントを記録し、現在と今後の作品をすべて非表示にします。",
        "Automatically record accounts that post AI works to hide all their current and future works."
    )
    val aiBlockedSection: String get() = pick("已屏蔽作者", "ブロック中の作者", "BLOCKED ARTISTS")
    val aiSubstringSection: String get() = pick("标签黑名单（包含匹配）", "タグブラックリスト（部分一致）", "SUBSTRING TAG BLOCKLIST")
    val aiExactSection: String get() = pick("标签黑名单（完全匹配）", "タグブラックリスト（完全一致）", "EXACT TAG BLOCKLIST")
    val aiWhitelistSection: String get() = pick("标签白名单（永不标记）", "タグホワイトリスト（除外）", "TAG WHITELIST (NEVER FLAGGED)")
    val aiAddKeyword: String get() = pick("添加关键词…", "キーワードを追加…", "Add keyword...")
    val aiAddExact: String get() = pick("添加标签…", "タグを追加…", "Add exact tag...")
    val aiAddWhitelist: String get() = pick("添加白名单标签…", "ホワイトリストに追加…", "Add whitelist tag...")
    val aiAdd: String get() = pick("添加", "追加", "Add")
    val aiClearAll: String get() = pick("全部清除", "すべて解除", "Clear All")
    val aiClearTitle: String get() = pick("清除已屏蔽作者", "ブロック作者を解除", "Clear Blocked Artists")
    val aiClearConfirm: String get() = pick("确定要解除全部自动屏蔽的作者吗？", "自動ブロックした作者をすべて解除しますか？", "Are you sure you want to unblock all auto-blocked artists?")
    val aiCleared: String get() = pick("已清除屏蔽列表", "ブロックリストを解除しました", "Blocked artists list cleared")
    val aiResetTags: String get() = pick("重置默认标签", "タグを初期化", "Reset Default Tags")
    val aiResetTitle: String get() = pick("重置标签", "タグを初期化", "Reset Tags")
    val aiResetConfirm: String get() = pick("恢复默认的标签黑名单并清空白名单？", "タグブラックリストを初期化し、ホワイトリストを空にしますか？", "Restore default tag blocklists and clear the whitelist?")
    val aiResetDone: String get() = pick("标签已恢复默认", "タグを初期化しました", "Tags reset to defaults")
    val aiReset: String get() = pick("重置", "初期化", "Reset")
    val aiCancel: String get() = pick("取消", "キャンセル", "Cancel")
    val aiClear: String get() = pick("清除", "解除", "Clear")

    fun aiBlockedCount(count: Int): String =
        pick("已屏蔽作者：$count", "ブロック中の作者：$count", "Blocked Artists: $count")

    val novelCopyTitle: String get() = pick("复制标题", "タイトルをコピー", "Copy title")
    val novelCopyAuthor: String get() = pick("复制作者", "作者名をコピー", "Copy author")
    val novelDownloadText: String get() = pick("下载全文", "本文をダウンロード", "Download full text")
    val novelCopied: String get() = pick("已复制", "コピーしました", "Copied")
    val novelCopyFailed: String get() = pick("操作失败", "操作に失敗しました", "That did not work")
    val novelNothingToCopy: String get() = pick("没有可复制的文字", "コピーできる文字がありません", "Nothing to copy")
    val novelDownloadDone: String get() = pick("已保存到下载目录", "ダウンロードフォルダに保存しました", "Saved to Downloads")
    val novelDownloadFailed: String get() = pick("保存失败", "保存に失敗しました", "Could not save the file")
    val novelDownloadUnsupported: String get() =
        pick("需要 Android 10 以上才能写入下载目录", "Android 10 以降で利用できます", "Saving to Downloads needs Android 10 or newer")
}
