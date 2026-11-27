package com.akshaykadam.pixelboard.extension.rambler;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Multilingual (k2) AUTO dictation: one language per sentence (maintainer, 2026-09-24).
 * A Bangla sentence converts every word (English-origin words take the loan path);
 * an English sentence stays byte-identical. Protected spans (URL, email, handle,
 * hashtag, time) never vote and are copied byte-for-byte.
 * Pure String -> String, no mutable static state. Any failure returns null and the
 * caller falls back to the unchanged v29 segment vote.
 */
final class GboardRamblerSentenceLang {
  private GboardRamblerSentenceLang() {}

  static final int T_PROT = 0, T_NEUTRAL = 1, T_BN_GRAM = 2, T_EN_GRAM = 3, T_BN = 4, T_EN = 5, T_COLL = 6, T_UNK = 7, T_CTX = 8;
  static final String[] TAG = {"P", "N", "BG", "EG", "B", "E", "C", "U", "X", "e"};

  // Strong Bangla grammar evidence (weight 2): pronouns, postpositions, particles, copulas, high-frequency verbs.
  static final HashSet<String> BN_GRAM = set(
      "e", "o", "te", "er", "ke", "ta", "ti", "ra", "re", "der", "gulo", "gula", "tai", "tao",
      "ami", "amar", "amake", "amra", "amader", "tumi", "tomar", "tomake", "tomra", "tomader", "apni", "apnar", "apnake",
      "tara", "tader", "ora", "oder", "ki", "na", "nai", "nei", "ar", "kintu", "tahole", "keno", "kothay",
      "kemon", "ekta", "ekti", "ei", "oi", "eta", "ota", "sheta", "ekhon", "tokhon", "ekhane", "okhane", "jodi", "karon", "jonno",
      "theke", "moddhe", "sathe", "shathe", "hobe", "hoy", "hoyeche", "hocche", "holo", "chilo", "ache", "achi", "acho", "achen",
      "koro", "kori", "korbo", "korchi", "korcho", "korche", "korechi", "korecho", "kore", "korte", "dao", "dibo", "dite", "jabo",
      "jai", "jao", "jacchi", "jaccho", "ashbo", "ashchi", "ashche", "asche", "ashbe", "bolo", "bolbo", "boleche", "dekho", "dekhi",
      "lagbe", "thaki", "thake");
  // Words that are Bangla grammar AND common English/short forms: Bangla evidence only next to other Bangla
  // evidence (tumi to ashbe, age ami jabo); otherwise weak English (dictionary words) or neutral.
  static final HashSet<String> CONTEXT = set("to", "take", "age", "pore", "tar", "o", "se", "re", "ra");
  // High-frequency Bangla content words (weight 1) that the dictionary checks leave unknown.
  static final HashSet<String> BN_CONTENT = set(
      "onek", "beshi", "kotha", "shobai", "sobai", "ektu", "gorom", "thanda", "tay", "thak", "tarpor", "bhalo", "valo", "sundor",
      "shundor", "kichu", "kisu", "kichui", "tokhon", "ajke", "kalke", "porshu", "shob", "shudhu", "abar", "khub", "thik",
      "accha", "achha", "hoyto", "mone", "pari", "parbo", "parbe", "lage", "lagche", "laglo", "jani", "bujhi", "bujhlam", "dorkar",
      "kaj", "bari", "basha", "khabar", "khete", "khabo", "ghum", "pani", "taka", "rasta", "shomoy", "somoy", "bondhu", "bhai",
      "apu", "boro", "choto", "kharap", "mishti", "sokal", "bikel", "raat", "dupur", "shondha", "aste", "taratari", "ekhuni",
      "ekdom", "kono", "keu", "amio", "tumio", "sheshe", "prothom", "korsi", "bolsi", "khaisi", "gesi", "hoise", "ashtese",
      "jaitesi", "dekhsi", "parsi", "lagse", "kal", "jabe", "jaben", "ashen", "shuno", "shono");
  // Short English chat forms: English evidence even though the dictionary does not carry them.
  static final HashSet<String> EN_SLANG = set(
      "lol", "omg", "brb", "btw", "idk", "lmao", "thx", "pls", "plz", "np", "ikr", "tbh", "imo", "asap", "wtf", "ttyl", "gtg",
      "hmm", "haha", "hehe");
  // Strong English grammar evidence (weight 2).
  static final HashSet<String> EN_GRAM = set(
      "i", "a", "an", "the", "is", "am", "are", "was", "were", "be", "been", "of", "in", "on", "at", "for", "with", "and", "or",
      "but", "you", "your", "he", "she", "it", "its", "we", "they", "my", "me", "him", "her", "our", "their", "this", "that", "these",
      "those", "will", "would", "can", "could", "should", "have", "has", "had", "do", "does", "did", "not", "no", "yes", "what",
      "when", "where", "how", "why", "who", "there", "here", "let", "it's", "don't", "doesn't", "i'm", "i'll", "can't", "won't",
      "isn't", "didn't", "we're", "you're", "that's", "from", "by", "about", "some", "any", "all", "very", "so", "if", "then");
  // Real Banglish words that also sit in the shipped English dictionary: weak Bangla evidence (0.5), never English evidence.
  static final HashSet<String> COLLISION = set(
      "din", "por", "mon", "nam", "aj", "ha", "hole", "ma", "mile", "dam", "bon", "mama", "tin", "char", "ek", "dui", "ba",
      "niche", "jay", "hat", "pa", "kan", "rod", "at", "or", "sob");
  // Common Bangla words the garble/edit-distance check demotes; they are positive Bangla evidence.
  // Bangla words whose shipped loan spelling carries the retroflex T the letter converter misses (eta -> \u098f\u099f\u09be).
  static final HashSet<String> RETRO = set("ta", "ti", "eta", "ota", "sheta", "tai", "tao", "tay", "tate");
  static final HashSet<String> DEMOTION_EXEMPT = set(
      "amake", "tader", "sheta", "raate", "thake", "theke", "notun", "karon", "pashe", "ashle", "chini", "chino", "chinta",
      "chele", "matha", "baire", "chare");
  static final Pattern BN_SUFFIX = Pattern.compile(
      "[a-z]{2,}(?:te|ke|er|der|ta|gulo|chi|cho|che|chen|chhi|chho|chhe|bo|ben|lam|len|lo|li|ecchi|ecche|eche|echi|echo|iye|iyeche|ish|tese|tesi|techi|teche)$");
  static final Pattern BN_DIGRAPH = Pattern.compile("(?:bh|dh|kh|jh|chh)[aeiou]");
  static final Pattern HASHTAG = Pattern.compile("(?<![A-Za-z0-9_])#[A-Za-z0-9_]+");

