package dev.abotmaker.ramblerenhancements;

import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerBanglaLexicon;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings;
import org.junit.Assert;
import org.junit.Test;

/**
 * Hard cold-start and broad real-speech quality gate for Rambler Bangla v32.2.0+.
 * Runs BEFORE any manual dictionary preload in its own test class to prove that
 * first dictation after boot/update never cold-misses into Avro letter-by-letter garbage.
 */
public class RamblerColdStartAndStressTest {

    @Test
    public void coldStartAndBroadRealSpeechGate() {
        try {
            // 1. TRUE COLD START: NO prior preload() or loadBlockingForTesting()!
            // Simulates the exact first dictation right after updating the APK on a phone.
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;

            String coldFirst = GboardRamblerScriptFix.processVoice(
                    "আমি যদি বাংলা-ইংলিশ সবাই বুঝে এবং যেমনে বলব তেমনে বুঝতে পারে তাহলে তো ভালোই হয়। "
                            + "আজকে কাল-কে client meeting and everything.");
            Assert.assertTrue("Cold-start must preserve বাংলা-ইংলিশ: " + coldFirst,
                    coldFirst.contains("বাংলা-ইংলিশ"));
            Assert.assertTrue("Cold-start must join কাল-কে -> কালকে: " + coldFirst,
                    coldFirst.contains("কালকে") && !coldFirst.contains("কাল-কে"));
            Assert.assertTrue("Cold-start must NEVER emit Avro garbage কলিএনত/এভেরয়থিং: " + coldFirst,
                    coldFirst.contains("ক্লায়েন্ট মিটিং অ্যান্ড এভরিথিং")
                            && !coldFirst.contains("কলিএনত")
                            && !coldFirst.contains("এভেরয়থিং"));

            // Verify both Aksharantar compressed tables loaded cleanly (v32.4.0 phonetic-audited)
            Assert.assertTrue("Expected >= 20000 Aksharantar+CMU loanwords, got " + GboardRamblerLoanSpell.loanTableSize(),
                    GboardRamblerLoanSpell.loanTableSize() >= 20000);
            Assert.assertTrue("Expected >= 24000 Shift-free Banglish words, got " + GboardRamblerLoanSpell.banglishTableSize(),
                    GboardRamblerLoanSpell.banglishTableSize() >= 24000);

            // Warm lexicon for full L1-L4 + hyphen checks
            Assert.assertTrue(GboardRamblerBanglaLexicon.loadBlockingForTesting() >= 85000);

            // 2. BROAD 60-WORD ENGLISH LOANWORD STRESS TEST (Pure Bangla mode)
            String[][] loanChecks = {
                {"client", "ক্লায়েন্ট"},
                {"clients", "ক্লায়েন্টস"},
                {"everything", "এভরিথিং"},
                {"everyone", "এভরিওয়ান"},
                {"everybody", "এভরিবডি"},
                {"everyday", "এভরিডে"},
                {"anything", "এনিথিং"},
                {"something", "সামথিং"},
                {"nothing", "নাথিং"},
                {"android", "অ্যান্ড্রয়েড"},
                {"fluency", "ফ্লুয়েন্সি"},
                {"fluent", "ফ্লুয়েন্ট"},
                {"accuracy", "অ্যাকিউরেসি"},
                {"accurate", "অ্যাকিউরেট"},
                {"mobile", "মোবাইল"},
                {"software", "সফটওয়্যার"},
                {"network", "নেটওয়ার্ক"},
                {"business", "বিজনেস"},
                {"multilingual", "মাল্টিলিঙ্গুয়াল"},
                {"management", "ম্যানেজমেন্ট"},
                {"experience", "এক্সপেরিয়েন্স"},
                {"performance", "পারফরম্যান্স"},
                {"difference", "ডিফারেন্স"},
                {"decision", "ডিসিশন"},
                {"discussion", "ডিসকাশন"},
                {"popup", "পপ-আপ"},
                {"annoying", "অ্যানয়িং"},
                {"automatically", "অটোমেটিক্যালি"},
                {"basically", "বেসিক্যালি"},
                {"literally", "লিটারালি"},
                {"immediately", "ইমিডিয়েটলি"},
                {"probably", "প্রবাবলি"},
                {"technology", "টেকনোলজি"},
                {"normal", "নরমাল"},
                {"natural", "ন্যাচারাল"},
                {"perfect", "পারফেক্ট"},
                {"implement", "ইমপ্লিমেন্ট"},
                {"installed", "ইনস্টলড"},
                {"updated", "আপডেটেড"},
                {"downloaded", "ডাউনলোডেড"},
                {"deadline", "ডেডলাইন"},
                {"feedback", "ফিডব্যাক"},
                {"delivery", "ডেলিভারি"},
                {"presentation", "প্রেজেন্টেশন"},
                {"notification", "নোটিফিকেশন"},
                {"conversation", "কনভারসেশন"},
                {"application", "অ্যাপ্লিকেশন"},
                {"development", "ডেভেলপমেন্ট"},
                {"environment", "এনভায়রনমেন্ট"},
                {"international", "ইন্টারন্যাশনাল"},
                {"professional", "প্রফেশনাল"},
                {"communication", "কমিউনিকেশন"},
                {"solution", "সল্যুশন"},
                {"keyboard", "কিবোর্ড"},
                {"instant", "ইনস্ট্যান্ট"},
                {"resolve", "রিজলভ"},
                {"eventually", "ইভেনচুয়ালি"},
                {"browser", "ব্রাউজার"},
                {"schedule", "শিডিউল"},
                {"sentence", "সেন্টেন্স"},
                {"meeting", "মিটিং"},
                {"whatever", "হোয়াটেভার"},
                {"phonetics", "ফোনেটিকস"},
                {"understand", "আন্ডারস্ট্যান্ড"},
                {"understands", "আন্ডারস্ট্যান্ডস"},
                {"company", "কোম্পানি"},
                {"clearly", "ক্লিয়ারলি"},
                {"whatsapp", "হোয়াটসঅ্যাপ"},
                {"youtube", "ইউটিউব"},
                {"facebook", "ফেসবুক"},
                {"instagram", "ইনস্টাগ্রাম"},
                {"google", "গুগল"},
                {"samsung", "স্যামসাং"},
                {"email", "ইমেইল"},
                {"password", "পাসওয়ার্ড"},
                {"message", "মেসেজ"},
                {"account", "অ্যাকাউন্ট"},
                {"tomorrow", "টুমরো"},
            };
            StringBuilder failures = new StringBuilder();
            for (String[] pair : loanChecks) {
                String out = GboardRamblerScriptFix.processVoice("আমাদের " + pair[0] + " ভালো.");
                if (!out.contains(pair[1])) {
                    failures.append("LOAN[").append(pair[0]).append("]: exp=").append(pair[1])
                            .append(" got=").append(out).append('\n');
                }
            }

            // 3. SHIFT-FREE COLLOQUIAL BANGLISH STRESS TEST (30+ real Bangladeshi words)
            String[][] banglishChecks = {
                {"fatafati", "ফাটাফাটি"},
                {"byapar", "ব্যাপার"},
                {"kalke", "কালকে"},
                {"ajke", "আজকে"},
                {"soboi", "সবই"},
                {"ekdom", "একদম"},
                {"beshirbhag", "বেশিরভাগ"},
                {"valo", "ভালো"},
                {"taratari", "তাড়াতাড়ি"},
                {"motamuti", "মোটামুটি"},
                {"purota", "পুরোটা"},
                {"purata", "পুরাটা"},
                {"mishti", "মিষ্টি"},
                {"bolbo", "বলব"},
                {"bujhte", "বুঝতে"},
                {"likhte", "লিখতে"},
                {"korte", "করতে"},
                {"bolte", "বলতে"},
                {"amader", "আমাদের"},
                {"tomader", "তোমাদের"},
                {"apnader", "আপনাদের"},
                {"kemon", "কেমন"},
                {"thikmoto", "ঠিকমতো"},
                {"obostha", "অবস্থা"},
                {"shobkichui", "সবকিছুই"},
                {"dhonnobad", "ধন্যবাদ"},
                {"likhtesi", "লিখতেছি"},
                {"boltesi", "বলতেছি"},
                {"kortesi", "করতেছি"},
                {"bujhtese", "বুঝতেছে"},
            };
            for (String[] pair : banglishChecks) {
                String out = GboardRamblerScriptFix.processVoice(pair[0] + " ভালো.");
                if (!out.contains(pair[1])) {
                    failures.append("BANGLISH[").append(pair[0]).append("]: exp=").append(pair[1])
                            .append(" got=").append(out).append('\n');
                }
            }
            Assert.assertEquals("Stress test failures:\n" + failures, 0, failures.length());

            // 4. MULTILINGUAL MIXED (abc -> বাংলা) STRESS TEST
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
            GboardRamblerScriptFix.jvmLayoutKind = 2;

            String mix1 = GboardRamblerScriptFix.processVoice("Ajke kalke client meeting and everything.");
            Assert.assertEquals("আজকে কালকে client meeting and everything.", mix1);

            String mix2 = GboardRamblerScriptFix.processVoice("আজকে কাল-কে client meeting and everything.");
            Assert.assertEquals("আজকে কালকে client meeting and everything.", mix2);

            String mix3 = GboardRamblerScriptFix.processVoice("Amader client meeting ache, so please update everything.");
            Assert.assertTrue("Expected আমাদের + আছে + English Latin preserved: " + mix3,
                    mix3.contains("আমাদের") && mix3.contains("client meeting")
                            && mix3.contains("আছে") && mix3.contains("so please update everything."));

            String pureEn = GboardRamblerScriptFix.processVoice("Today we have a client meeting and everything.");
            Assert.assertEquals("Today we have a client meeting and everything.", pureEn);

            // 5. ZERO FALSE POSITIVES ON VALID BENGALI
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;
            String validBn = "আমি যদি বাংলা-ইংলিশ সবাই বুঝে এবং যেমনে বলব তেমনে বুঝতে পারে তাহলে তো ভালোই হয়। "
                    + "দরকার অনেক পৃথিবী ব্যবহার শিক্ষক উপস্থিত জিনিস শুনতে শবদেহ শব্দ।";
            Assert.assertEquals(validBn, GboardRamblerScriptFix.processVoice(validBn));
            // 6. v32.3.0 REAL-PHONE DICTATION REGRESSIONS (hasanta conjuncts, -তেশি, এখান->এখন, অংশটুকু, বাংলাটা, পুরোপুরি, Mixed Banglish)
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;
            String v323Pure = GboardRamblerScriptFix.processVoice(
                    "এখান দেখি পুরোটা বাংলায় বলতেছি। এখান দেখা যাক। বাংলাতে টাইপ করছি এই আনশতুকু। "
                            + "মনচচে তো বাংলা পুরাপুরি বুঝতেছে এখন। মনেহ হচছে তো বাংলা পুরো পুরি বুঝতেছে এখন। এখান থেকে যাই।");
            Assert.assertTrue("Expected এখন দেখি & এখন দেখা যাক: " + v323Pure,
                    v323Pure.contains("এখন দেখি") && v323Pure.contains("এখন দেখা যাক"));
            Assert.assertTrue("Expected এখান থেকে preserved: " + v323Pure, v323Pure.contains("এখান থেকে"));
            Assert.assertTrue("Expected অংশটুকু: " + v323Pure, v323Pure.contains("অংশটুকু"));
            Assert.assertTrue("Expected মনে হচ্ছে & পুরোপুরি: " + v323Pure,
                    v323Pure.contains("মনে হচ্ছে তো বাংলা পুরাপুরি")
                            && v323Pure.contains("মনে হচ্ছে তো বাংলা পুরোপুরি")
                            && !v323Pure.contains("মনচচে") && !v323Pure.contains("হচছে") && !v323Pure.contains("মনেহ"));

            // Language-wide unseen missing-hasanta conjuncts & -তেশি verb repairs
            String v323Conj = GboardRamblerScriptFix.processVoice("যাচছে খাচছে কিনতু বলতেশি করতেশি লিখতেশি hochchhe.");
            for (String exp : new String[] {"যাচ্ছে", "খাচ্ছে", "কিন্তু", "বলতেছি", "করতেছি", "লিখতেছি", "হচ্ছে"}) {
                Assert.assertTrue("Expected conjunct/verb repair '" + exp + "' in: " + v323Conj, v323Conj.contains(exp));
            }

            // Mixed mode: 25k Banglish dictionary words + -তেশি + বাংলাটা inside English-heavy mixed sentences
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
            GboardRamblerScriptFix.jvmLayoutKind = 2;
            String v323Mix1 = GboardRamblerScriptFix.processVoice(
                    "তারপর বাংলাতে convert করে দেখি. বাংলায় বলতেশি দেখি বাংলা টা পুরা লেখে নাকি.");
            Assert.assertTrue("Expected বলতেছি & বাংলাটা & convert: " + v323Mix1,
                    v323Mix1.contains("convert") && v323Mix1.contains("বলতেছি") && v323Mix1.contains("বাংলাটা"));
            String v323Mix2 = GboardRamblerScriptFix.processVoice(
                    "So, mix language to motamuti ভালোই কাজ করতেছে ja দেখতেছি.");
            Assert.assertTrue("Expected মোটামুটি & যা & English Latin preserved: " + v323Mix2,
                    v323Mix2.contains("So, mix language") && v323Mix2.contains("মোটামুটি") && v323Mix2.contains("যা দেখতেছি"));

            // 7. v32.4.0 SYSTEMIC BANGLA ORTHOGRAPHY & LOANWORD AUDIT REGRESSIONS
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;
            String v324Pure = GboardRamblerScriptFix.processVoice(
                    "এবার তো মনে হচ্ছে আগের চে বেটার। বাংলা কিবোর্ড এ পৌশ মাশ, ফালগুন মাশ, চৈত্রো মাশ। "
                            + "So these options and those words will show who whose each another.");
            Assert.assertTrue("Expected আগের চেয়ে বেটার: " + v324Pure, v324Pure.contains("আগের চেয়ে বেটার"));
            Assert.assertTrue("Expected কিবোর্ডে: " + v324Pure, v324Pure.contains("কিবোর্ডে"));
            Assert.assertTrue("Expected পৌষ মাস, ফাল্গুন মাস, চৈত্র মাস: " + v324Pure,
                    v324Pure.contains("পৌষ মাস")
                            && v324Pure.contains("ফাল্গুন মাস")
                            && v324Pure.contains("চৈত্র মাস"));
            Assert.assertTrue("Expected দিজ অপশনস & দোজ (never ঠেসে/থোস/বলল/বেশী/একই): " + v324Pure,
                    v324Pure.contains("দিজ অপশনস")
                            && v324Pure.contains("দোজ")
                            && v324Pure.contains("উইল")
                            && v324Pure.contains("হু")
                            && v324Pure.contains("হুজ")
                            && !v324Pure.contains("ঠেসে")
                            && !v324Pure.contains("বলল")
                            && !v324Pure.contains("বেশী"));

            // Generalized 190K-lexicon trailing-ো strip, homophone & missing-hasanta repairs
            Assert.assertEquals("চৈত্র", GboardRamblerBanglaLexicon.correctWord("চৈত্রো"));
            Assert.assertEquals("পৌষ", GboardRamblerBanglaLexicon.correctWord("পৌশ"));
            Assert.assertEquals("ফাল্গুন", GboardRamblerBanglaLexicon.correctWord("ফালগুন"));
            Assert.assertEquals("শ্রাবণ", GboardRamblerBanglaLexicon.correctWord("শ্রাবন"));
            Assert.assertEquals("কার্তিক", GboardRamblerBanglaLexicon.correctWord("কারতিক"));
        } finally {
            GboardRamblerScriptFix.jvmLayoutKind = 0;
            GboardRamblerScriptFix.setActiveGboardKeyboard(null, null);
        }
    }
}
