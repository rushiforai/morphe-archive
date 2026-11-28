package com.akshaykadam.pixelboard.extension.rambler;

import java.text.Normalizer;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Post-ASR & post-LLM Bengali orthography normalizer.
 *
 * <p>Runs on ALL Bengali output in Pure Bangla ({@code layout == 1}) and Mixed Bangla + English
 * ({@code layout == 2}), even when the on-device Rambler LLM emitted 100% Bengali Unicode with
 * zero Latin characters. Repairs common phonetic/LLM Bengali spelling mistakes (such as
 * {@code শবকিছু} -> {@code সবকিছু}, {@code শবকিছু-আই} -> {@code সবকিছুই}, {@code বুযে} -> {@code বুঝে},
 * {@code ভালে} -> {@code ভালো}, {@code ওয়টেভার} -> {@code হোয়াটেভার}) with exact token-boundary
 * matching so valid Bengali words are never altered.</p>
 */
public final class GboardRamblerBanglaNormalizer {

    private static final Map<String, String> SPELLING_FIXES;
    private static final Set<String> JOIN_ENCLITIC_I_BASES;
    private static final String[][] PHRASE_FIXES = {
        {"সুন্দর ভাবে", "সুন্দরভাবে"},
        {"ভালো ভাবে", "ভালোভাবে"},
        {"সঠিক ভাবে", "সঠিকভাবে"},
        {"সহজ ভাবে", "সহজভাবে"},
        {"সম্পূর্ণ ভাবে", "সম্পূর্ণভাবে"},
        {"স্বাভাবিক ভাবে", "স্বাভাবিকভাবে"},
        {"সাধারণ ভাবে", "সাধারণভাবে"},
        {"রাইট নাউ", "রাইট নাও"},
        {"বানান তা", "বানানটা"},
        {"কথা তা", "কথাটা"},
        {"জিনিস তা", "জিনিসটা"},
        {"ব্যাপার তা", "ব্যাপারটা"},
        {"কাজ তা", "কাজটা"},
        {"নাম তা", "নামটা"},
        {"সময় তা", "সময়টা"},
        {"অ্যাপ তা", "অ্যাপটা"},
        {"ফোন তা", "ফোনটা"},
        {"আপডেট তা", "আপডেটটা"},
        {"স্পেলিং তা", "স্পেলিংটা"},
        {"জায়গা তা", "জায়গাটা"},
        {"প্রশ্ন তা", "প্রশ্নটা"},
        {"বাংলা টা", "বাংলাটা"},
        {"বাংলা তা", "বাংলাটা"},
        {"কথা টা", "কথাটা"},
        {"বানান টা", "বানানটা"},
        {"কাজ টা", "কাজটা"},
        {"জিনিস টা", "জিনিসটা"},
        {"ব্যাপার টা", "ব্যাপারটা"},
        {"সময় টা", "সময়টা"},
        {"সব টা", "সবটা"},
        {"পুরো টা", "পুরোটা"},
        {"পুরা টা", "পুরাটা"},
        {"পুরো পুরি", "পুরোপুরি"},
        {"পুরা পুরি", "পুরাপুরি"},
        {"মনেহ হচ্ছে", "মনে হচ্ছে"},
        {"মনেহ হচছে", "মনে হচ্ছে"},
        {"মনে হচছে", "মনে হচ্ছে"},
        {"মনচচে", "মনে হচ্ছে"},
        {"মনচছে", "মনে হচ্ছে"},
        {"উত্তর তা", "উত্তরটা"},
        {"এখান তো", "এখন তো"},
        {"মাছ অ্যাকিউরেট", "মাচ অ্যাকিউরেট"},
        {"আগের চে ", "আগের চেয়ে "},
        {"আগের চে।", "আগের চেয়ে।"},
        {"তার চে ", "তার চেয়ে "},
        {"এর চে ", "এর চেয়ে "},
        {"আমার চে ", "আমার চেয়ে "},
        {"তোমার চে ", "তোমার চেয়ে "},
        {"কিবোর্ড এ", "কিবোর্ডে"},
        {"কীবোর্ড এ", "কিবোর্ডে"},
        {"ফোন এ", "ফোনে"},
        {"অ্যাপ এ", "অ্যাপে"},
        {"বৈশাখ মাশ", "বৈশাখ মাস"},
        {"জ্যৈষ্ঠ মাশ", "জ্যৈষ্ঠ মাস"},
        {"আষাঢ় মাশ", "আষাঢ় মাস"},
        {"শ্রাবণ মাশ", "শ্রাবণ মাস"},
        {"ভাদ্র মাশ", "ভাদ্র মাস"},
        {"আশ্বিন মাশ", "আশ্বিন মাস"},
        {"কার্তিক মাশ", "কার্তিক মাস"},
        {"অগ্রহায়ণ মাশ", "অগ্রহায়ণ মাস"},
        {"পৌষ মাশ", "পৌষ মাস"},
        {"মাঘ মাশ", "মাঘ মাস"},
        {"ফাল্গুন মাশ", "ফাল্গুন মাস"},
        {"চৈত্র মাশ", "চৈত্র মাস"},
    };