  /** Reflection handles for the shipped SegmentLock helpers (private there). Loaded inside the try. */
  static final class H {
    static final Method CONVERT_LOAN = m("convertLoan", String.class, String.class);
    static final Method SINGLE_VOWEL = m("singleVowel", String.class);
    static final Method INFLECTION = m("englishByInflection", String.class);
    static final Method NEAR_ED1 = m("nearEnglishED1", String.class);
    static final Collection<?> BANGLA_FUNC = (Collection<?>) f("BANGLA_FUNC");
    static final Collection<?> PROTECT_BN = (Collection<?>) f("PROTECT_BN");
    static final Collection<?> GARBLE = (Collection<?>) f("GARBLE_ALLOWLIST");
    static final Pattern HANDLE_SPAN = (Pattern) f("HANDLE_SPAN");
    static final Pattern TIME_SUFFIX = (Pattern) f("TIME_SUFFIX");
    static Method m(String n, Class<?>... t) {
      try { Method x = GboardRamblerSegmentLock.class.getDeclaredMethod(n, t); x.setAccessible(true); return x; }
      catch (Exception e) { throw new IllegalStateException(n, e); }
    }
    static Object f(String n) {
      try { Field x = GboardRamblerSegmentLock.class.getDeclaredField(n); x.setAccessible(true); return x.get(null); }
      catch (Exception e) { throw new IllegalStateException(n, e); }
    }
  }

  static HashSet<String> set(String... a) { return new HashSet<>(Arrays.asList(a)); }

  /** Entry from SegmentLock.process (AUTO lane only). Returns null to request the old path. */
  static String process(String s) {
    try {
      String out = run(s, null);
      GboardRamblerDiag.bump("v30-sent");
      return out;
    } catch (Throwable t) {
      try { GboardRamblerDiag.bump("v30-sent-fallback"); } catch (Throwable ignored) { }
      return null;
    }
  }

  /** Test hook: per-sentence decision trace. */
  static String trace(String s) { StringBuilder tr = new StringBuilder(); run(s, tr); return tr.toString(); }

  static boolean latin(char c) { return GboardRamblerScriptFix.isLatinLetter(c); }

  static boolean bool(Method m, String a) throws Exception { return (Boolean) m.invoke(null, a); }

