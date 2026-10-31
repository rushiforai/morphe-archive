package xyz.urro.gboard;

import java.util.Arrays;
import java.util.List;

public final class CoreChecks {
    static int assertions;
    static void check(boolean value, String message) {
        assertions++;
        if (!value) throw new AssertionError(message);
    }
    static void selection(String input, String source, String target) {
        List<String> sources = Arrays.asList("auto", "en", "es", "fr", "de", "pt-BR", "pt-PT", "zh-CN", "zh-TW", "ja", "ar", "he", "id", "br", "fil");
        List<String> targets = Arrays.asList("en", "es", "fr", "de", "pt-BR", "pt-PT", "zh-CN", "zh-TW", "ja", "ar", "he", "id", "br", "fil");
        LanguageShortcut.Selection value = LanguageShortcut.parse(input, sources, targets);
        check(value != null, "Not parsed: " + input);
        check(java.util.Objects.equals(source, value.source), "Source mismatch: " + input + " got " + value.source);
        check(target.equals(value.target), "Target mismatch: " + input + " got " + value.target);
    }
    public static void main(String[] args) throws Exception {
        selection("en-es ", "en", "es");
        selection("ENUS-PTBR ", "en", "pt-BR");
        selection("pt-EU ", null, "pt-PT");
        selection("en-pt-BR ", "en", "pt-BR");
        selection("eng-spa ", "en", "es");
        selection("  enUS-ptBR\t", "en", "pt-BR");
        selection("en-US-pt-BR ", "en", "pt-BR");
        selection("ptBR ", null, "pt-BR");
        selection("en-US ", null, "en");
        selection("fra ", null, "fr");
        selection("fre ", null, "fr");
        selection("fil ", null, "fil");
        selection("deu-eng ", "de", "en");
        selection("ger-spa ", "de", "es");
        selection("iw ", null, "he");
        selection("in ", null, "id");
        selection("\u00a0es\u2003", null, "es");
        selection("\nen-es\u202f", "en", "es");
        selection("zh-TW-ja ", "zh-TW", "ja");
        List<String> language = Arrays.asList("en", "es");
        for (String invalid : Arrays.asList("en-es", "hello ", "sentence en-es ", "en--es ", "-en ", "en- ", "en_es ", "123 ", "en-es@ ", "espanol ", "en-US-pt-BR-x-private ")) {
            check(LanguageShortcut.parse(invalid, language, language) == null, "Unexpected parse: " + invalid);
        }
        LanguageShortcut.Selection remainder = LanguageShortcut.parse("en-es \u00a0hola", language, language);
        check(remainder != null && "hola".equals("en-es \u00a0hola".substring(remainder.end)), "Pasted translation text was lost");
        for (int n : new int[]{0, 1, 71, 72, 73, 144, 257}) {
            byte[] input = new byte[n]; java.util.Arrays.fill(input, (byte) 'a');
            StringBuilder result = new StringBuilder();
            for (byte value : Sha3.sha3_512(input)) result.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            String expected = new String[]{"a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26", "697f2d856172cb8309d6b8b97dac4de344b549d4dee61edfb4962d8698b7fa803f4f93ff24393586e28b5b957ac3d1d369420ce53332712f997bd336d09ab02a", "070faf98d2a8fddf8ed886408744dc06456096c2e045f26f3c7b010530e6bbb3db535a54d636856f4e0e1e982461cb9a7e8e57ff8895cff1619af9f0e486e28c", "a8ae722a78e10cbbc413886c02eb5b369a03f6560084aff566bd597bb7ad8c1ccd86e81296852359bf2faddb5153c0a7445722987875e74287adac21adebe952", "23e6a8815f8201dbbf6a5463be8dcadb1acea9df5f8998954e59ac9565cf6d29b17aa27a5e8b0fc06343db6122d6e544d27583ddc78504d08203217e7e65b6bd", "446cd4d7ba19510dcc776b21045bc68d424b5b840e14685e149bb238b5f473c0356b69e04f0f5785eefce20ff09e678b080d8aac64568c5edf001cd32b2ed7a8", "5008048b64c14975181175f157be4a780c3d443d2177edf323d57884bc7e3979b9b53bca1325e880df3da0d97c435693441cb5527fbe950f5585678dfbb37785"}[java.util.Arrays.binarySearch(new int[]{0, 1, 71, 72, 73, 144, 257}, n)];
            check(result.toString().equals(expected), "SHA3 vector " + n);
        }
        String hash = ClipCrypto.loginPassword("test password");
        check(hash.equals("7103a07e72ee40d5c4bb22536a002bbe446230e8467a24babbfda9874aae56bce0c353f81fb569302245acc593a173c0082a946a1ce2af495e6794ecd0b704d0"), "SHA3 login differs from stock clients");
        ClipCrypto enabled = new ClipCrypto("test-user", "test password", "", 1000, true);
        check("Sample 日本語".equals(enabled.decrypt("{\"nonce\":\"AAECAwQFBgcICQoLDA0ODw==\",\"ciphertext\":\"aE/MMcqP46F6Q/a7u70c6w==\",\"tag\":\"+ftYieEVEo9I40udre/Elg==\"}")), "Stock raw-password AES-GCM fixture");
        for (String text : Arrays.asList("", "Hello", "日本語 🌏", "<script>alert('x')</script>", "\u0000a\nb")) {
            check(text.equals(enabled.decrypt(enabled.encrypt(text))), "Encrypted roundtrip");
        }
        ClipCrypto plain = new ClipCrypto("u", hash, "", 1000, false);
        check("hello".equals(plain.encrypt("hello")) && "hello".equals(plain.decrypt("hello")), "Plain protocol");
        boolean rejected = false;
        try { enabled.decrypt("{\"nonce\":\"AA==\",\"ciphertext\":\"AA==\",\"tag\":\"AA==\"}"); }
        catch (Exception expected) { rejected = true; }
        check(rejected, "Malformed cipher accepted");
        System.out.println("PASS: " + assertions + " Android ICU/protocol assertions");
    }
}