    static {
        Map<String, String> m = new HashMap<String, String>(256);
        // শব* -> সব* (exact token match preserves শবদেহ, শবদাহ, শবযাত্রা, শব্দ)
        m.put("শব", "সব");
        m.put("শবই", "সবই");
        m.put("শবও", "সবও");
        m.put("শবাই", "সবাই");
        m.put("শবাইকে", "সবাইকে");
        m.put("শবাইর", "সবার");
        m.put("শবার", "সবার");
        m.put("শবকিছু", "সবকিছু");
        m.put("শবকিছুই", "সবকিছুই");
        m.put("শবকিছুতে", "সবকিছুতে");
        m.put("শবকিছুর", "সবকিছুর");
        m.put("শবকিসু", "সবকিছু");
        m.put("সবকিসু", "সবকিছু");
        m.put("শবকিসুই", "সবকিছুই");
        m.put("সবকিসুই", "সবকিছুই");
        m.put("শবসময়", "সবসময়");
        m.put("শবশময়", "সবসময়");
        m.put("সবশময়", "সবসময়");
        m.put("শবচেয়ে", "সবচেয়ে");
        m.put("শবচেয়ে", "সবচেয়ে");
        m.put("শবগুলো", "সবগুলো");
        m.put("শবগুলা", "সবগুলা");
        m.put("শবটা", "সবটা");
        m.put("শবটাই", "সবটাই");
        m.put("শবটি", "সবটি");
        m.put("শবখানে", "সবখানে");
        m.put("শবরকম", "সবরকম");
        m.put("শবদিকে", "সবদিকে");
        m.put("শবক্ষেত্রে", "সবক্ষেত্রে");

        // Common sh -> স misspellings
        m.put("শময়", "সময়");
        m.put("শময়ে", "সময়ে");
        m.put("শময়ের", "সময়ের");
        m.put("শময়", "সময়");
        m.put("শমস্যা", "সমস্যা");
        m.put("শমস্যার", "সমস্যার");
        m.put("শমস্যাগুলো", "সমস্যাগুলো");
        m.put("শমাধান", "সমাধান");
        m.put("শম্ভব", "সম্ভব");
        m.put("শম্ভবত", "সম্ভবত");
        m.put("শত্য", "সত্য");
        m.put("শত্যি", "সত্যি");
        m.put("শত্যিই", "সত্যিই");
        m.put("শহজ", "সহজ");
        m.put("শহজে", "সহজে");
        m.put("শহজেই", "সহজেই");
        m.put("শাথে", "সাথে");
        m.put("শাথেই", "সাথেই");
        m.put("শকল", "সকল");
        m.put("শকলে", "সকলে");
        m.put("শকলের", "সকলের");
        m.put("শবুজ", "সবুজ");
        m.put("শকাল", "সকাল");
        m.put("শকালে", "সকালে");
        m.put("শন্ধ্যা", "সন্ধ্যা");
        m.put("শন্ধ্যায়", "সন্ধ্যায়");
        m.put("শম্পর্কে", "সম্পর্কে");
        m.put("শম্পূর্ণ", "সম্পূর্ণ");
        m.put("শম্পূর্ন", "সম্পূর্ণ");
        m.put("শরাসরি", "সরাসরি");
        m.put("শরকার", "সরকার");
        m.put("শরকারি", "সরকারি");
        m.put("শাধারণ", "সাধারণ");
        m.put("শাধারন", "সাধারণ");
        m.put("শাধারণত", "সাধারণত");
        m.put("শঠিক", "সঠিক");
        m.put("শঠিকভাবে", "সঠিকভাবে");
        m.put("শমান", "সমান");
        m.put("শম্মান", "সম্মান");
        m.put("শমাজ", "সমাজ");
        m.put("শুন্দর", "সুন্দর");
        m.put("শুন্দরভাবে", "সুন্দরভাবে");
        m.put("শব্দের", "শব্দের");

        // বুয* / বুজ* -> বুঝ* / বোঝ*
        m.put("বুযে", "বুঝে");
        m.put("বুযি", "বুঝি");
        m.put("বুযতে", "বুঝতে");
        m.put("বুযলাম", "বুঝলাম");
        m.put("বুযলেন", "বুঝলেন");
        m.put("বুযবে", "বুঝবে");
        m.put("বুযবেন", "বুঝবেন");
        m.put("বুযব", "বুঝব");
        m.put("বুযবো", "বুঝবো");
        m.put("বুযছে", "বুঝছে");
        m.put("বুযছি", "বুঝছি");
        m.put("বুযছেন", "বুঝছেন");
        m.put("বুযতেছে", "বুঝতেছে");
        m.put("বুযতেছি", "বুঝতেছি");
        m.put("বুযতেসে", "বুঝতেছে");
        m.put("বুযতেসি", "বুঝতেছি");
        m.put("বুযেন", "বুঝেন");
        m.put("বুযা", "বোঝা");
        m.put("বুযো", "বোঝো");
        m.put("বুযানো", "বোঝানো");
        m.put("বুযেছে", "বুঝেছে");
        m.put("বুযেছি", "বুঝেছি");
        m.put("বুযেছেন", "বুঝেছেন");
        m.put("বুযতাম", "বুঝতাম");
        m.put("বুযলে", "বুঝলে");
        m.put("বুযলো", "বুঝলো");
        m.put("বুজে", "বুঝে");
        m.put("বুজি", "বুঝি");
        m.put("বুজতে", "বুঝতে");
        m.put("বুজলাম", "বুঝলাম");
        m.put("বুজলেন", "বুঝলেন");
        m.put("বুজবে", "বুঝবে");
        m.put("বুজবেন", "বুঝবেন");
        m.put("বুজব", "বুঝব");
        m.put("বুজবো", "বুঝবো");
        m.put("বুজছে", "বুঝছে");
        m.put("বুজছি", "বুঝছি");
        m.put("বুজতেছে", "বুঝতেছে");
        m.put("বুজতেছি", "বুঝতেছি");
        m.put("বুজতেসে", "বুঝতেছে");
        m.put("বুজেন", "বুঝেন");
        m.put("বুজো", "বোঝো");
        m.put("বুজা", "বোঝা");
        m.put("বুজানো", "বোঝানো");
        m.put("বুজেছে", "বুঝেছে");
        m.put("বুজেছি", "বুঝেছি");
        m.put("বুজলে", "বুঝলে");

        // ভালে / ভাল -> ভালো
        m.put("ভালে", "ভালো");
        m.put("ভাল", "ভালো");
        m.put("ভালই", "ভালোই");
        m.put("ভালভাবে", "ভালোভাবে");
        m.put("ভালেভাবে", "ভালোভাবে");
        m.put("ভালবাসা", "ভালোবাসা");
        m.put("ভালবাসি", "ভালোবাসি");
        m.put("ভালবাসে", "ভালোবাসে");
        m.put("ভালবাসো", "ভালোবাসো");
        m.put("ভালেবাসা", "ভালোবাসা");

        // Common Bangla & loanword spelling artifacts
        m.put("কিচু", "কিছু");
        m.put("কিসু", "কিছু");
        m.put("কিচুই", "কিছুই");
        m.put("কিসুই", "কিছুই");
        m.put("কিছুটা", "কিছুটা");
        m.put("ইংগলিশ", "ইংলিশ");
        m.put("ইঙ্গিলিশ", "ইংলিশ");
        m.put("ইংলীশ", "ইংলিশ");
        m.put("ইংলিশে", "ইংলিশে");
        m.put("বাঙ্গলা", "বাংলা");
        m.put("বাংগ্লা", "বাংলা");
        m.put("অন্ডারস্ট্যান্ড", "আন্ডারস্ট্যান্ড");
        m.put("অন্দারস্ট্যান্ড", "আন্ডারস্ট্যান্ড");
        m.put("অন্ডারস্ট্যান্ডজ", "আন্ডারস্ট্যান্ডস");
        m.put("অন্দারস্ট্যান্ডজ", "আন্ডারস্ট্যান্ডস");
        m.put("ক্লির্লি", "ক্লিয়ারলি");
        m.put("ওয়টেভার", "হোয়াটেভার");
        m.put("ওয়াটেভার", "হোয়াটেভার");
        m.put("ফনেটিকস", "ফোনেটিকস");
        m.put("ফনেটিক", "ফোনেটিক");
        m.put("সুপসেড", "সাপোজড");
        m.put("খাছি", "খাচ্ছি");
        m.put("খাছে", "খাচ্ছে");
        m.put("পাছি", "পাচ্ছি");
        m.put("পাছে", "পাচ্ছে");
        m.put("ঘুমাছি", "ঘুমাচ্ছি");
        m.put("ঘুমাছে", "ঘুমাচ্ছে");
        m.put("খুশী", "খুশি");
        m.put("পোষাক", "পোশাক");
        m.put("হৈতেচে", "হচ্ছে");
        m.put("হৈতেছে", "হচ্ছে");
        m.put("হইতেচে", "হচ্ছে");
        m.put("হোইতেসে", "হচ্ছে");
        m.put("হোইতেছে", "হচ্ছে");
        m.put("ঠিকমত", "ঠিকমতো");
        m.put("থিকমতো", "ঠিকমতো");
        m.put("থিকমত", "ঠিকমতো");
        m.put("ফাতাফাতি", "ফাটাফাটি");
        m.put("ফতাফাতি", "ফাটাফাটি");
        m.put("আবস্থা", "অবস্থা");
        m.put("একদাম", "একদম");
        m.put("সবৈ", "সবই");
        m.put("লিখতেসি", "লিখতেছি");
        m.put("বলতেসি", "বলতেছি");
        m.put("করতেসি", "করতেছি");
        m.put("বেশিভাগ", "বেশিরভাগ");
        m.put("পরাতা", "পুরাটা");
        m.put("কলিরলি", "ক্লিয়ারলি");
        m.put("হচছে", "হচ্ছে");
        m.put("হচছি", "হচ্ছি");
        m.put("মনেহ", "মনে");
        m.put("আনশতুকু", "অংশটুকু");
        m.put("অনশতুকু", "অংশটুকু");
        m.put("মাশ", "মাস");
        m.put("পৌশ", "পৌষ");
        m.put("ফালগুন", "ফাল্গুন");
        m.put("চৈত্রো", "চৈত্র");
        m.put("বৈশাক", "বৈশাখ");
        m.put("জৈষ্ঠ", "জ্যৈষ্ঠ");
        m.put("জ্যৈষ্ঠ্য", "জ্যৈষ্ঠ");
        m.put("আষাড়", "আষাঢ়");
        m.put("শ্রাবন", "শ্রাবণ");
        m.put("আশ্বীন", "আশ্বিন");
        m.put("অগ্রহায়ন", "অগ্রহায়ণ");
        m.put("মাগ", "মাঘ");

        SPELLING_FIXES = Collections.unmodifiableMap(m);

        Set<String> joinI = new HashSet<String>();
        joinI.add("সবকিছু");
        joinI.add("সব");
        joinI.add("কিছু");
        joinI.add("এখন");
        joinI.add("তখন");
        joinI.add("একদম");
        joinI.add("খুব");
        joinI.add("ভালো");
        joinI.add("এখানে");
        joinI.add("ওখানে");
        joinI.add("সেখানে");
        joinI.add("সত্যি");
        joinI.add("অনেক");
        joinI.add("কথা");
        joinI.add("একটা");
        joinI.add("একটি");
        joinI.add("পুরোটা");
        joinI.add("পুরাটা");
        joinI.add("এটা");
        joinI.add("ওটা");
        joinI.add("সেটা");
        joinI.add("সবটা");
        joinI.add("সহজে");
        joinI.add("সাথে");
        JOIN_ENCLITIC_I_BASES = Collections.unmodifiableSet(joinI);
    }