  static String run(String s, StringBuilder tr) {
    try { return run0(s, tr); } catch (RuntimeException e) { throw e; } catch (Exception e) { throw new IllegalStateException(e); }
  }

  static String run0(String s, StringBuilder tr) throws Exception {
    if (s == null || s.isEmpty()) return s;
    int n = s.length();
    boolean[] prot = new boolean[n];
    mark(prot, GboardRamblerScriptFix.URL_SPAN.matcher(s), n);
    mark(prot, H.HANDLE_SPAN.matcher(s), n);
    mark(prot, H.TIME_SUFFIX.matcher(s), n);
    mark(prot, HASHTAG.matcher(s), n);
    Collection<?> english = GboardRamblerScriptFix.ENGLISH;
    if (english == null) throw new IllegalStateException("dict");

    // Tokenize exactly like SegmentLock: Latin words (with inner apostrophes) or single characters.
    ArrayList<String> tok = new ArrayList<>();
    ArrayList<Integer> start = new ArrayList<>();
    int i = 0;
    while (i < n) {
      char c = s.charAt(i);
      if (latin(c)) {
        int j = i + 1;
        while (j < n && latin(s.charAt(j))) j++;
        while (j + 1 < n && (s.charAt(j) == '\'' || s.charAt(j) == '\u2019') && latin(s.charAt(j + 1))) {
          j++;
          while (j < n && latin(s.charAt(j))) j++;
        }
        tok.add(s.substring(i, j)); start.add(i); i = j;
      } else {
        tok.add(String.valueOf(c)); start.add(i); i++;
      }
    }
    int N = tok.size();
    StringBuilder out = new StringBuilder(n + 16);
    int a = 0;
    while (a < N) {
      // Sentence = tokens up to and including a run of . ? ! \u0964 \u2026 (outside protected spans) followed by whitespace/end, or a newline.
      int b = a;
      while (b < N) {
        String t = tok.get(b); int st = start.get(b);
        if (t.equals("\n")) { b++; break; }
        if (isEnd(t) && !prot[st]) {
          int k = b; while (k + 1 < N && isEnd(tok.get(k + 1))) k++;
          if (k + 1 >= N || Character.isWhitespace(tok.get(k + 1).charAt(0))) { b = k + 1; break; }
          b = k + 1; continue;
        }
        b++;
      }
      emitSentence(tok, start, prot, a, b, english, out, tr);
      a = b;
    }
    return out.toString();
  }

  static final int T_EN_WEAK = 9;

  static boolean bnEvidence(int[] cls, int k) {
    return k >= 0 && (cls[k] == T_BN_GRAM || cls[k] == T_BN);  // collision words (0.5) never promote a context word
  }

  /** Index of the previous / next word token (skipping spaces and punctuation-free neutrals), or -1. */
  static int prev(int[] cls, int x) { for (int k = x - 1; k >= 0; k--) if (cls[k] != T_NEUTRAL) return cls[k] == T_CTX ? -1 : k; return -1; }
  static int next(int[] cls, int x) { for (int k = x + 1; k < cls.length; k++) if (cls[k] != T_NEUTRAL) return cls[k] == T_CTX ? -1 : k; return -1; }

  static boolean isEnd(String t) {
    return t.length() == 1 && ".?!\u0964\u2026".indexOf(t.charAt(0)) >= 0;
  }

  static void mark(boolean[] p, Matcher m, int n) {
    while (m.find()) for (int x = m.start(); x < m.end() && x < n; x++) p[x] = true;
  }

  static int classify(String t, boolean isProt, Collection<?> english) throws Exception {
    if (isProt) return T_PROT;
    if (!latin(t.charAt(0))) return T_NEUTRAL;
    String lo = t.toLowerCase(Locale.US);
    if (lo.equals("bangla") || lo.equals("bengali")) return T_BN;
    if (CONTEXT.contains(lo)) return T_CTX;
    if (BN_GRAM.contains(lo)) return T_BN_GRAM;
    if (EN_GRAM.contains(lo)) return T_EN_GRAM;
    if (BN_CONTENT.contains(lo)) return T_BN;
    if (EN_SLANG.contains(lo)) return T_EN;
    if (t.length() == 1) return T_NEUTRAL;
    if (t.length() >= 2 && t.equals(t.toUpperCase(Locale.US)) && !lo.equals(t) && !bnWord(lo)) return T_EN; // acronym / all caps
    if (GboardRamblerScriptFix.hasInternalUpper(t)) return T_EN;                              // iPhone, YouTube
    if (COLLISION.contains(lo)) return T_COLL;
    if (DEMOTION_EXEMPT.contains(lo)) return T_BN;
    if (english.contains(lo)) return T_EN;
    int ap = lo.indexOf('\''); if (ap < 0) ap = lo.indexOf('\u2019');
    if (ap > 0 && english.contains(lo.substring(0, ap))) return T_EN;
    if (bool(H.INFLECTION, lo)) return T_EN;
    if (GboardRamblerScriptFix.convertToken(lo, lo) == null) return T_UNK;
    if (BN_SUFFIX.matcher(lo).matches() || BN_DIGRAPH.matcher(lo).find()) return T_BN;
    return T_UNK;
  }

