package app.yydarlinker.aicaptions.settings;

import android.content.Context;

/** The texts of the UI, read from the string resources of the patched app. */
public final class CaptionStrings {
    private CaptionStrings() {}

    /** The text of [key] in the language of the app. */
    public static String get(Context context, String key) {
        return CaptionTextResolver.string(context, key);
    }

    /**
     * Messages that the code raises in Chinese (errors of the API, of the settings) are authored
     * constants. They are shown in the language of the UI by looking up their exact text here; any
     * other text, such as what a provider answered or the user typed, is never changed.
     */
    public static String localize(Context context, CharSequence value) {
        if (value == null) return "";
        String source = value.toString();
        for (String[] entry : SOURCES) {
            if (source.equals(entry[0])) return get(context, entry[1]);
        }
        return source;
    }

    private static final String[][] SOURCES = {
        {"源分组模型（可选）", "planner_model"},
        {"留空使用翻译模型；仅在同一 API 地址与 Key 下调用，不自动选择其他模型", "planner_model_hint"},
        {
            "Invalid API URL: use an HTTP(S) OpenAI-compatible base URL without credentials or"
                    + " fragments",
            "api_address_invalid"
        },
        {"选择方案后立即生效，可在下方编辑；其他方案保留。新方案不复制密钥，请先填写地址、密钥和模型。", "profiles_summary"},
        {"在播放器弹出菜单中显示快捷开关；隐藏不关闭 AI 字幕，下次打开菜单生效", "flyout_summary"},
        {"填写 API 地址和 API Key 后会自动获取；仍可手动输入", "model_hint"},
        {"API 地址必须以 https:// 或 http:// 开头", "message_bafa7b1ca6cb"},
        {"只删除本机加密保存的 API Key，不修改其他设置。", "message_6ec744dcc83a"},
        {"根据 API 地址和 Key 自动获取，也可手动输入", "model_hint"},
        {"已启用；从自动翻译选择任意语言即可启动 AI 字幕", "message_2c107e436145"},
        {"原字幕可直接显示；自动翻译需填写 API Key", "message_1cc3c4b0aab0"},
        {"各方案独立保存；清空恢复随界面语言变化的默认要求", "prompt_summary"},
        {"请先填写 API Key；模型也可手动输入", "configure_api"},
        {"仅自动翻译模式调用 API；原字幕原文显示", "message_33c08bcbc79b"},
        {"Shorts 弹出菜单中的 AI 字幕开关", "shorts_flyout_title"},
        {"关闭后使用 YouTube 原生字幕显示", "message_7b7480271fa5"},
        {"可点“刷新”重试，或直接输入模型 ID", "model_hint"},
        {"时间参照与异常（独立保留，含时间戳）：", "message_dedc85cbb813"},
        {"请先配置 API，再启用 AI 翻译", "configure_api"},
        {"可从下方选择，也可手动输入模型 ID", "model_hint"},
        {"普通视频弹出菜单中的 AI 字幕开关", "flyout_title"},
        {"排查时记录字幕原文与译文，默认关闭", "message_261f1c6f0fde"},
        {"编辑时可见；关闭页面清空，加密保存", "message_10d1b374429d"},
        {"请输入 1–60 个字符的方案名称", "profile_name_error"},
        {"自动获取可用模型，也支持手动输入", "model_hint"},
        {"恢复竖直位置，保留字号和背景设置", "message_fd1ada5395a0"},
        {"Shorts / 视频详情页字高", "size"},
        {"请在字幕菜单选择自动翻译语言", "choose_translation"},
        {"已加密保存，不回显原 Key", "key_saved"},
        {"字幕已恢复水平居中的默认位置", "message_a25bd037963d"},
        {"最多可保存 30 套配置方案", "profile_limit"},
        {"清除本方案的 API Key", "profile_clear_key"},
        {"切换失败，已恢复原来的模式", "switch_failed"},
        {"关闭时不记录字幕原文与译文", "message_f496dd228d0b"},
        {"可选择模型或直接输入 ID", "model_hint"},
        {"选择模型或输入模型 ID", "model_hint"},
        {"请选模型或直接输入 ID", "model_hint"},
        {"请先填写 API Key", "enter_key"},
        {"API Key 应为单行", "message_7da9039cc193"},
        {"原字幕（零翻译 API）", "message_375e0f929195"},
        {"请输入 API Key", "enter_key"},
        {"已加密保存；输入可替换", "key_saved"},
        {"删除 API Key？", "message_1f328bc723d4"},
        {"API Key 已删除", "message_574dd3f1ccfe"},
        {"正在重新获取模型列表…", "message_ec966cf35a63"},
        {"正在自动获取模型列表…", "message_462efc3e98ef"},
        {"获取失败，可手动输入：", "message_2d61f9891514"},
        {"启用 AI 字幕翻译", "enable_ai"},
        {"删除 API Key", "delete_key"},
        {"使用 YouTube", "use_youtube"},
        {"API 测试失败：", "message_88ce10e8f20b"},
        {"恢复字幕默认位置", "reset_position"},
        {"模型自动保存失败", "message_b795d97808e8"},
        {"；保留上次有效值", "message_8500e82ca181"},
        {"API 配置方案", "profiles_title"},
        {"AI 字幕翻译", "ai_title"},
        {"API Key", "api_key"},
        {"AI 字幕诊断", "diagnostics"},
        {"字幕缓存已清除", "message_e8b2177e1cd3"},
        {"API 可用：", "message_3a1185c1dc9f"},
        {"API 配置", "api_config"},
        {"API 地址", "api_address"},
        {"测试 API", "test_api"},
        {"背景不透明度", "opacity"},
        {"清除字幕缓存", "clear_cache"},
        {"清空诊断记录", "clear_diagnostics"},
        {"模型不可为空", "model_hint"},
        {"字幕链路诊断", "diagnostics"},
        {"收起字幕诊断", "collapse"},
        {"展开字幕诊断", "expand"},
        {"自动保存失败", "message_bbbcd9c8bf80"},
        {"模型不能为空", "model_empty"},
        {"缓存与诊断", "cache_diagnostics"},
        {"使用 AI", "use_ai"},
        {"选择模型：", "model_hint"},
        {"未知设置项", "message_9a6606c64f5f"},
        {"诊断已复制", "message_896c4b51d7e9"},
        {"列表已更新", "message_17ea5266e7a5"},
        {"当前模式：", "message_8736a99d18f2"},
        {"最近阶段：", "message_44feb4d98d48"},
        {"最近链路：", "message_30070c30d85c"},
        {"选择模型（", "model"},
        {"翻译要求", "translation_requirements"},
        {"字幕样式", "style"},
        {"字幕大小", "size"},
        {"字幕诊断", "diagnostics"},
        {"重新获取", "refresh"},
        {"测试中…", "message_49562bf14c82"},
        {"自动翻译", "message_0825b4b0cb7d"},
        {" 秒前）", "message_33cc168ccb4e"},
        {"原有配置", "profile_default"},
        {"方案名称", "profile_name"},
        {"新增方案", "profile_add"},
        {"翻译中…", "caption_translating"},
        {"引擎：", "message_dd0fb9f395bc"},
        {"（约 ", "message_c34848823d86"},
        {"重命名", "profile_rename"},
        {"模型", "model"},
        {"翻译", "translation"},
        {"刷新", "refresh"},
        {"复制", "copy"},
        {"展开", "expand"},
        {"收起", "collapse"},
        {"取消", "cancel"},
        {"删除", "delete"},
        {"开启", "on"},
        {"关闭", "off"},
        {"超小", "size_tier_xs"},
        {"标准", "size_tier_standard"},
        {"超大", "size_tier_xl"},
        {"开", "on"},
        {"关", "off"},
        {"小", "size_tier_s"},
        {"大", "size_tier_l"}
    };
}