    private GboardRamblerBanglaNormalizer() {
    }

    public static String normalize(String input, boolean banglaOnly) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        if (!hasBengaliChar(input)) {
            return input;
        }

        // 1. NFC normalization + strip accidental double nukta + repair illegal jofola (্য় -> ্য)
        String text = Normalizer.normalize(input, Normalizer.Form.NFC);
        text = stripDoubleNukta(text);
        text = GboardRamblerBanglaLexicon.fixIllegalJofola(text);

        // 2. Token-level exact Bengali spelling & hyphenated -আই / -ই enclitic repair
        StringBuilder sb = new StringBuilder(text.length() + 8);
        int len = text.length();
        int i = 0;
        while (i < len) {
            if (isBengaliWordChar(text.charAt(i))) {
                int end = i + 1;
                while (end < len && isBengaliWordChar(text.charAt(end))) {
                    end++;
                }
                String word = text.substring(i, end);
                String fixed = SPELLING_FIXES.get(word);
                if (fixed != null) {
                    word = fixed;
                } else if (!GboardRamblerLoanSpell.isCuratedLoanOutput(word)) {
                    word = GboardRamblerBanglaLexicon.correctWord(word);
                }

                // Check for hyphenated enclitic immediately following this Bengali word (Bengali OR stray Latin -i/-o/-e)
                if (end + 1 < len && isHyphenOrDash(text.charAt(end))) {
                    char nextCh = text.charAt(end + 1);
                    if (isBengaliWordChar(nextCh)) {
                        int sufEnd = end + 2;
                        while (sufEnd < len && isBengaliWordChar(text.charAt(sufEnd))) {
                            sufEnd++;
                        }
                        String suffix = text.substring(end + 1, sufEnd);
                        // Repair "<Bengali>-আই" -> "<Bengali>-ই" (from misconverted "-i")
                        if ("\u0986\u0987".equals(suffix)) {
                            suffix = "\u0987";
                        } else {
                            String fixedSuffix = SPELLING_FIXES.get(suffix);
                            if (fixedSuffix != null) {
                                suffix = fixedSuffix;
                            } else {
                                suffix = GboardRamblerBanglaLexicon.correctWord(suffix);
                            }
                        }
                        if (("\u0987".equals(suffix) && JOIN_ENCLITIC_I_BASES.contains(word))
                                || (isJoinableCaseSuffix(suffix)
                                        && (GboardRamblerBanglaLexicon.isValid(word + suffix)
                                                || isGuaranteedJoin(word, suffix)))) {
                            sb.append(word).append(suffix);
                        } else {
                            sb.append(word).append('-').append(suffix);
                        }
                        i = sufEnd;
                        continue;
                    } else if ((nextCh == 'i' || nextCh == 'I' || nextCh == 'o' || nextCh == 'O'
                            || nextCh == 'e' || nextCh == 'E')
                            && (end + 2 >= len || !Character.isLetter(text.charAt(end + 2)))) {
                        // Failsafe repair for stray Latin enclitic after Bengali (e.g. "সব-i" -> "সবই", "বাংলা-o" -> "বাংলা-ও")
                        char lo = Character.toLowerCase(nextCh);
                        if (lo == 'i') {
                            if (JOIN_ENCLITIC_I_BASES.contains(word)) {
                                sb.append(word).append('\u0987');
                            } else {
                                sb.append(word).append("-\u0987");
                            }
                        } else if (lo == 'o') {
                            sb.append(word).append("-\u0993");
                        } else {
                            sb.append(word).append("-\u098f");
                        }
                        i = end + 2;
                        continue;
                    }
                }

                sb.append(word);
                i = end;
            } else {
                sb.append(text.charAt(i));
                i++;
            }
        }
        String out = sb.toString();