  static void emitSentence(ArrayList<String> tok, ArrayList<Integer> start, boolean[] prot, int a, int b,
      Collection<?> english, StringBuilder out, StringBuilder tr) throws Exception {
    int[] cls = new int[b - a];
    double wb = 0, we = 0; int nb = 0;
    boolean first = true;
    for (int x = a; x < b; x++) {
      String t = tok.get(x);
      int c = classify(t, prot[start.get(x)], english);
      // A capitalised word inside the sentence that is Bangla only by spelling shape is a name (Dhaka, Rahim): no evidence.
      if (c == T_BN && !first && Character.isUpperCase(t.charAt(0)) && t.length() > 1 && t.substring(1).equals(t.substring(1).toLowerCase(Locale.US))
          && !BN_CONTENT.contains(t.toLowerCase(Locale.US)) && !DEMOTION_EXEMPT.contains(t.toLowerCase(Locale.US))) c = T_UNK;
      if (c != T_NEUTRAL && c != T_PROT) first = false;
      cls[x - a] = c;
    }
    // Resolve context words from their nearest word neighbours (non-context).
    for (int x = 0; x < cls.length; x++) {
      if (cls[x] != T_CTX) continue;
      boolean near = bnEvidence(cls, prev(cls, x)) || bnEvidence(cls, next(cls, x));
      String lo = tok.get(a + x).toLowerCase(Locale.US);
      cls[x] = near ? T_BN_GRAM : (english.contains(lo) && lo.length() > 1 ? T_EN_WEAK : T_NEUTRAL);
    }
    int words = 0;
    for (int x = a; x < b; x++) {
      String t = tok.get(x);
      int c = cls[x - a];
      if (latin(t.charAt(0)) && c != T_PROT) words++;
      switch (c) {
        case T_BN_GRAM: wb += 2; nb++; break;
        case T_EN_GRAM: we += 2; break;
        case T_BN: wb += 1; nb++; break;
        case T_EN: we += 1; break;
        case T_COLL: wb += 0.5; break;
        case T_EN_WEAK: we += 0.5; break;
        default: break;
      }
    }
    boolean bangla;
    String rule;
    int nu = 0; for (int c : cls) if (c == T_UNK) nu++;
    if (nb == 0 && we == 0 && wb == 0 && nu > 0 && words <= 3) { bangla = false; rule = "short-unknown->keep"; }
    else if (nb == 0 && we == 0 && wb == 0 && nu > 0) { bangla = true; rule = "all-unknown->bangla"; }
    else if (nb == 0) { bangla = false; rule = "no-bangla-evidence"; }
    else if (we == 0) { bangla = true; rule = "bangla-only"; }
    else if (wb > we) { bangla = true; rule = "majority"; }
    else if (wb == we) { bangla = true; rule = "tie->bangla"; }
    else { bangla = false; rule = "majority"; }
    if (tr != null) {
      tr.append('[').append(bangla ? "BN" : "EN").append(" wB=").append(wb).append(" wE=").append(we).append(' ').append(rule).append("] ");
      for (int x = a; x < b; x++) { String t = tok.get(x); if (t.trim().isEmpty()) { tr.append(' '); continue; } tr.append(t).append('/').append(TAG[cls[x - a]]); }
      tr.append(" || ");
    }
    for (int x = a; x < b; x++) {
      String t = tok.get(x);
      if (!bangla || cls[x - a] == T_PROT || !latin(t.charAt(0))) { out.append(t); continue; }
      out.append(render(t, english));
    }
  }

  static final String[] LETTER = {"\u098f", "\u09ac\u09bf", "\u09b8\u09bf", "\u09a1\u09bf", "\u0987", "\u098f\u09ab", "\u099c\u09bf",
      "\u098f\u0987\u099a", "\u0986\u0987", "\u099c\u09c7", "\u0995\u09c7", "\u098f\u09b2", "\u098f\u09ae", "\u098f\u09a8", "\u0993",
      "\u09aa\u09bf", "\u0995\u09bf\u0989", "\u0986\u09b0", "\u098f\u09b8", "\u099f\u09bf", "\u0987\u0989", "\u09ad\u09bf",
      "\u09a1\u09be\u09ac\u09cd\u09b2\u09bf\u0989", "\u098f\u0995\u09cd\u09b8", "\u0993\u09af\u09bc\u09be\u0987", "\u099c\u09c7\u09a1"};

