// Which chats get the translate bar. Found on the device: it never appeared anywhere. Two causes, both here:
// Indonesian was missing from LATIN_LETTERS, so the reader had no plan and detection gave up before reading a
// word; and the last fallback only ran for English readers, so Spanish or French stayed silent for anyone else.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    const TRANSLATE_SCRIPTS"), SOURCE.indexOf("    function translateLooksForeign"));
const looks = SOURCE.slice(SOURCE.indexOf("    function translateLooksForeign"));
const body = looks.slice(0, looks.indexOf("\n    }") + 6);

function detect(text, target) {
    const context = {
        settings: { translateSkip: "" },
        languageBase: t => String(t || "").split("-")[0].toLowerCase(),
        translateTarget: () => target,
        Error, RegExp, Set, Map, Object, Array, String,
    };
    vm.createContext(context);
    vm.runInContext(code + "\n" + body + "\nthis.looks = translateLooksForeign;", context);
    return context.looks(text);
}

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}
const isForeign = (text, target, expected) => assert.strictEqual(detect(text, target), expected, text + " (target " + target + ")");

check("Indonesian readers get the bar for English", () => {
    isForeign("good morning everyone how are you all", "id", true);
    isForeign("i will be there tomorrow", "id", true);
});
check("and for Spanish, French and German", () => {
    isForeign("hola como estas todo bien amigo", "id", true);
    isForeign("bonjour je vais bien merci beaucoup", "id", true);
    isForeign("guten morgen wie geht es dir heute", "id", true);
});
check("and for other scripts", () => {
    isForeign("\u3053\u3093\u306b\u3061\u306f\u5143\u6c17\u3067\u3059\u304b", "id", true);
    isForeign("\u041f\u0440\u0438\u0432\u0435\u0442, \u043a\u0430\u043a \u0434\u0435\u043b\u0430?", "id", true);
});
check("but stays quiet for Indonesian itself", () => {
    isForeign("selamat pagi semua apa kabar hari ini", "id", false);
    isForeign("nanti malam kita main game sama sama", "id", false);
    isForeign("makasih ya udah bantu aku tadi", "id", false);
});
check("English readers still see other languages, not English", () => {
    isForeign("hola como estas todo bien amigo", "en", true);
    isForeign("good morning everyone how are you all", "en", false);
});
check("a word the reader's language also uses is not enough on its own", () => {
    isForeign("aku", "id", false);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
