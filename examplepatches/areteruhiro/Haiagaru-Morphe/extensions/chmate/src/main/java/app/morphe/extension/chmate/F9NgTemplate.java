package app.morphe.extension.chmate;

/** Editable heuristic template, never an automatic or mandatory posting restriction. */
final class F9NgTemplate {
    static final String SCRIPT = "function (text, options) {\n"
            + "  // F9本人や文章の意味は特定しません。漢字だけの見出し等も一致する場合があります。\n"
            + "  // 誤判定時は文字数・割合を調整するか、この条件をオフにしてください。\n"
            + "  var s = text.replace(/\\s/g, '');\n"
            + "  if (/[都道府県].*[市区町村].*(?:丁目|番地|号)/.test(s)) return false;\n"
            + "  var kanji = s.match(/[\\u3400-\\u4dbf\\u4e00-\\u9fff]/g) || [];\n"
            + "  var randomKanji = s.length >= 10 && kanji.length / s.length >= 0.85\n"
            + "      && !/[。、！？!?：:「」『』（）()<>0-9A-Za-z]/.test(s);\n"
            + "  if (randomKanji) {\n"
            + "    var unique = {}; for (var i = 0; i < kanji.length; i++) unique[kanji[i]] = true;\n"
            + "    if (Object.keys(unique).length / s.length >= 0.65) return true;\n"
            + "  }\n"
            + "  if (s.length < 1200) return false;\n"
            + "  var kana = s.match(/[\\u3041-\\u3096]/g) || [];\n"
            + "  return kana.length / s.length >= 0.98 && /[\\u3041-\\u3096]{600}/.test(s);\n"
            + "}";
    private F9NgTemplate(){}
}