  /**
   * Same spelling sources as the shipped emitter: Tier-1 first; English-dictionary words via convertLoan,
   * other words via the letter converter (convertLoan as fallback). All-caps acronyms stay Latin (rc2 behaviour).
   */
  static String render(String t, Collection<?> english) throws Exception {
    String lo = t.toLowerCase(Locale.US);
    if (t.length() == 1) {
      char c = t.charAt(0);
      if (c >= 'A' && c <= 'Z' && c != 'A' && c != 'I' && c != 'O' && c != 'E' && c != 'U') return LETTER[c - 'A'];
      String v = (String) H.SINGLE_VOWEL.invoke(null, t);
      return v != null ? v : t;
    }
    if (t.equals(t.toUpperCase(Locale.US)) && !lo.equals(t) && t.length() <= 5 && !bnWord(lo)) {
      String r0 = GboardRamblerTier1.get(lo);
      if (r0 != null) return r0;
      boolean vowel = false;
      for (int k = 0; k < t.length(); k++) if ("AEIOU".indexOf(t.charAt(k)) >= 0) vowel = true;
      if (!(vowel && t.length() >= 4)) {           // PDF, USA, ATM: spell the letters
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < t.length(); k++) {
          char c = t.charAt(k);
          if (c < 'A' || c > 'Z') return t;
          sb.append(LETTER[c - 'A']);
        }
        return sb.toString();
      }
      String v = (String) H.CONVERT_LOAN.invoke(null, lo, lo);  // NASA: read as a word
      return v != null && wellFormed(v) ? v : t;
    }
    String r = GboardRamblerTier1.get(lo);
    if (r != null) return r;
    String a, b;
    boolean bn = BN_GRAM.contains(lo) || CONTEXT.contains(lo) || BN_CONTENT.contains(lo) || COLLISION.contains(lo) || DEMOTION_EXEMPT.contains(lo);
    if (!RETRO.contains(lo) && (bn || !(english.contains(lo) || GboardRamblerScriptFix.hasInternalUpper(t)))) {
      a = GboardRamblerScriptFix.convertToken(lo, lo); b = (String) H.CONVERT_LOAN.invoke(null, t, lo);
    } else {
      a = (String) H.CONVERT_LOAN.invoke(null, t, lo); b = GboardRamblerScriptFix.convertToken(lo, lo);
    }
    if (a != null && wellFormed(a)) return a;
    if (b != null && wellFormed(b)) return b;
    if (a != null) return repair(a);
    if (b != null) return repair(b);
    return t;
  }

  static boolean bnWord(String lo) {
    return BN_GRAM.contains(lo) || CONTEXT.contains(lo) || BN_CONTENT.contains(lo) || COLLISION.contains(lo) || DEMOTION_EXEMPT.contains(lo)
        || BN_SUFFIX.matcher(lo).matches() || BN_DIGRAPH.matcher(lo).find();
  }

  static boolean sign(char c) { return (c >= '\u09be' && c <= '\u09cc') || c == '\u09d7'; }
  static boolean base(char c) { return (c >= '\u0995' && c <= '\u09b9') || (c >= '\u09dc' && c <= '\u09df') || c == '\u09bc'; }

  static boolean wellFormed(String w) {
    for (int k = 0; k < w.length(); k++) if (sign(w.charAt(k)) && (k == 0 || !base(w.charAt(k - 1)))) return false;
    return true;
  }

  /** A vowel sign with no consonant before it becomes the independent vowel. */
  static String repair(String w) {
    StringBuilder o = new StringBuilder(w.length());
    for (int k = 0; k < w.length(); k++) {
      char c = w.charAt(k);
      if (sign(c) && (k == 0 || !base(w.charAt(k - 1)))) {
        int x = "\u09be\u09bf\u09c0\u09c1\u09c2\u09c3\u09c7\u09c8\u09cb\u09cc".indexOf(c);
        if (x >= 0) { o.append("\u0986\u0987\u0988\u0989\u098a\u098b\u098f\u0990\u0993\u0994".charAt(x)); continue; }
      }
      o.append(c);
    }
    return o.toString();
  }
}
