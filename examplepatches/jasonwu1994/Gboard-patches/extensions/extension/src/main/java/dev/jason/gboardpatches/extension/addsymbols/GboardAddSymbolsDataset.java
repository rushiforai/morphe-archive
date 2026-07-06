package dev.jason.gboardpatches.extension.addsymbols;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class GboardAddSymbolsDataset {
    public static final String KEY_POPULAR = "POPULAR";
    public static final String KEY_COMMON = "COMMON";
    public static final String KEY_TYPOGRAPHY = "TYPOGRAPHY";
    public static final String KEY_PEOPLE = "PEOPLE";
    public static final String KEY_ANIMALS = "ANIMALS";
    public static final String KEY_STARS = "STARS";
    public static final String KEY_ARROWS = "ARROWS";
    public static final String KEY_SHAPES = "SHAPES";
    public static final String KEY_MATHEMATICS = "MATHEMATICS";
    public static final String KEY_LANGUAGE = "LANGUAGE";
    public static final String KEY_CURRENCY = "CURRENCY";

    public static final String[] CATEGORY_KEYS = {
            KEY_POPULAR,
            KEY_COMMON,
            KEY_TYPOGRAPHY,
            KEY_PEOPLE,
            KEY_ANIMALS,
            KEY_STARS,
            KEY_ARROWS,
            KEY_SHAPES,
            KEY_MATHEMATICS,
            KEY_LANGUAGE,
            KEY_CURRENCY
    };

    private static final String[] POPULAR_SYMBOLS = splitSymbols(
            "ღ • ⁂ € ™ ↑ → ↓ ⇝ √ ∞ ░ ▲ ▶ ◀ ● ☀ ☁ ☂ ☃ ☄ ★ ☆ ☉ ☐ ☑ ☚ ☛ ☜ ☝ ☞ ☟ ☠ ☢ ☣ ☪ ☮ ☯ ☸ ☹ ☺ ☻ ☼ ☽ ☾ ♔ ♕ ♖ ♗ ♘ ♚ ♛ ♜ ♝ ♞ ♟ ♡ ♨ ♩ ♪ ♫ ♬ ✈ ✉ ✎ ✓ ✔ ✘ ✚ ✞ ✟ ✠ ✡ ✦ ✧ ✩ ✪ ✮ ✯ ✹ ✿ ❀ ❁ ❂ ❄ ❅ ❆ ❝ ❞ ❣ ❤ ❥ ❦ ➤"
    );

    private static final String[] COMMON_SYMBOLS = splitSymbols(
            "♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟"
                    + " ♩ ♪ ♫ ♬ ♭ ♮ ♯ 𝄞 𝄡 𝄢 𝄪 𝄫 🎵 🎶 🎼 𓏢"
                    + " ϟ ☀ ☁ ☂ ☃ ⛆ ⛇ ⛈︎ ☄ ☉ ☼ ☽ ☾ ♁ ♨ ❄ ❅ ❆ ༄ ࿓ 𐓷 𐓏 𖤓 𖣔"
                    + " © ® ℗ ℠ ™ ℡ ℻ ℀ ℁ ℅ ℆"
                    + " ☏ ✁ ✂ ✃ ✄ ✆ ✇ ✈ ✉ ✎ ✏ ✐ ✑ ✒ 𓍝 ⚐ ⚑ ⚖ ⚗ ⚿ ⛟ ⛨ ⛫ ⛾ ⛿ ⎈ ࿄ 𖠦 𖠿 ꗃ 𓄲 𓊔 𖤘 𖣘 ߷ 𖠚 𖠜 𖡡 𖥣 𖥔 𖥠 ⌖ ⊹ 𓊝 𖠎 𖡌 𖣳 𖤠 𖥈 𖥩 𖧶 ꚰ ⛀ ⛁ ⛂ ⛃"
                    + " ⏎ ⇧ ⏏ ⌂ ⌘ ⎋ ⊞ ⌨ ↹ ⌥ ⌫  ⎗ ⎘ ⎙ ⎵ ⇥"
                    + " ☺︎ ☹︎ ☠︎ ❣︎ ❤︎ ☘︎ ⛸︎ ♠︎ ♥︎ ♦︎ ♣︎ ♟︎ ⛷︎ ⛰︎ ⛩︎ ♨︎ ⛴︎ ✈︎ ☀︎ ⏱︎ ⏲︎ ☁︎ ⛈︎ ☂︎ ⛱︎ ❄︎ ☃︎ ☄︎ ⛑︎ ☎︎ ⌨︎ ✏︎ ✒︎ ✉︎ ✂︎ ⛏︎ ⚒︎ ⚔︎ ⚙︎ ⚖︎ ⛓︎ ⚗︎ ⚰︎ ⚱︎ ⚠︎ ☢︎ ☣︎ ⬆︎ ↗︎ ➡︎ ↘︎ ⬇︎ ↙︎ ⬅︎ ↖︎ ↕︎ ↔︎ ↩︎ ↪︎ ⤴︎ ⤵︎ ⚛︎ ✡︎ ☸︎ ☯︎ ✝︎ ☦︎ ☪︎ ☮︎ ▶︎ ⏭︎ ⏯︎ ◀︎ ⏮︎ ⏸︎ ⏹︎ ⏺︎ ⏏︎ ♀︎ ♂︎ ⚧︎ ✖︎ ♾︎ ‼︎ ⁉︎ ⚕︎ ♻︎ ⚜︎ ☑︎ ✔︎ 〽︎ ✳︎ ✴︎ ❇︎ ©︎ ®︎ ™︎ 🅰︎ 🅱︎ ℹ︎ Ⓜ︎ 🅾︎ 🅿︎ 🈂︎ 🈷︎ ㊗︎ ㊙︎ ◼︎ ◻︎ ▪︎ ▫︎"
                    + " ⛐ ⛍ ⛕ ⛖ ⛗ ⛘ ⛙ ⛜ ⛠ ⛚ ⛛ ⛞ ⛡ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹ ♺ ♻ ♼ ♽ ⚬ ⚭ ⚮ ⚯ ⛻ ⛼ ⛬ ⛭ ⛮ ⛯"
                    + " ☰ ≡ Ξ ㊂ ≣ ⁝ ⋮ ︙ ⦙ ⁞ ⋯ … ∷ ▲ ▼ ▶ △ ▽ ▷ ⌃ ⌄ ︿ ﹀ ︽ ︾ ⌵ 𓏬 𓃑 𓏧 ⸬ ⛶"
                    + " ♓ ♒ ♑ ♐ ♏ ♎ ♍ ♌ ♋ ♊ ♉ ♈ ☉ ☽ ☿ ♀ ⊕ ♁ ♂ ♃ ♄ ♅ ⛢ ♆ ♇"
                    + " ✓ ✔ ✖ ✗ ✘ ∛ ∜ ⍻ ☐ ☑ ☒ □ ■ ○ ● ༝ ྾ ∨ 🆅 🆇 🅥 🅧 ⊗"
                    + " ♡ ♢ ♤ ♧ ♣ ♦ ♥ ♠ 🂠 🂡 🂢 🂣 🂤 🂥 🂦 🂧 🂨 🂩 🂪 🂫 🂬 🂭 🂮 🂱 🂲 🂳 🂴 🂵 🂶 🂷 🂸 🂹 🂺 🂻 🂼 🂽 🂾 🃁 🃂 🃃 🃄 🃅 🃆 🃇 🃈 🃉 🃊 🃋 🃌 🃍 🃎 🃑 🃒 🃓 🃔 🃕 🃖 🃗 🃘 🃙 🃚 🃛 🃜 🃝 🃞 🃟"
                    + " ⚀ ⚁ ⚂ ⚃ ⚄ ⚅"
                    + " μ ° ℃ ℉ ㎍ ㎎ ㎏ ℥ ㏌ ㎚ ㎛ ㎜ ㎝ ㎞ ² ³ ㎖ ㎗ ㎘ ㏄ ㏖ ㏒ ㎅ ㎆ ㎇ ㎈ ㎉ ㎐ ㎑ ㎒ ㎓ ㎾ Ω ㏑ ㏈ ㏐ ㏂ ㏘ ㎳ ㎭ ㏅ ㎪ ㏗ ′ ″"
                    + " Ⅰ Ⅱ Ⅲ Ⅳ Ⅴ Ⅵ Ⅶ Ⅷ Ⅸ Ⅹ Ⅺ Ⅻ ⅰ ⅱ ⅲ ⅳ ⅴ ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ ⅻ ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ➊ ➋ ➌ ➍ ➎ ➏ ➐ ➑ ➒ ➓ ⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⓿ ❶ ❷ ❸ ❹ ❺ ❻ ❼ ❽ ❾ ❿ ㈠ ㈡ ㈢ ㈣ ㈤ ㈥ ㈦ ㈧ ㈨ ㈩ ㊀ ㊁ ㊂ ㊃ ㊄ ㊅ ㊆ ㊇ ㊈ ㊉ ０ １ ２ ３ ４ ５ ６ ７ ８ ９ 𝟬 𝟭 𝟮 𝟯 𝟰 𝟱 𝟲 𝟳 𝟴 𝟵"
    );

    private static final String[] TYPOGRAPHY_SYMBOLS = splitSymbols(
            "˙ ‥ ‧ ‵ 、 。 ﹐ ﹒ ﹔ ﹕ ！ ＃ ＄ ％ ＆ ＊ ， ． ： ； ？ ＠ ～ • … · .ᐟ ¡ ¿ ¦ ¨ ¯ ´ · ¸ º ‽ ‼ ⁏ ※ † ‡ ˉ ˘ ⁇ ⁈ ⁉ ˆ ⁊ ⸘ №"
                    + " 〈 〉 《 》 「 」 『 』 【 】 〔 〕 ︵ ︶ ︷ ︸ ︹ ︺ ︻ ︼ ︽ ︾ ︿ ﹀ ﹁ ﹂ ﹃ ﹄ ﹙ ﹚ ﹛ ﹜ ﹝ ﹞ ﹤ ﹥ （ ） ＜ ＞ ｛ ｝ ❬ ❭ ❮ ❯ ❰ ❱ 〖 〗 〘 〙 〚 〛 〈 〉 ‹ › « » ｢ ｣ ⌃ ⌄ ⌵ ⌢ ⌣ ⎴ ⏜ ⏝ ⏞ ⏟ ⏠ ⏡"
                    + " \" ' « » ‘ ’ ‚ ‛ “ ” „ ‟ ‹ › ❛ ❜ ❝ ❞ 〝 〞 〟 〃 ＂ ＇ ′ ″ ‴ ⁗ ‵ ‶ ‷ ` ˊ"
                    + " § ¶ ❡ ⁋ ※"
                    + " █ ▀ ▄ ▌ ▐ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ ▖ ░ ▒ ▓ ◼ ● ⬛ ⬜ ⚫ ⚪"
    );

    private static final String[] PEOPLE_SYMBOLS = splitSymbols(
            "𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 𓀧 𓀨 𓀩 𓀪 𓀫 𓀬 𓀀 𓀁 𓀂 𓀃 𓀄 𓀅 𓀆 𓀇 𓀈 𓀉 𓀊 𓀋 𓀌 𓀍 𓀎 𓀏 𓀑 𓀒 𓀓 𓀔 𓀕 𓀖 𓀗 𓀘 𓀙 𓀚 𓀛 𓀜 𓀝 𓁁 𓁂 𓁃 𓁄 𓁅 𓁆 𓁇 𓁈 𓁉 𓁊 𓁋 𓁌 𓁍 𓁎 𓁏 𓁐 𓁑 𓁒 𓁓 𓁔 𓁕 𓁖 𓁗 𓁘 𓁙 𓀭 𓀮 𓀯 𓀰 𓀱 𓀲 𓀳 𓀴 𓀵 𓀶 𓀷 𓀸 𓀹 𓀺 𓀻 𓀼 𓀽 𓀾 𓀿 𓁀 𓁲 𓁚 𓁛 𓁜 𓁝 𓁞 𓁟 𓁠 𓁡 𓁢 𓁣 𓁤 𓁥 𓁦 𓁧 𓁨 𓁩 𓁪 𓁫 𓁬 𓁭 𓁮 𓁯 𓁰 𓁱 𓁳 𓁴 𓁵"
                    + " ☹ ☺ ☻ 〠 ヅ ツ ㋡ 쓰 ü ت ⍢ ⍨ ᴗ̈ ⚇ ⚉ 𓁷 𓁶 𓂈 𓂎 ဩ ඩ 𖥶 𖦆 𖠔 𖤑 冏 웃 유 𖧀 𖠋 𖨆 ⶆ 𖦔 𖤾 𖦯 𖧱"
                    + " 𓂀 𓁿 𓁾 𓁽 𓁼 𓁻 𓁺 𓁹 𓂉 𓂊 𓎲 𓎱 ಠ ʘ ಥ இ ຈ Ꙩ ꙩ ⚆ ◠ ◕ 𓏗 ⊙ ⊚ ◉ ◎ ☉ ⦾ ⦿ 𖠂 𖥕 𖥂 𖧼 ༎ຶ"
                    + " ⚤ ♂ ♀ ☿ ⚣ ⚥ ⚦ ⚧ ⚨ ⚢ ⚲"
                    + " ♡ ♥ ❣ ❤ ❦ ❧ ❥ ☙ დ ღ ო ᦂ ᦦ ʚ ɞ Ꮼ"
                    + " ☚ ☛ ☜ ☝ ☞ ☟ ✌ 𓂬 𓂩 𓂨 𓂷 𓂭 𓂝 𓂡 𓂦 𓃈 ⍝"
                    + " ☤ ☥ ☪ ☫ ☬ ☮ ☭ ☯ ☸ ☽ ☾ ♰ ♱ ⚚ ✡ 卍 ﷽ ✵ ૐ 𓉴 𓉸 ۞ ࿊ ۩ ࿅ ࿉ ࿈"
                    + " ✝ ✞ ✠ ☦ ✙ ✜ ✟ ✚ ☧ ☨ ☩ ✛ ✢ ⛪ † ⚜"
                    + " 𖣐 𖠦 𖡷 𖢅 𖣴 𖣔 𖣓 𖤌 𖣘 𖣁 𖢘 𖤍 ༒ ༄ ༅ ࿓ ༗ 𓊈 𓊉 𓊆 𓊇 ⩨ ⩩ ༚ ༛ ༜ ༝ ༞ ༟ ࿎ ࿏ 𖡼 ⋱ ⋰ 𖡻 𖡟 𖡤 𖡥 𖡦 𖡧 𖡽 𖣢 𖤗 𖤝 𖤞 𖤫 𖤼 𖥂 𖥅 𖥑 𖥓 𖥖 𖥗 𖥘 𖥙 𖥚 𖥟 𖥤 ⩨ ⩩ 𒀺 𒀹 𒍻 𒑠 𒁹 𒀸 𒅂 𒁂 𒇹 𒌋 𒑱 𒌍 𒉼 𒈱 𒈝 𒈞 𒐆 𒆳 𒍞 𒑴 𒀭 𒀮 𒀯 𒆙 𒆜 𒉺 𒌑 𒀽 𒆸 𒇻 𒁈 𒇔 𒐦 𒐤 𒐪 𒐬 𒐮 𒐰 𒀱 𒅒 𒋲 𒂭 𒇫 𒍟 𒅄 ဪ ꧅ 𒐫"
    );

    private static final String[] ANIMALS_SYMBOLS = splitSymbols(
            "𖠊 𖢥 𖠌 𖠍 𖠐 𖠅 ଳ ꙮ 𖠽 𖡉 𖢘 𖠑 𖠒 𖡒 𖢂 𖤖 𖠓 𓃥 𓃠 𓃰 𓃱 𓃯 𓃭 𓃸 𓃵 𓃗 𓃘 𓃙 𓃟 𓄀 𓄁 𓄂 𓄃 𓃚 𓃛 𓃜 𓃝 𓃞 𓃒 𓃓 𓃔 𓃕 𓃖 𓃡 𓃢 𓃦 𓃩 𓃫 𓃬 𓃮 𓃲 𓃴 𓃶 𓃷 𓃹 𓃻 𓃽 𓃾 𓃿 𓄄 𓄅 𓄆 𓄇 𓆇 𓆈 𓆉 𓆌 𓆏 𓆗 𓆘 𓆙 𓆚 𓆐 𓆑 𓆒 𓆓 𓆔 𓆕 𓆖 𓆊 𓆍 𓆣 𓆤 𓆥 𓆦 𓆧 𓆨 𓆛 𓆜 𓆝 𓆞 𓆟 𓆠 𓆡 𓆢 𓄿 𓅀 𓅁 𓅂 𓅃 𓅄 𓅅 𓅆 𓅇 𓅈 𓅉 𓅊 𓅋 𓅌 𓅍 𓅎 𓅏 𓅐 𓅑 𓅒 𓅓 𓅔 𓅕 𓅖 𓅗 𓅘 𓅙 𓅚 𓅛 𓅜 𓅝 𓅞 𓅟 𓅠 𓅡 𓅢 𓅣 𓅤 𓅥 𓅦 𓅧 𓅨 𓅩 𓅪 𓅫 𓅬 𓅭 𓅮 𓅯 𓅰 𓅱 𓅲 𓅳 𓅴 𓅵 𓅶 𓅷 𓅸 𓅹 𓅺 𓅻 𓅼 𓅽 𓅾 𓅿 𓆀 𓆁 𓆂 𓆃 𓆆"
    );

    private static final String[] STARS_SYMBOLS = splitSymbols(
            "★ ☆ ✡ ✦ ✧ ⌑ ✩ ✪ ⍟ ❂ ✫ ✬ ✭ ✮ ✯ ✰ ☪ ⚝ ⛤ ⛥ ⛦ ⛧ ⍣ ⋆ ≛ 𓇼 𓇻 𓇽 ꙳ ⭑ ⭒ 𖤐 𖣔 ⟡ ⟢ ⟣ ⊹"
                    + " * ∗ ٭ ※ ⁂ ⁎ ⁑ ⁕ ⃰ ⊛ ☸ ❋ ✱ ✲ ✳ ✴ ✵ ✶ ✷ ✸ ✹ ✺ 𖡽 𖥤 𖥟 𖡟 𖤗 ✽ ⧆ ＊ ﹡ ＊ † ‡ 𒀭 𒀯 𒄬"
                    + " ✻ ✼ ✾ ✿ ❀ ❁ ❃ ❇ ❈ ❉ ❊ ✢ ✣ ✤ ✥ ⚜ ꕥ 𓇬 ⚘ 𓆸 𓆹 𓆼 𓇊 𓇚 𓇕 𓇗 𓋇 𓁙 𓁋 ֍ ֎ 𓆭 𓆰 𓆱 𓇋 𓇑 𓇛 𓇟 𓇣 𖧷 ꕤ 𑁍 ᪥ 𖠁 𖠇 𖤣 𖤥 𖡗 𖢨 𖣶 𖦞 𖧧 ༗ 𖣂 𖠺 𖠻 𓄟 𖢔 𐌙 𐊵 𐡘 𐡙 𐡚 ꧁ ꧂ 𒂭"
    );

    private static final String[] ARROWS_SYMBOLS = splitSymbols(
            "⬅ ⬆ ⬇ ⮕ ⬈ ⬉ ⬊ ⬋ ⬌ ⬍ ⭠ ⭡ ⭢ ⭣ ⭤ ⭥ ⮂ ⮃ ⮐ ⮑ ⬎ ⬏ ⬐ ⬑ ⬱ ⬳ ⬸ ⬿ ⭅ ⭆ ↕ ↖ ↗ ↘ ↙ ↚ ↛ ↜ ↝ ↞ ↟ ↠ ↡ ↢ ↣ ↤ ↥ ↦ ↧ ↨ ↩ ↪ ↫ ↬ ↭ ↮ ↯ ↰ ↱ ↲ ↳ ↴ ↶ ↷ ↸ ↹ ↺ ↻ ⟲ ⟳ ↼ ↽ ↾ ↿ ⇀ ⇁ ⇂ ⇃ ⇄ ⇅ ⇆ ⇇ ⇈ ⇉ ⇊ ⇋ ⇌ ⇍ ⇎ ⇏ ⇕ ⇖ ⇗ ⇘ ⇙ ⇚ ⇛ ⇜ ⇝ ⇞ ⇟ ⇠ ⇡ ⇢ ⇣ ⇤ ⇥ ⇦ ⇧ ⇨ ⇩ ⇪ ⌅ ⌆ ⌤ ⏎ ▶ ☇ ☈ ➔ ➘ ➙ ➚ ➛ ➜ ➝ ➞ ➟ ➠ ➡ ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➩ ➪ ➫ ➬ ➭ ➮ ➯ ➱ ➲ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ ➻ ➼ ➽ ➾ ⤴ ⤵ ↵ ↓ ↔ ← → ↑ ⍇ ⍈ ⍐ ⍗ ⇫ ⇬ ⇭ ⇮ ⇯ ⇰ ⇱ ⇲ ⇳ ⇴ ⇵ ⇶ ⇷ ⇸ ⇹ ⇺ ⇻ ⇼ ⇽ ⇾ ⇿ ⇐ ⇑ ⇒ ⇓ ⇔ 𖣫 𖤂 ⬀ ⬁ ⬂ ⬃ ⬄"
    );

    private static final String[] SHAPES_SYMBOLS = splitSymbols(
            "∎ ⊞ ⊟ ⊠ ⊡ ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ■ □ ▢ ▣ ▤ ▥ ▦ ▧ ▨ ▩ ▪ ▫ ▬ ▭ ▮ ▯ ◘ ◙ ◚ ◛ ◧ ◨ ◩ ◪ ◫ ❏ ❐ ❑ ❒ ❘ ❙ ❚ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ ◰ ◱ ◲ ◳ 𖣯 ⿴ ⿻"
                    + " ⊿ ▲ △ ▴ ▵ ▶ ▷ ▸ ▹ ► ▻ ▼ ▽ ▾ ▿ ◀ ◁ ◂ ◃ ◄ ◅ ◢ ◣ ◤ ◥ ◬ ◭ ◮ ◸ ◹ ◺ ◿ ∇ ∆ 𓇮 ⫷ ⫸"
                    + " ˍ ‐ ⎯ ‒ ― ⎺ ⎻ ⎼ ⎽ ‗ ‖ ─ ━ │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ╌ ╍ ╎ ╴ ╵ ╶ ╷ ╸ ╹ ╺ ╻ ╼ ╽ ╾ ╿ ▏ ▕ ╏ – — ⌌ ⌍ ⌎ ⌏ ⌜ ⌝ ⌞ ⌟ ┌ ┍ ┎ ┏ ┐ ┑ ┒ ┓ └ └ ┕ ┖ ┗ ┘ ┙ ┚ ┛ ├ ├ ┝ ┞ ┟ ┠ ┡ ┢ ┣ ┤ ┥ ┦ ┧ ┨ ┩ ┪ ┫ ┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻ ┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ═ ║ ╒ ╓ ╔ ╔ ╔ ╕ ╕ ╖ ╖ ╗ ╗ ╘ ╙ ╚ ╚ ╛ ╛ ╜ ╜ ╝ ╝ ╞ ╟ ╟ ╠ ╡ ╡ ╢ ╢ ╣ ╣ ╤ ╤ ╥ ╥ ╦ ╦ ╧ ╧ ╨ ╨ ╩ ╩ ╪ ╪ ╫ ╬ ╱ ╲ ╳ ╭ ╮ ╯ ╰ ◜ ◝ ◞ ◟ ◠ ◡ ⌈ ⌊ ⌉ ⌋ ⎡ ⎣ ⎤ ⎦ ⎧ ⎩ ⎫ ⎭ ⎸ ⎹ ⎾ ⎿ ⏉ ⏊ ⏋ ⏌ ≡ ≣ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷"
                    + " 𖡎 ☡ ༘ ෴ ؄ ᔐ ᔑ ᔓ ᔕ 𖡬 𖢦 ꧖ 𖨂 𖦹 ⎛ ⎝ ⎞ ⎠ 𖣢 𖥷 𖣸 𖣿 𖤩 𖥾 𖨘 𓂃 𓂅 𓏲 𓍱 𓍲 𓎆 ⦚ ⌇"
                    + " ⊖ ⊘ ⊙ ⊚ ⊛ ⊜ ⊝ ◉ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ◦ ◯ ◴ ◵ ◶ ◷ ❍ ₒ ॰ ° ৹ ๐ º 𐤏 Ｏ ⦿ ⊕ ⊗ ⨷ ⭕ 🅞 Ⓞ ⓞ 𖣠 𖣐 ᪤ 𖥕 𖥞 𖦹 𖥚 𖤞 𒊹"
                    + " ⬟ ⬠ ⭓ ⭔ ☖ ☗ ◊ ⟠ ⧫ ⋄ ◆ ◇ ◈ ❖ ⬬ ⬭ ⬮ ⬯ ⎔ ⎚ ⌑ ▰ ▱ ⬢ ⬡ ⬣"
                    + " × ☓ ✕ ✖ ❌ ❎ ⨉ ⨯ ☐ ☒ ✗ ✘ Χ χ ꭓ ᚷ ⊗ ⨷ ₓ ˣ 𒉽 ⛌ ⛒ ⛝ 🆇 🅇 🅧 Ⓧ 𝕏"
                    + " • · ∙ ⊙ ⊚ ⊛ ◉ ○ ◌ ◍ ◎ ● ◘ ◦ 。 ☉ ⦾ ⦿ ⁃ ⁌ ⁍ ◆ ◇ ◈ ★ ☆ ■ □ ☐ ☑ ☒ ✓ ✔ ❖ ⋄ ❥ ❧ ☙ ☸ ✤ ✱ ✲ ✦ ✧ ↠ ↣ ↦ ↬ ⇛ ⇝ ⇢ ⇨ ➔ ➙ ➛ ➜ ➝ ➞ ➟ ➠ ➡ ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➮ ➱ ➲ ➳ ➵ ➸ ➼ ➽ ➾ → ⇾ ⇒ ‣ ▶ ▷ ▸ ▹ ► ▻"
                    + " ⣿ ⠿ ⠾ ⠽ ⠼ ⠻ ⠺ ⠹ ⠸ ⠷ ⠶ ⠵ ⠴ ⠳ ⠲ ⠱ ⠰ ⠯ ⠮ ⠭ ⠬ ⠫ ⠪ ⠩ ⠨ ⠧ ⠦ ⠥ ⠤ ⠣ ⠢ ⠡ ⠠ ⠟ ⠞ ⠝ ⠜ ⠛ ⠚ ⠙ ⠘ ⠗ ⠖ ⠕ ⠔ ⠓ ⠒ ⠑ ⠐ ⠏ ⠎ ⠍ ⠌ ⠋ ⠊ ⠉ ⠈ ⠇ ⠆ ⠅ ⠄ ⠃ ⠂ ⠁ ⠀"
    );

    private static final String[] MATHEMATICS_SYMBOLS = splitSymbols(
            "± ∓ × ÷ ∶ … ≤ ≥ ≠ √ ∛ ∜ ∑ ∏ ∞ ♾ ℕ ℤ ℚ ℝ ℂ α β γ δ ε μ φ π σ θ ∈ ∉ ∅ ∫ ∬ ∭ ∮ ∯ ∂ ∆ ∇ ≈ ≅ ≡ ≟ ∝ ∠ ‘ ’ ∪ ∩ ∼ ∣ ≃ ≄ ≇ ° ⋅ ⊗ ⊕ ⊙ ⟨ ⟩ ∨ ∧ ¬ ∴ ∵ ⇒ ⇔ ∀ ∃ ∄ ⊆ ⊇ ⊂ ⊃ ∖ ℘ ρ X̄ ↔ → ↦ ⇥ ⊥ ⊤ ⊧ ⊢ ¦ ! ∎ ℑ ℍ 𝔸 ⊖ ⌈ ⌉ ″ ′ ↟ [ ] □ ■ ⌃ ⋀ ⋁ ∁ ⇔ ⅋ ∦ ∧ ∨ ≦ ≧ ≪ ≫ ≬ ≭ ≰ ≱ ≲ ≳ ⊀ ⊁ ◅ ‰ ‱"
                    + " ½ ⅓ ⅔ ¼ ¾ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅐ ⅛ ⅜ ⅝ ⅞ ⅑ ⅒ ↉ ⅟"
                    + " ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ‧ ⁺ ⁻ ˣ ᐟ ⁼ ⁽ ⁾ ⁿ ꜝ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎ ₐ ₑ ₒ ₓ ₔ ° ⁱ ² ³ ᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸ ᶻ ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ ₒ ₚ ᵣ ₛ ₜ ᵤ ᵥ ₓ ᵋ ᵝ ᵞ ᵟ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ ᶥ ᶿ"
                    + " Π π 𝜫 𝝅 𝝥 𝝿 𝞟 𝞹 П п ∏ ϖ ∐ ℼ ㄇ 兀"
    );

    private static final String[] LANGUAGE_SYMBOLS = splitSymbols(
            "Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ ς σ τ υ φ χ ψ ω"
                    + " Æ Á Â Â À Å Ã Ä Ç Ð É Ê È Ë Í Î Ì Ï Ñ Ó Ô Ò Ø Õ Ö Þ Ú Û Ù Ü Ý á â æ à å ã ä ç é ê è ð ë í î ì ï ñ ó ô ò ø õ ö ß þ ú û ù ü ý ÿ"
                    + " Ā ā Ă ă Ą ą Ć ć Ĉ ĉ Ċ ċ Č č Ď ď Đ đ Ē ē Ĕ ĕ Ė ė Ę ę Ě ě Ĝ ĝ Ğ ğ Ġ ġ Ģ ģ Ĥ ĥ Ħ ħ Ĩ ĩ Ī ī Ĭ ĭ Į į İ ı Ĳ ĳ Ĵ ĵ Ķ ķ ĸ Ĺ ĺ Ļ ļ Ľ ľ Ŀ ŀ Ł ł Ń ń Ņ ņ Ň ň Ŋ ŋ Ō ō Ŏ ŏ Ő ő Œ œ Ŕ ŕ Ŗ ŗ Ř ř Ś ś Ŝ ŝ Ş ş Š š Ţ ţ Ť ť Ŧ ŧ Ũ ũ Ū ū Ŭ ŭ Ů ů Ű ű Ų ų Ŵ ŵ Ŷ ŷ Ÿ Ź ź Ż ż Ž ž ſ ŉ"
                    + " Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ ᴀ ʙ ᴄ ᴅ ᴇ ғ ɢ ʜ ɪ ᴊ ᴋ ʟ ᴍ ɴ ᴏ ᴘ ǫ ʀ s ᴛ ᴜ ᴠ ᴡ x ʏ ᴢ 𝓐 𝓑 𝓒 𝓓 𝓔 𝓕 𝓖 𝓗 𝓘 𝓙 𝓚 𝓛 𝓜 𝓝 𝓞 𝓟 𝓠 𝓡 𝓢 𝓣 𝓤 𝓥 𝓦 𝓧 𝓨 𝓩 𝓪 𝓫 𝓬 𝓭 𝓮 𝓯 𝓰 𝓱 𝓲 𝓳 𝓴 𝓵 𝓶 𝓷 𝓸 𝓹 𝓺 𝓻 𝓼 𝓽 𝓾 𝓿 𝔀 𝔁 𝔂 𝔃 𝒜 ℬ 𝒞 𝒟 ℰ ℱ 𝒢 ℋ ℐ 𝒥 𝒦 ℒ ℳ 𝒩 𝒪 𝒫 𝒬 ℛ 𝒮 𝒯 𝒰 𝒱 𝒲 𝒳 𝒴 𝒵 𝒶 𝒷 𝒸 𝒹 𝑒 𝒻 𝑔 𝒽 𝒾 𝒿 𝓀 𝓁 𝓂 𝓃 𝑜 𝓅 𝓆 𝓇 𝓈 𝓉 𝓊 𝓋 𝓌 𝓍 𝓎 𝓏 🅐 🅑 🅒 🅓 🅔 🅕 🅖 🅗 🅘 🅙 🅚 🅛 🅜 🅝 🅞 🅟 🅠 🅡 🅢 🅣 🅤 🅥 🅦 🅧 🅨 🅩 𝔸 𝔹 ℂ 𝔻 𝔼 𝔽 𝔾 ℍ 𝕀 𝕁 𝕂 𝕃 𝕄 ℕ 𝕆 ℙ ℚ ℝ 𝕊 𝕋 𝕌 𝕍 𝕎 𝕏 𝕐 ℤ 𝕒 𝕓 𝕔 𝕕 𝕖 𝕗 𝕘 𝕙 𝕚 𝕛 𝕜 𝕝 𝕞 𝕟 𝕠 𝕡 𝕢 𝕣 𝕤 𝕥 𝕦 𝕧 𝕨 𝕩 𝕪 𝕫 🄰 🄱 🄲 🄳 🄴 🄵 🄶 🄷 🄸 🄹 🄺 🄻 🄼 🄽 🄾 🄿 🅀 🅁 🅂 🅃 🅄 🅅 🅆 🅇 🅈 🅉 🅰 🅱 🅲 🅳 🅴 🅵 🅶 🅷 🅸 🅹 🅺 🅻 🅼 🅽 🅾 🅿 🆀 🆁 🆂 🆃 🆄 🆅 🆆 🆇 🆈 🆉 𝕬 𝕭 𝕮 𝕯 𝕰 𝕱 𝕲 𝕳 𝕴 𝕵 𝕶 𝕷 𝕸 𝕹 𝕺 𝕻 𝕼 𝕽 𝕾 𝕿 𝖀 𝖁 𝖂 𝖃 𝖄 𝖅 𝖆 𝖇 𝖈 𝖉 𝖊 𝖋 𝖌 𝖍 𝖎 𝖏 𝖐 𝖑 𝖒 𝖓 𝖔 𝖕 𝖖 𝖗 𝖘 𝖙 𝖚 𝖛 𝖜 𝖝 𝖞 𝖟 𝔄 𝔅 ℭ 𝔇 𝔈 𝔉 𝔊 ℌ ℑ 𝔍 𝔎 𝔏 𝔐 𝔑 𝔒 𝔓 𝔔 ℜ 𝔖 𝔗 𝔘 𝔙 𝔚 𝔛 𝔜 ℨ 𝔞 𝔟 𝔠 𝔡 𝔢 𝔣 𝔤 𝔥 𝔦 𝔧 𝔨 𝔩 𝔪 𝔫 𝔬 𝔭 𝔮 𝔯 𝔰 𝔱 𝔲 𝔳 𝔴 𝔵 𝔶 𝔷 𝐀 𝐁 𝐂 𝐃 𝐄 𝐅 𝐆 𝐇 𝐈 𝐉 𝐊 𝐋 𝐌 𝐍 𝐎 𝐏 𝐐 𝐑 𝐒 𝐓 𝐔 𝐕 𝐖 𝐗 𝐘 𝐙 𝐚 𝐛 𝐜 𝐝 𝐞 𝐟 𝐠 𝐡 𝐢 𝐣 𝐤 𝐥 𝐦 𝐧 𝐨 𝐩 𝐪 𝐫 𝐬 𝐭 𝐮 𝐯 𝐰 𝐱 𝐲 𝐳 𝘈 𝘉 𝘊 𝘋 𝘌 𝘍 𝘎 𝘏 𝘐 𝘑 𝘒 𝘓 𝘔 𝘕 𝘖 𝘗 𝘘 𝘙 𝘚 𝘛 𝘜 𝘝 𝘞 𝘟 𝘠 𝘡 𝘢 𝘣 𝘤 𝘥 𝘦 𝘧 𝘨 𝘩 𝘪 𝘫 𝘬 𝘭 𝘮 𝘯 𝘰 𝘱 𝘲 𝘳 𝘴 𝘵 𝘶 𝘷 𝘸 𝘹 𝘺 𝘻 𝘼 𝘽 𝘾 𝘿 𝙀 𝙁 𝙂 𝙃 𝙄 𝙅 𝙆 𝙇 𝙈 𝙉 𝙊 𝙋 𝙌 𝙍 𝙎 𝙏 𝙐 𝙑 𝙒 𝙓 𝙔 𝙕 𝙖 𝙗 𝙘 𝙙 𝙚 𝙛 𝙜 𝙝 𝙞 𝙟 𝙠 𝙡 𝙢 𝙣 𝙤 𝙥 𝙦 𝙧 𝙨 𝙩 𝙪 𝙫 𝙬 𝙭 𝙮 𝙯"
                    + " ㊊ ㊋ ㊌ ㊍ ㊎ ㊏ ㊐ ㊑ ㊒ ㊓ ㊔ ㊕ ㊖ ㊗ ㊘ ㊙ ㊚ ㊛ ㊜ ㊝ ㊞ ㊟ ㊠ ㊡ ㊢ ㊣ ㊤ ㊥ ㊦ ㊧ ㊨ ㊩ ㊪ ㊫ ㊬ ㊭ ㊮ ㊯ ㊰"
                    + " ぁ あ ぃ い ぅ う ぇ え ぉ お か が き ぎ く ぐ け げ こ ご さ ざ し じ す ず せ ぜ そ ぞ た だ ち ぢ っ つ づ て で と ど な に ぬ ね の は ば ぱ ひ び ぴ ふ ぶ ぷ へ べ ぺ ほ ぼ ぽ ま み む め も ゃ や ゅ ゆ ょ よ ら り る れ ろ ゎ わ ゐ ゑ を ん ゔ ゕ ゖ ゝ ゞ ァ ア ィ イ ゥ ウ ェ エ ォ オ カ ガ キ ギ ク グ ケ ゲ コ ゴ サ ザ シ ジ ス ズ セ ゼ ソ ゾ タ ダ チ ヂ ッ ツ ヅ テ デ ト ド ナ ニ ヌ ネ ノ ハ バ パ ヒ ビ ピ フ ブ プ ヘ ベ ペ ホ ボ ポ マ ミ ム メ モ ャ ヤ ュ ユ ョ ヨ ラ リ ル レ ロ ヮ ワ ヰ ヱ ヲ ン ヴ ヵ ヶ ヷ ヸ ヹ ヺ ･ ｦ ｧ ｨ ｩ ｪ ｫ ｬ ｭ ｮ ｯ ｰ ｱ ｲ ｳ ｴ ｵ ｶ ｷ ｸ ｹ ｺ ｻ ｼ ｽ ｾ ｿ ﾀ ﾁ ﾂ ﾃ ﾄ ﾅ ﾆ ﾇ ﾈ ﾉ ﾊ ﾋ ﾌ ﾍ ﾎ ﾏ ﾐ ﾑ ﾒ ﾓ ﾔ ﾕ ﾖ ﾗ ﾘ ﾙ ﾚ ﾛ ﾜ ﾝ ﾞ ﾟ ㋐ ㋑ ㋒ ㋓ ㋔ ㋕ ㋖ ㋗ ㋘ ㋙ ㋚ ㋛ ㋜ ㋝ ㋞ ㋟ ㋠ ㋡ ㋢ ㋣ ㋤ ㋥ ㋦ ㋧ ㋨ ㋩ ㋪ ㋫ ㋬ ㋭ ㋮ ㋯ ㋰ ㋱ ㋲ ㋳ ㋴ ㋵ ㋶ ㋷ ㋸ ㋹ ㋺ ㋻ ㋼ ㋽ ㋾ ㋿ ㍻ ㍼ ㍽ ㍾ ◌゙ ◌゚ ゛ ゜ ・ ー ヽ ヾ ヿ ㍐ ㍿ 々 〒 〜 〃 ※ 〆"
                    + " ㄱ ㄲ ㄳ ㄴ ㄵ ㄶ ㄷ ㄸ ㄹ ㄺ ㄻ ㄼ ㄽ ㄾ ㄿ ㅀ ㅁ ㅂ ㅃ ㅄ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ ㅏ ㅐ ㅑ ㅒ ㅓ ㅔ ㅕ ㅖ ㅗ ㅘ ㅙ ㅚ ㅛ ㅜ ㅝ ㅞ ㅟ ㅠ ㅡ ㅢ ㅣ ﾡ ﾢ ﾣ ﾤ ﾥ ﾦ ﾧ ﾨ ﾩ ﾪ ﾫ ﾬ ﾭ ﾮ ﾯ ﾰ ﾱ ﾲ ﾳ ﾴ ﾵ ﾶ ﾷ ﾸ ﾹ ﾺ ﾻ ﾼ ﾽ ﾾ ￂ ￃ ￄ ￅ ￆ ￇ ￊ ￋ ￌ ￍ ￎ ￏ ￒ ￓ ￔ ￕ ￖ ￗ ￚ ￛ ￜ ㈀ ㈁ ㈂ ㈃ ㈄ ㈅ ㈆ ㈇ ㈈ ㈉ ㈊ ㈋ ㈌ ㈍ ㈎ ㈏ ㈐ ㈑ ㈒ ㈓ ㈔ ㈕ ㈖ ㈗ ㈘ ㈙ ㈚ ㈛ ㈜ ㈝ ㈞ ㉠ ㉡ ㉢ ㉣ ㉤ ㉥ ㉦ ㉧ ㉨ ㉩ ㉪ ㉫ ㉬ ㉭ ㉮ ㉯ ㉰ ㉱ ㉲ ㉳ ㉴ ㉵ ㉶ ㉷ ㉸ ㉹ ㉺ ㉻ ₩ ㉿ 〮 〯 ー"
    );

    private static final String[] CURRENCY_SYMBOLS = splitSymbols(
            "$ ¢ € £ ¥ ₩ ₽ ₹ ¤ ₱ ₦ ƒ ₮ ৲ ৳ ₨ ௹ ฿ ៛ ₪ ₫ ₭ ₲ ₴ ₵ ﷼ ≋ ₿ Ł Ð ₳"
    );

    private GboardAddSymbolsDataset() {
    }

    public static String defaultCategoryKey() {
        return KEY_POPULAR;
    }

    public static boolean isKnownCategoryKey(String categoryKey) {
        return indexOf(categoryKey) >= 0;
    }

    public static int indexOf(String categoryKey) {
        if (categoryKey == null || categoryKey.isBlank()) {
            return -1;
        }
        for (int i = 0; i < CATEGORY_KEYS.length; i++) {
            if (CATEGORY_KEYS[i].equals(categoryKey)) {
                return i;
            }
        }
        return -1;
    }

    public static List<String> symbolsFor(String categoryKey) {
        if (KEY_POPULAR.equals(categoryKey)) {
            return Arrays.asList(POPULAR_SYMBOLS);
        }
        if (KEY_COMMON.equals(categoryKey)) {
            return Arrays.asList(COMMON_SYMBOLS);
        }
        if (KEY_TYPOGRAPHY.equals(categoryKey)) {
            return Arrays.asList(TYPOGRAPHY_SYMBOLS);
        }
        if (KEY_PEOPLE.equals(categoryKey)) {
            return Arrays.asList(PEOPLE_SYMBOLS);
        }
        if (KEY_ANIMALS.equals(categoryKey)) {
            return Arrays.asList(ANIMALS_SYMBOLS);
        }
        if (KEY_STARS.equals(categoryKey)) {
            return Arrays.asList(STARS_SYMBOLS);
        }
        if (KEY_ARROWS.equals(categoryKey)) {
            return Arrays.asList(ARROWS_SYMBOLS);
        }
        if (KEY_SHAPES.equals(categoryKey)) {
            return Arrays.asList(SHAPES_SYMBOLS);
        }
        if (KEY_MATHEMATICS.equals(categoryKey)) {
            return Arrays.asList(MATHEMATICS_SYMBOLS);
        }
        if (KEY_LANGUAGE.equals(categoryKey)) {
            return Arrays.asList(LANGUAGE_SYMBOLS);
        }
        if (KEY_CURRENCY.equals(categoryKey)) {
            return Arrays.asList(CURRENCY_SYMBOLS);
        }
        return Collections.emptyList();
    }

    private static String[] splitSymbols(String joinedSymbols) {
        if (joinedSymbols == null || joinedSymbols.isBlank()) {
            return new String[0];
        }
        return joinedSymbols.trim().split(" +");
    }
}