        // 3. Natural compound adverb, enclitic & contextual spacing fixes
        for (String[] pair : PHRASE_FIXES) {
            if (out.contains(pair[0])) {
                out = out.replace(pair[0], pair[1]);
            }
        }
        // Contextual এখান -> এখন whenever NOT followed by থেকে / পর্যন্ত / হতে / দিয়ে / কার
        // (bare এখান never stands alone in Bengali; Rambler ASR frequently slips এখন -> এখান).
        if (out.contains("এখান ")) {
            out = fixStandaloneEkhanToEkhon(out);
        }

        // 4. Pure Bangla mode: sentence-ending ASCII '.' directly after Bengali char -> Bengali dari '।'
        if (banglaOnly && out.indexOf('.') >= 0) {
            out = normalizeSentencePeriodsToDari(out);
        }

        return out;
    }

    private static String stripDoubleNukta(String text) {
        if (text.indexOf('\u09bc') < 0) {
            return text;
        }
        StringBuilder sb = new StringBuilder(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '\u09bc' && sb.length() > 0) {
                char prev = sb.charAt(sb.length() - 1);
                if (prev == '\u09bc' || prev == '\u09dc' || prev == '\u09dd' || prev == '\u09df') {
                    continue;
                }
            }
            sb.append(c);
        }
        return sb.toString();
    }

    private static String normalizeSentencePeriodsToDari(String text) {
        StringBuilder sb = new StringBuilder(text.length());
        int len = text.length();
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            if (c == '.') {
                boolean prevBengali = i > 0 && isBengaliWordChar(text.charAt(i - 1));
                boolean isEllipsis = (i > 0 && text.charAt(i - 1) == '.')
                        || (i + 1 < len && text.charAt(i + 1) == '.');
                boolean nextBoundary = (i + 1 == len)
                        || Character.isWhitespace(text.charAt(i + 1))
                        || text.charAt(i + 1) == '"'
                        || text.charAt(i + 1) == '\u201d'
                        || text.charAt(i + 1) == ')';
                if (prevBengali && !isEllipsis && nextBoundary) {
                    sb.append('\u0964');
                    continue;
                }
            }
            sb.append(c);
        }
        return sb.toString();
    }

    private static String fixStandaloneEkhanToEkhon(String text) {
        StringBuilder sb = new StringBuilder(text.length());
        int n = text.length();
        int i = 0;
        while (i < n) {
            int idx = text.indexOf("এখান", i);
            if (idx < 0) {
                sb.append(text, i, n);
                break;
            }
            boolean leftBoundary = idx == 0 || !isBengaliWordChar(text.charAt(idx - 1));
            int after = idx + 4;
            boolean rightSpace = after < n && Character.isWhitespace(text.charAt(after));
            if (leftBoundary && rightSpace) {
                int nw = after + 1;
                while (nw < n && Character.isWhitespace(text.charAt(nw))) {
                    nw++;
                }
                int nwEnd = nw;
                while (nwEnd < n && isBengaliWordChar(text.charAt(nwEnd))) {
                    nwEnd++;
                }
                String nextWord = text.substring(nw, nwEnd);
                if (!nextWord.isEmpty()
                        && !"থেকে".equals(nextWord)
                        && !"পর্যন্ত".equals(nextWord)
                        && !"হতে".equals(nextWord)
                        && !"দিয়ে".equals(nextWord)
                        && !"কার".equals(nextWord)) {
                    sb.append(text, i, idx).append("এখন");
                    i = after;
                    continue;
                }
            }
            sb.append(text, i, after);
            i = after;
        }
        return sb.toString();
    }

    private static boolean hasBengaliChar(String text) {
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c >= '\u0980' && c <= '\u09ff') {
                return true;
            }
        }
        return false;
    }

    private static boolean isHyphenOrDash(char c) {
        return c == '-' || c == '\u2010' || c == '\u2011' || c == '\u2012'
                || c == '\u2013' || c == '\u2014' || c == '\u2212';
    }

    private static boolean isJoinableCaseSuffix(String suffix) {
        return "কে".equals(suffix)
                || "টা".equals(suffix)
                || "টি".equals(suffix)
                || "তে".equals(suffix)
                || "এর".equals(suffix)
                || "রা".equals(suffix)
                || "গুলো".equals(suffix)
                || "গুলা".equals(suffix)
                || "ই".equals(suffix)
                || "ও".equals(suffix);
    }

    private static boolean isGuaranteedJoin(String word, String suffix) {
        if ("কে".equals(suffix)) {
            return "কাল".equals(word) || "আজ".equals(word);
        }
        if ("টা".equals(suffix)) {
            return "বানান".equals(word) || "কথা".equals(word) || "কাজ".equals(word)
                    || "জিনিস".equals(word) || "পুরা".equals(word) || "পুরো".equals(word)
                    || "এক".equals(word);
        }
        return false;
    }

    private static boolean isBengaliWordChar(char c) {
        return (c >= '\u0980' && c <= '\u09ff' && c != '\u0964' && c != '\u0965')
                || c == '\u200c'
                || c == '\u200d';
    }
}
