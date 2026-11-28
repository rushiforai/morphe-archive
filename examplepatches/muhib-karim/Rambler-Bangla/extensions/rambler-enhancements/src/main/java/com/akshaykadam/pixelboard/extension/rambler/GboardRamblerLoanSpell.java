package com.akshaykadam.pixelboard.extension.rambler;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;

/**
 * English loanword spelling for Bangla voice dictation output only (WP-E); typing and paste never call it. Order: curated overrides, then the pruned
 * pronunciation table. Returns null to request the old letter path. Bangla words always return null.
 * The table loads once on a background thread; until it is ready only overrides answer.
 */
public final class GboardRamblerLoanSpell {
  private GboardRamblerLoanSpell() {}

  static volatile boolean ENABLED_VOICE = true;
  static volatile int diagFailures;
  static volatile int diagHits;
  static volatile int diagColdMiss;
  static final java.util.concurrent.CountDownLatch READY = new java.util.concurrent.CountDownLatch(1);
  static volatile long loadMs = -1;
  private static volatile int loggedColdMiss;

  static final HashMap<String, String> OVERRIDE = map(
      "tomorrow", "\u099f\u09c1\u09ae\u09b0\u09cb",
      "password", "\u09aa\u09be\u09b8\u0993\u09af\u09bc\u09be\u09b0\u09cd\u09a1",
      "whatsapp", "\u09b9\u09cb\u09af\u09bc\u09be\u099f\u09b8\u0985\u09cd\u09af\u09be\u09aa",
      "message", "\u09ae\u09c7\u09b8\u09c7\u099c",
      "minute", "\u09ae\u09bf\u09a8\u09bf\u099f",
      "minutes", "\u09ae\u09bf\u09a8\u09bf\u099f",
      "account", "\u0985\u09cd\u09af\u09be\u0995\u09be\u0989\u09a8\u09cd\u099f",
      "email", "\u0987\u09ae\u09c7\u0987\u09b2",
      "schedule", "\u09b6\u09bf\u09a1\u09bf\u0989\u09b2",
      "doctor", "\u09a1\u0995\u09cd\u099f\u09b0",
      "airport", "\u098f\u09af\u09bc\u09be\u09b0\u09aa\u09cb\u09b0\u09cd\u099f",
      "chocolate", "\u099a\u0995\u09b2\u09c7\u099f",
      "interesting", "\u0987\u09a8\u09cd\u099f\u09be\u09b0\u09c7\u09b8\u09cd\u099f\u09bf\u0982",
      "because", "\u09ac\u09bf\u0995\u099c",
      "always", "\u0985\u09b2\u0993\u09af\u09bc\u09c7\u099c",
      "important", "\u0987\u09ae\u09cd\u09aa\u09b0\u09cd\u099f\u09cd\u09af\u09be\u09a8\u09cd\u099f",
      "question", "\u0995\u09cb\u09af\u09bc\u09c7\u09b6\u09cd\u099a\u09c7\u09a8",
      "wait", "\u0993\u09af\u09bc\u09c7\u099f",
      "week", "\u0989\u0987\u0995",
      "call", "\u0995\u09b2",
      "letter", "\u09b2\u09c7\u099f\u09be\u09b0",
      "website", "\u0993\u09af\u09bc\u09c7\u09ac\u09b8\u09be\u0987\u099f",
      "problem", "\u09aa\u09cd\u09b0\u09ac\u09b2\u09c7\u09ae",
      "project", "\u09aa\u09cd\u09b0\u099c\u09c7\u0995\u09cd\u099f",
      "office", "\u0985\u09ab\u09bf\u09b8",
      "meeting", "\u09ae\u09bf\u099f\u09bf\u0982",
      "okay", "\u0993\u0995\u09c7",
      "ok", "\u0993\u0995\u09c7",
      "phone", "\u09ab\u09cb\u09a8",
      "video", "\u09ad\u09bf\u09a1\u09bf\u0993",
      "photo", "\u09ab\u099f\u09cb",
      "bus", "\u09ac\u09be\u09b8",
      "car", "\u0995\u09be\u09b0",
      "file", "\u09ab\u09be\u0987\u09b2",
      "app", "\u0985\u09cd\u09af\u09be\u09aa",
      "apps", "\u0985\u09cd\u09af\u09be\u09aa\u09b8",
      "online", "\u0985\u09a8\u09b2\u09be\u0987\u09a8",
      "offline", "\u0985\u09ab\u09b2\u09be\u0987\u09a8",
      "facebook", "\u09ab\u09c7\u09b8\u09ac\u09c1\u0995",
      "youtube", "\u0987\u0989\u099f\u09bf\u0989\u09ac",
      "google", "\u0997\u09c1\u0997\u09b2",
      "instagram", "\u0987\u09a8\u09b8\u09cd\u099f\u09be\u0997\u09cd\u09b0\u09be\u09ae",
      "university", "\u0987\u0989\u09a8\u09bf\u09ad\u09be\u09b0\u09cd\u09b8\u09bf\u099f\u09bf",
      "class", "\u0995\u09cd\u09b2\u09be\u09b8",
      "exam", "\u098f\u0995\u09cd\u09b8\u09be\u09ae",
      "sorry", "\u09b8\u09b0\u09bf",
      "thanks", "\u09a5\u09cd\u09af\u09be\u0982\u0995\u09b8",
      "thank", "\u09a5\u09cd\u09af\u09be\u0982\u0995",
      "please", "\u09aa\u09cd\u09b2\u09bf\u099c",
      "really", "\u09b0\u09bf\u09af\u09bc\u09c7\u09b2\u09bf",
      "actually", "\u0985\u09cd\u09af\u09be\u0995\u099a\u09c1\u09af\u09bc\u09be\u09b2\u09bf",
      "already", "\u0985\u09b2\u09b0\u09c7\u09a1\u09bf",
      "anyway", "\u098f\u09a8\u09bf\u0993\u09af\u09bc\u09c7",
      "weekend", "\u0989\u0987\u0995\u09c7\u09a8\u09cd\u09a1",
      "water", "\u0993\u09af\u09bc\u09be\u099f\u09be\u09b0",
      "work", "\u0993\u09af\u09bc\u09be\u09b0\u09cd\u0995",
      "laptop", "\u09b2\u09cd\u09af\u09be\u09aa\u099f\u09aa",
      "charge", "\u099a\u09be\u09b0\u09cd\u099c",
      "battery", "\u09ac\u09cd\u09af\u09be\u099f\u09be\u09b0\u09bf",
      "internet", "\u0987\u09a8\u09cd\u099f\u09be\u09b0\u09a8\u09c7\u099f",
      "report", "\u09b0\u09bf\u09aa\u09cb\u09b0\u09cd\u099f",
      "friday", "\u09ab\u09cd\u09b0\u09be\u0987\u09a1\u09c7",
      "monday", "\u09ae\u09be\u09a8\u09a1\u09c7",
      "tuesday", "\u099f\u09bf\u0989\u099c\u09a1\u09c7",
      "wednesday", "\u0993\u09af\u09bc\u09c7\u09a1\u09a8\u09c7\u09b8\u09a1\u09c7",
      "thursday", "\u09a5\u09be\u09b0\u09cd\u09b8\u09a1\u09c7",
      "saturday", "\u09b8\u09cd\u09af\u09be\u099f\u09be\u09b0\u09a1\u09c7",
      "sunday", "\u09b8\u09be\u09a8\u09a1\u09c7",
      "today", "\u099f\u09c1\u09a1\u09c7",
      "birthday", "\u09ac\u09be\u09b0\u09cd\u09a5\u09a1\u09c7",
      "holiday", "\u09b9\u09b2\u09bf\u09a1\u09c7",
      "delay", "\u09a1\u09bf\u09b2\u09c7",
      "appointment", "\u0985\u09cd\u09af\u09be\u09aa\u09af\u09bc\u09c7\u09a8\u09cd\u099f\u09ae\u09c7\u09a8\u09cd\u099f",
      "emergency", "\u0987\u09ae\u09be\u09b0\u09cd\u099c\u09c7\u09a8\u09cd\u09b8\u09bf",
      "join", "\u099c\u09af\u09bc\u09c7\u09a8",
      "restaurant", "\u09b0\u09c7\u09b8\u09cd\u099f\u09c1\u09b0\u09c7\u09a8\u09cd\u099f",
      "table", "\u099f\u09c7\u09ac\u09bf\u09b2",
      "camera", "\u0995\u09cd\u09af\u09be\u09ae\u09c7\u09b0\u09be",
      "angry", "\u0985\u09cd\u09af\u09be\u0982\u09b0\u09bf",
      "month", "\u09ae\u09be\u09a8\u09cd\u09a5",
      "tonight", "\u099f\u09c1\u09a8\u09be\u0987\u099f",
      "change", "\u099a\u09c7\u099e\u09cd\u099c",
      "busy", "\u09ac\u09bf\u099c\u09bf",
      "next", "\u09a8\u09c7\u0995\u09cd\u09b8\u099f",
      "january", "\u099c\u09be\u09a8\u09c1\u09af\u09bc\u09be\u09b0\u09bf",
      "february", "\u09ab\u09c7\u09ac\u09cd\u09b0\u09c1\u09af\u09bc\u09be\u09b0\u09bf",
      "march", "\u09ae\u09be\u09b0\u09cd\u099a",
      "april", "\u098f\u09aa\u09cd\u09b0\u09bf\u09b2",
      "may", "\u09ae\u09c7",
      "june", "\u099c\u09c1\u09a8",
      "july", "\u099c\u09c1\u09b2\u09be\u0987",
      "august", "\u0986\u0997\u09b8\u09cd\u099f",
      "september", "\u09b8\u09c7\u09aa\u09cd\u099f\u09c7\u09ae\u09cd\u09ac\u09b0",
      "october", "\u0985\u0995\u09cd\u099f\u09cb\u09ac\u09b0",
      "november", "\u09a8\u09ad\u09c7\u09ae\u09cd\u09ac\u09b0",
      "december", "\u09a1\u09bf\u09b8\u09c7\u09ae\u09cd\u09ac\u09b0",
      "retweet", "\u09b0\u09bf\u099f\u09c1\u0987\u099f",
      "tweet", "\u099f\u09c1\u0987\u099f",
      "netflix", "\u09a8\u09c7\u099f\u09ab\u09cd\u09b2\u09bf\u0995\u09cd\u09b8",
      "iphone", "\u0986\u0987\u09ab\u09cb\u09a8",
      "the", "\u09a6\u09cd\u09af",
      "and", "\u0985\u09cd\u09af\u09be\u09a8\u09cd\u09a1",
      "of", "\u0985\u09ab",
      "from", "\u09ab\u09cd\u09b0\u09ae",
      "your", "\u0987\u09af\u09bc\u09cb\u09b0",
      "about", "\u0985\u09cd\u09af\u09be\u09ac\u09be\u0989\u099f",
      "with", "\u0989\u0987\u09a5",
      "what", "\u09b9\u09cb\u09af\u09bc\u09be\u099f",
      "there", "\u09a6\u09c7\u09af\u09bc\u09be\u09b0",
      "their", "\u09a6\u09c7\u09af\u09bc\u09be\u09b0",
      "where", "\u09b9\u09cb\u09af\u09bc\u09cd\u09af\u09be\u09b0",
      "when", "\u09b9\u09cb\u09af\u09bc\u09c7\u09a8",
      "which", "\u09b9\u09c1\u0987\u099a",
      "samsung", "\u09b8\u09cd\u09af\u09be\u09ae\u09b8\u09be\u0982",
      "uber", "\u0989\u09ac\u09be\u09b0",
      "read", "\u09b0\u09bf\u09a1",
      "lead", "\u09b2\u09bf\u09a1",
      "close", "\u0995\u09cd\u09b2\u09cb\u099c",
      "use", "\u0987\u0989\u099c",
      "wind", "\u0989\u0987\u09a8\u09cd\u09a1",
      "tear", "\u099f\u09bf\u09af\u09bc\u09be\u09b0",
      "wound", "\u0989\u09a8\u09cd\u09a1",
      "live", "\u09b2\u09be\u0987\u09ad",
      "record", "\u09b0\u09c7\u0995\u09b0\u09cd\u09a1",
      "present", "\u09aa\u09cd\u09b0\u09c7\u099c\u09c7\u09a8\u09cd\u099f",
      "object", "\u0985\u09ac\u099c\u09c7\u0995\u09cd\u099f",
      "released", "\u09b0\u09bf\u09b2\u09bf\u099c\u09a1",
      "details", "\u09a1\u09bf\u099f\u09c7\u0987\u09b2\u09b8",
      "tired", "\u099f\u09be\u09af\u09bc\u09be\u09b0\u09cd\u09a1",
      "going", "\u0997\u09cb\u09af\u09bc\u09bf\u0982",
      "hmm", "\u09b9\u09c1\u09ae",
      "here", "\u09b9\u09bf\u09af\u09bc\u09be\u09b0",
      "hear", "\u09b9\u09bf\u09af\u09bc\u09be\u09b0",
      "mail", "\u09ae\u09c7\u0987\u09b2",
      "bangladesh", "\u09ac\u09be\u0982\u09b2\u09be\u09a6\u09c7\u09b6",
      "keyboard", "\u0995\u09c0\u09ac\u09cb\u09b0\u09cd\u09a1",
      "number", "\u09a8\u09be\u09ae\u09cd\u09ac\u09be\u09b0",
      "degree", "\u09a1\u09bf\u0997\u09cd\u09b0\u09bf",
      "corporation", "\u0995\u09b0\u09cd\u09aa\u09cb\u09b0\u09c7\u09b6\u09a8",
      "prairie", "\u09aa\u09cd\u09b0\u09c7\u0987\u09b0\u09bf",
      "maryland", "\u09ae\u09c7\u09b0\u09bf\u09b2\u09cd\u09af\u09be\u09a8\u09cd\u09a1",
      "manila", "\u09ae\u09cd\u09af\u09be\u09a8\u09bf\u09b2\u09be",
      "tower", "\u099f\u09be\u0993\u09af\u09bc\u09be\u09b0",
      "caffeine", "\u0995\u09cd\u09af\u09be\u09ab\u09c7\u0987\u09a8",
      "ninja", "\u09a8\u09bf\u09a8\u099c\u09be",
      "admiral", "\u0985\u09cd\u09af\u09be\u09a1\u09ae\u09bf\u09b0\u09be\u09b2",
      "television", "\u099f\u09c7\u09b2\u09bf\u09ad\u09bf\u09b6\u09a8",
      "berlin", "\u09ac\u09be\u09b0\u09cd\u09b2\u09bf\u09a8",
      "license", "\u09b2\u09be\u0987\u09b8\u09c7\u09a8\u09cd\u09b8",
      "england", "\u0987\u0982\u09b2\u09cd\u09af\u09be\u09a8\u09cd\u09a1",
      "rabbi", "\u09b0\u09ac\u09cd\u09ac\u09bf",
      "delaware", "\u09a1\u09c7\u09b2\u09be\u0993\u09af\u09bc\u09cd\u09af\u09be\u09b0",
      "hydrogen", "\u09b9\u09be\u0987\u09a1\u09cd\u09b0\u09cb\u099c\u09c7\u09a8",
      "cairo", "\u0995\u09be\u09af\u09bc\u09b0\u09cb",
      "database", "\u09a1\u09c7\u099f\u09be\u09ac\u09c7\u099c",
      "somalia", "\u09b8\u09cb\u09ae\u09be\u09b2\u09bf\u09af\u09bc\u09be",
      "chancellor", "\u099a\u09cd\u09af\u09be\u09a8\u09cd\u09b8\u09c7\u09b2\u09b0",
      "company", "\u0995\u09cb\u09ae\u09cd\u09aa\u09be\u09a8\u09bf",
      "carbon", "\u0995\u09be\u09b0\u09cd\u09ac\u09a8",
      "hardware", "\u09b9\u09be\u09b0\u09cd\u09a1\u0993\u09af\u09bc\u09cd\u09af\u09be\u09b0",
      "sudan", "\u09b8\u09c1\u09a6\u09be\u09a8",
      "concrete", "\u0995\u0982\u0995\u09cd\u09b0\u09bf\u099f");

  /**
   * High-frequency modern Bengali loanword spellings overriding raw CMUdict phoneme artifacts
   * (e.g. "english" -> "ইংলিশ" instead of "ইংগলিশ", "understands" -> "আন্ডারস্ট্যান্ডস" instead of
   * "অন্ডারস্ট্যান্ডজ", "clearly" -> "ক্লিয়ারলি" instead of "ক্লির্লি").
   */
  static final HashMap<String, String> CURATED_BANGLA_LOANS = map(
      "english", "ইংলিশ",
      "bangla", "বাংলা",
      "bengali", "বেঙ্গলি",
      "understand", "আন্ডারস্ট্যান্ড",
      "understands", "আন্ডারস্ট্যান্ডস",
      "understood", "আন্ডারস্টুড",
      "understanding", "আন্ডারস্ট্যান্ডিং",
      "clearly", "ক্লিয়ারলি",
      "clear", "ক্লিয়ার",
      "nearly", "নিয়ারলি",
      "mixture", "মিক্সচার",
      "voice", "ভয়েস",
      "choice", "চয়েস",
      "noise", "নয়েজ",
      "point", "পয়েন্ট",
      "enjoy", "এনজয়",
      "language", "ল্যাঙ্গুয়েজ",
      "languages", "ল্যাঙ্গুয়েজেস",
      "messages", "মেসেজেস",
      "package", "প্যাকেজ",
      "packages", "প্যাকেজেস",
      "manage", "ম্যানেজ",
      "manager", "ম্যানেজার",
      "settings", "সেটিংস",
      "buttons", "বাটনস",
      "clipboard", "ক্লিপবোর্ড",
      "example", "এক্সাম্পল",
      "exactly", "এক্স্যাক্টলি",
      "definitely", "ডেফিনিটলি",
      "usually", "ইউজুয়ালি",
      "simply", "সিম্পলি",
      "possible", "পসিবল",
      "available", "অ্যাভেইলেবল",
      "comfortable", "কমফোর্টেবল",
      "everyone", "এভরিওয়ান",
      "anyone", "এনিওয়ান",
      "someone", "সামওয়ান",
      "together", "টুগেদার",
      "problems", "প্রবলেমস",
      "questions", "কোয়েশ্চেনস",
      "answers", "অ্যান্সারস",
      "version", "ভার্সন",
      "options", "অপশনস",
      "function", "ফাংশন",
      "connection", "কানেকশন",
      "information", "ইনফরমেশন",
      "uninstall", "আনইনস্টল",
      "delete", "ডিলিট",
      "changes", "চেঞ্জেস",
      "friends", "ফ্রেন্ডস",
      "words", "ওয়ার্ডস",
      "things", "থিংস",
      "times", "টাইমস",
      "years", "ইয়ার্স",
      "hours", "আওয়ার্স",
      "seconds", "সেকেন্ডস",
      "works", "ওয়ার্কস",
      "checked", "চেকড",
      "fixed", "ফিক্সড",
      "mixed", "মিক্সড",
      "white", "হোয়াইট",
      "colors", "কালারস",
      "sentence", "সেন্টেন্স",
      "sentences", "সেন্টেন্সেস",
      "text", "টেক্সট",
      "toggle", "টগল",
      "dictation", "ডিক্টেশন",
      "spelling", "স্পেলিং",
      "spellings", "স্পেলিংস",
      "narration", "ন্যারেশন",
      "whatever", "হোয়াটেভার",
      "whenever", "হোয়েনেভার",
      "wherever", "হোয়্যারেভার",
      "whoever", "হুএভার",
      "however", "হাউএভার",
      "phonetic", "ফোনেটিক",
      "phonetics", "ফোনেটিকস",
      "saying", "সেয়িং",
      "written", "রিটেন",
      "should", "শুড",
      "would", "উড",
      "could", "কুড",
      "well", "ওয়েল",
      "right", "রাইট",
      "now", "নাও",
      "as", "অ্যাজ",
      "so", "সো",
      "be", "বি",
      "in", "ইন",
      "on", "অন",
      "supposed", "সাপোজড",
      "accurate", "অ্যাকিউরেট",
      "properly", "প্রপারলি",
      "update", "আপডেট",
      "updates", "আপডেটস",
      "feature", "ফিচার",
      "features", "ফিচারস",
      "section", "সেকশন",
      "option", "অপশন",
      "button", "বাটন",
      "patch", "প্যাচ",
      "patches", "প্যাচেস",
      "release", "রিলিজ",
      "github", "গিটহাব",
      "it", "ইট",
      "client", "ক্লায়েন্ট",
      "clients", "ক্লায়েন্টস",
      "everything", "এভরিথিং",
      "everybody", "এভরিবডি",
      "everyday", "এভরিডে",
      "anything", "এনিথিং",
      "something", "সামথিং",
      "nothing", "নাথিং",
      "android", "অ্যান্ড্রয়েড",
      "fluency", "ফ্লুয়েন্সি",
      "fluent", "ফ্লুয়েন্ট",
      "accuracy", "অ্যাকিউরেসি",
      "mobile", "মোবাইল",
      "software", "সফটওয়্যার",
      "network", "নেটওয়ার্ক",
      "business", "বিজনেস",
      "multilingual", "মাল্টিলিঙ্গুয়াল",
      "management", "ম্যানেজমেন্ট",
      "experience", "এক্সপেরিয়েন্স",
      "performance", "পারফরম্যান্স",
      "difference", "ডিফারেন্স",
      "decision", "ডিসিশন",
      "discussion", "ডিসকাশন",
      "popup", "পপ-আপ",
      "annoying", "অ্যানয়িং",
      "figure", "ফিগার",
      "between", "বিটুইন",
      "automatically", "অটোমেটিক্যালি",
      "basically", "বেসিক্যালি",
      "literally", "লিটারালি",
      "immediately", "ইমিডিয়েটলি",
      "probably", "প্রবাবলি",
      "technology", "টেকনোলজি",
      "normal", "নরমাল",
      "implement", "ইমপ্লিমেন্ট",
      "installed", "ইনস্টলড",
      "updated", "আপডেটেড",
      "downloaded", "ডাউনলোডেড",
      "deadline", "ডেডলাইন",
      "feedback", "ফিডব্যাক",
      "delivery", "ডেলিভারি",
      "presentation", "প্রেজেন্টেশন",
      "notification", "নোটিফিকেশন",
      "conversation", "কনভারসেশন",
      "application", "অ্যাপ্লিকেশন",
      "development", "ডেভেলপমেন্ট",
      "environment", "এনভায়রনমেন্ট",
      "international", "ইন্টারন্যাশনাল",
      "professional", "প্রফেশনাল",
      "communication", "কমিউনিকেশন",
      "solution", "সল্যুশন",
      "keyboard", "কিবোর্ড",
      "instant", "ইনস্ট্যান্ট",
      "resolve", "রিজলভ",
      "better", "বেটার",
      "search", "সার্চ",
      "eventually", "ইভেনচুয়ালি",
      "climate", "ক্লাইমেট",
      "clicked", "ক্লিকড",
      "these", "দিজ",
      "those", "দোজ",
      "them", "দেম",
      "such", "সাচ",
      "each", "ইচ",
      "another", "অ্যানাদার",
      "same", "সেম",
      "even", "ইভেন",
      "often", "অফেন",
      "sometimes", "সামটাইমস",
      "why", "হোয়াই",
      "who", "হু",
      "whose", "হুজ",
      "will", "উইল",
      "might", "মাইট",
      "more", "মোর",
      "short", "শর্ট",
      "sure", "শিওর",
      "real", "রিয়েল",
      "half", "হাফ",
      "year", "ইয়ার",
      "vow", "ভাউ",
      "wrong", "রং",
      "lot", "লট");

  private static final HashSet<String> CURATED_OUTPUTS = buildCuratedOutputs();

  private static HashSet<String> buildCuratedOutputs() {
    HashSet<String> set = new HashSet<>(OVERRIDE.size() + CURATED_BANGLA_LOANS.size() + 16);
    set.addAll(OVERRIDE.values());
    set.addAll(CURATED_BANGLA_LOANS.values());
    return set;
  }

  /**
   * Returns true if {@code word} is a known curated English-in-Bangla loanword output
   * (e.g. {@code দিজ}, {@code দোজ}, {@code হুজ}, {@code ইচ}, {@code অপশনস}), so the
   * Bengali native lexicon never snaps valid loanwords to unrelated Bengali words.
   */
  public static boolean isCuratedLoanOutput(String word) {
    return word != null && CURATED_OUTPUTS.contains(word);
  }

  private static volatile HashMap<String, String> table;
  private static volatile HashMap<String, String> banglishTable;
  private static volatile HashSet<String> bangla;
  private static volatile boolean loading;

  static HashMap<String, String> map(String... a) {
    HashMap<String, String> m = new HashMap<>(a.length);
    for (int i = 0; i + 1 < a.length; i += 2) m.put(a[i], a[i + 1]);
    return m;
  }

  /**
   * Starts the one-time table load on a background thread. Never blocks and never throws; safe to call repeatedly.
   * Called at voice session start (ScriptFix.lockVoiceCandidates), at the first conversion (ScriptFix.ensureDictionary)
   * and when a voice pass begins (enterVoice). If the thread cannot start, loading is reset so a later call can retry.
   */
  public static void preload() {
    GboardRamblerBanglaLexicon.preload();
    try {
      if (table != null || loading) return;
      synchronized (GboardRamblerLoanSpell.class) {
        if (table != null || loading) return;
        loading = true;
      }
      try {
        Thread t = new Thread(GboardRamblerLoanSpell::loadNow, "rambler-loan");
        t.setDaemon(true);
        t.setPriority(Thread.NORM_PRIORITY);
        t.start();
      } catch (Throwable e) {
        diagFailures++;
        synchronized (GboardRamblerLoanSpell.class) { loading = false; }
        READY.countDown();
      }
    } catch (Throwable e) {
      diagFailures++;
    }
  }

  static void loadNow() {
    long t0 = System.nanoTime();
    try {
      HashMap<String, String> loanMap = loadGzipTsv(GboardRamblerLoanTableData.gzipBase64Chunks(), 26000);
      HashMap<String, String> bnMap = loadGzipTsv(GboardRamblerBanglishData.gzipBase64Chunks(), 28000);
      table = loanMap;
      banglishTable = bnMap;
      loadMs = (System.nanoTime() - t0) / 1000000L;
    } catch (Throwable e) {
      diagFailures++;
      if (table == null) table = new HashMap<>();
      if (banglishTable == null) banglishTable = new HashMap<>();
    } finally {
      READY.countDown();
    }
  }

  private static HashMap<String, String> loadGzipTsv(String[] chunks, int initialCapacity) throws Exception {
    byte[] gz = GboardRamblerBanglaLexicon.decodeBase64Chunks(chunks);
    HashMap<String, String> m = new HashMap<>(initialCapacity);
    try (java.io.BufferedReader br = new java.io.BufferedReader(
        new java.io.InputStreamReader(
            new java.util.zip.GZIPInputStream(new java.io.ByteArrayInputStream(gz)),
            java.nio.charset.StandardCharsets.UTF_8), 32768)) {
      String line;
      while ((line = br.readLine()) != null) {
        int tab = line.indexOf('\t');
        if (tab > 0 && tab + 1 < line.length()) {
          m.put(line.substring(0, tab), line.substring(tab + 1));
        }
      }
    }
    return m;
  }

  /**
   * Shift-free colloquial Banglish -> Bangla Academy Bengali lookup backed by 25,000
   * Aksharantar pairs filtered strictly against OpenBangla + LibreOffice bn_BD.
   * Waits up to 150ms on cold boot (loads in ~20-35ms) so first dictation never cold-misses.
   */
  static String banglish(String lo) {
    if (lo == null || lo.length() < 2) return null;
    try {
      HashMap<String, String> m = banglishTable;
      if (m == null) {
        preload();
        try {
          READY.await(150L, java.util.concurrent.TimeUnit.MILLISECONDS);
        } catch (InterruptedException ie) {
          Thread.currentThread().interrupt();
        }
        m = banglishTable;
        if (m == null) return null;
      }
      return m.get(lo);
    } catch (Throwable e) {
      diagFailures++;
      return null;
    }
  }

  public static int loanTableSize() {
    HashMap<String, String> m = table;
    if (m == null) {
      loadNow();
      m = table;
    }
    return m == null ? 0 : m.size();
  }

  public static int banglishTableSize() {
    HashMap<String, String> m = banglishTable;
    if (m == null) {
      loadNow();
      m = banglishTable;
    }
    return m == null ? 0 : m.size();
  }

  static HashSet<String> banglaWords() {
    HashSet<String> b = bangla;
    if (b != null) return b;
    HashSet<String> s = new HashSet<>();
    try {
      addAll(s, GboardRamblerSentenceLang.BN_GRAM);
      addAll(s, GboardRamblerSentenceLang.CONTEXT);
      addAll(s, GboardRamblerSentenceLang.COLLISION);
      addAll(s, GboardRamblerSentenceLang.BN_CONTENT);
      addAll(s, GboardRamblerSentenceLang.DEMOTION_EXEMPT);
      addAll(s, GboardRamblerSentenceLang.RETRO);
      addAll(s, GboardRamblerSentenceLang.H.BANGLA_FUNC);
      addAll(s, GboardRamblerSentenceLang.H.PROTECT_BN);
    } catch (Throwable e) {
      diagFailures++;
      return null;
    }
    bangla = s;
    return s;
  }

  static void addAll(HashSet<String> s, java.util.Collection<?> c) {
    for (Object o : c) s.add(String.valueOf(o).toLowerCase(Locale.US));
  }

  /** Set only inside ScriptFix.processVoice (the single dictation conversion); typing and paste never set it. */
  static final ThreadLocal<Boolean> IN_VOICE = new ThreadLocal<>();

  /** Called by ScriptFix.processVoice around the dictation conversion (enter before, exit in a finally). */
  static void enterVoice() {
    try { IN_VOICE.set(Boolean.TRUE); preload(); } catch (Throwable e) { diagFailures++; }
  }

  static void exitVoice() {
    try { IN_VOICE.remove(); } catch (Throwable e) { diagFailures++; }
    try {
      int c = diagColdMiss;
      if (c != loggedColdMiss) {
        loggedColdMiss = c;
        GboardRamblerScriptFix.addDiag("wpe cold-miss total=" + c + " table=" + (table != null) + " loadMs=" + loadMs + " failures=" + diagFailures);
      }
    } catch (Throwable e) { diagFailures++; }
  }

  /**
   * Hook at the top of ScriptFix.convertTokenLoan with the display form. An all-caps token of 2-5 letters gets the same
   * acronym decision as SentenceLang.render (letters unless it has a vowel and 4+ letters), so one word has one spelling on
   * every voice path. Everything else goes to voice(lo).
   */
  static String voice2(String disp, String lo) {
    if (!inVoice()) return null;
    try {
      if (disp != null && disp.length() >= 2 && disp.length() <= 5 && disp.equals(disp.toUpperCase(Locale.US))) {
        String low = disp.toLowerCase(Locale.US);
        if (!low.equals(disp) && !GboardRamblerSentenceLang.bnWord(low)) {
          String t1 = GboardRamblerTier1.get(low);
          if (t1 != null) return t1;
          boolean vowel = false;
          for (int k = 0; k < disp.length(); k++) if ("AEIOU".indexOf(disp.charAt(k)) >= 0) vowel = true;
          if (!(vowel && disp.length() >= 4)) {
            StringBuilder sb = new StringBuilder();
            for (int k = 0; k < disp.length(); k++) {
              char c = disp.charAt(k);
              if (c < 'A' || c > 'Z') return voice(lo);
              sb.append(GboardRamblerSentenceLang.LETTER[c - 'A']);
            }
            diagHits++;
            return sb.toString();
          }
        }
      }
    } catch (Throwable e) {
      diagFailures++;
    }
    return voice(lo);
  }

  /** Hook at the top of ScriptFix.convertTokenLoan. lo is the lower-cased key. Null = old path. */
  static String voice(String lo) {
    try {
      if (!ENABLED_VOICE || IN_VOICE.get() != Boolean.TRUE) return null;
    } catch (Throwable e) {
      return null;
    }
    return spell(lo);
  }

  /** Brand names outside the English dictionary: the letter converter handles them, so they are answered at the token hook. */
  static final HashSet<String> BRAND = new HashSet<>(java.util.Arrays.asList("whatsapp", "facebook", "youtube", "instagram", "iphone", "netflix"));

  /**
   * Wraps Tier1.get (original renamed getOrig). In voice, a word that is in both Tier1 and the override list gets the
   * override spelling, so the k1 and k2 voice paths give one spelling per word. A Tier1 miss stays a miss, and outside
   * voice the Tier1 result is returned unchanged.
   */
  static String tier1(String k, String r) {
    if (r == null || !inVoice()) return r;
    try {
      String o = OVERRIDE.get(k);
      if (o != null) return o;
    } catch (Throwable e) {
      diagFailures++;
    }
    return r;
  }

  /** processVoice exit: hashtags and @handles back to Latin, then one Unicode form for converted tokens. */
  static String exitText(String in, String out) {
    return nfc(in, hashtags(in, out));
  }

  /**
   * Converted tokens get Unicode NFC, which is what Gboard's Bangla layouts type (their key data emits ya/rra/rha as
   * letter + nukta, U+09AF U+09BC etc., not the precomposed U+09DF/U+09DC/U+09DD). Without this, Tier1 and the
   * letter converter give precomposed forms while the loan speller gives decomposed ones, and one message can mix both.
   * A token that already appears as a Bangla-script token in the input is left exactly as it was.
   */
  static String nfc(String in, String out) {
    try {
      if (out == null) return null;
      boolean bn = false;
      for (int i = 0; i < out.length() && !bn; i++) { char c = out.charAt(i); bn = c >= '\u0980' && c <= '\u09ff'; }
      if (!bn || java.text.Normalizer.isNormalized(out, java.text.Normalizer.Form.NFC)) return out;
      HashSet<String> keep = new HashSet<>();
      if (in != null) for (String t : in.split("\\s+")) { for (int i = 0; i < t.length(); i++) { char c = t.charAt(i); if (c >= '\u0980' && c <= '\u09ff') { keep.add(t); break; } } }
      StringBuilder sb = new StringBuilder(out.length() + 8);
      int i = 0, n = out.length();
      while (i < n) {
        int j = i;
        if (Character.isWhitespace(out.charAt(i))) { while (j < n && Character.isWhitespace(out.charAt(j))) j++; sb.append(out, i, j); i = j; continue; }
        while (j < n && !Character.isWhitespace(out.charAt(j))) j++;
        String t = out.substring(i, j);
        if (!keep.contains(t) && !java.text.Normalizer.isNormalized(t, java.text.Normalizer.Form.NFC)) { t = java.text.Normalizer.normalize(t, java.text.Normalizer.Form.NFC); diagNorm++; }
        sb.append(t); i = j;
      }
      return sb.toString();
    } catch (Throwable e) {
      diagFailures++;
      return out;
    }
  }

  static volatile int diagNorm;

  /** processVoice exit: hashtags and @handles back to Latin. */
  static String hashtags(String in, String out) {
    return tags(in, tags(in, out, '#'), '@');
  }

  /**
   * Hashtags and @handles stay Latin in voice on every layout and pin: they only work if they match the Latin tag.
   * The i-th marker ('#' or '@') of the output lines up with the i-th marker of the input; if the counts differ the
   * output is returned unchanged. The run after an output marker (Bangla, ASCII letters/digits, '_', '.', ZWJ/ZWNJ) is
   * put back to the original tag text when that input tag has a Latin letter. An '@' right after a letter or digit
   * (an email address) is counted for alignment but never rewritten. Handles may contain '.', not at the end.
   */
  static String tags(String in, String out, char mark) {
    try {
      if (in == null || out == null || in.indexOf(mark) < 0) return out;
      java.util.ArrayList<String> tags = new java.util.ArrayList<>();
      for (int i = 0; i < in.length(); i++) {
        if (in.charAt(i) != mark) continue;
        char p = i > 0 ? in.charAt(i - 1) : ' ';
        boolean attached = (p >= 'a' && p <= 'z') || (p >= 'A' && p <= 'Z') || (p >= '0' && p <= '9') || p == '_' || (p >= '\u0980' && p <= '\u09ff');
        int j = i + 1; boolean latin = false;
        while (j < in.length()) {
          char c = in.charAt(j);
          if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) latin = true;
          else if (!((c >= '0' && c <= '9') || c == '_' || (mark == '@' && c == '.' && j + 1 < in.length() && isTagChar(in.charAt(j + 1))))) break;
          j++;
        }
        tags.add(latin && !attached ? in.substring(i + 1, j) : null);
      }
      int n = 0;
      for (int i = 0; i < out.length(); i++) if (out.charAt(i) == mark) n++;
      if (n != tags.size()) return out;
      StringBuilder sb = new StringBuilder(out.length() + 16);
      int k = 0, i = 0;
      while (i < out.length()) {
        char c = out.charAt(i);
        sb.append(c); i++;
        if (c != mark) continue;
        String t = tags.get(k++);
        if (t == null) continue;
        int j = i;
        while (j < out.length()) {
          char d = out.charAt(j);
          if ((d >= '\u0980' && d <= '\u09ff') || isTagChar(d) || d == '\u200c' || d == '\u200d' || (mark == '@' && d == '.' && j + 1 < out.length() && (isTagChar(out.charAt(j + 1)) || (out.charAt(j + 1) >= '\u0980' && out.charAt(j + 1) <= '\u09ff')))) j++;
          else break;
        }
        sb.append(t); i = j;
      }
      return sb.toString();
    } catch (Throwable e) {
      diagFailures++;
      return out;
    }
  }

  static boolean isTagChar(char d) {
    return (d >= 'a' && d <= 'z') || (d >= 'A' && d <= 'Z') || (d >= '0' && d <= '9') || d == '_';
  }

  static boolean inVoice() {
    try { return ENABLED_VOICE && IN_VOICE.get() == Boolean.TRUE; } catch (Throwable e) { return false; }
  }

  /**
   * Replaces ScriptFix.convertToken (original renamed convertTokenOrig). Outside voice it returns the original result unchanged.
   * In voice: brand overrides first, and a malformed letter-converter result gets its glide repaired (o + sign -> o + ya + sign).
   */
  static String token(String disp, String lo) {
    boolean v = inVoice();
    if (v) {
      try {
        String k = lo == null ? null : lo.toLowerCase(Locale.US);
        if (k != null && BRAND.contains(k)) {
          String r = OVERRIDE.get(k);
          if (r != null) { diagHits++; return r; }
        }
      } catch (Throwable e) { diagFailures++; }
    }
    String r = GboardRamblerScriptFix.convertTokenOrig(disp, lo);
    if (!v || r == null) return r;
    try {
      if (!GboardRamblerSentenceLang.wellFormed(r)) {
        String f = glide(r);
        if (!GboardRamblerSentenceLang.wellFormed(f)) f = GboardRamblerSentenceLang.repair(f);
        if (GboardRamblerSentenceLang.wellFormed(f)) { diagRepairs++; return f; }
      }
    } catch (Throwable e) { diagFailures++; }
    return r;
  }

  static volatile int diagRepairs;

  /** Independent o/i followed by a vowel sign is a w/y glide: insert ya-nukta (U+0993/U+0987 + sign -> + U+09DF). */
  static String glide(String w) {
    StringBuilder o = new StringBuilder(w.length() + 4);
    for (int k = 0; k < w.length(); k++) {
      char c = w.charAt(k);
      o.append(c);
      if ((c == '\u0993' || c == '\u0987') && k + 1 < w.length() && GboardRamblerSentenceLang.sign(w.charAt(k + 1))) o.append('\u09df');
    }
    return o.toString();
  }

  static String spell(String lo) {
    try {
      if (lo == null || lo.length() < 2 || lo.indexOf('\'') >= 0) return null;
      for (int i = 0; i < lo.length(); i++) {
        char c = lo.charAt(i);
        if (c < 'a' || c > 'z') return null;
      }
      String curated = CURATED_BANGLA_LOANS.get(lo);
      if (curated != null) {
        diagHits++;
        return curated;
      }
      HashSet<String> bn = banglaWords();
      if (bn == null || bn.contains(lo)) return null;
      String r = OVERRIDE.get(lo);
      if (r == null) {
        // Prefer curated 2,265-word Avro Tier-1 dictionary before raw CMUdict phonemes.
        String t1 = GboardRamblerTier1.get(lo);
        if (t1 != null && GboardRamblerSentenceLang.wellFormed(t1)) {
          diagHits++;
          return t1;
        }
        HashMap<String, String> t = table;
        if (t == null) {
          // Warm-wait up to 150ms (table parses in ~15-25ms) so first dictation after boot/update
          // never cold-misses into broken letter-by-letter Avro (e.g. client -> কলিএনত).
          preload();
          try {
            READY.await(150L, java.util.concurrent.TimeUnit.MILLISECONDS);
          } catch (InterruptedException ie) {
            Thread.currentThread().interrupt();
          }
          t = table;
          if (t == null) {
            diagColdMiss++;
            return null;
          }
        }
        r = t.get(lo);
        if (r != null) {
          r = cleanCmuLoanSpelling(lo, r);
        }
      }
      if (r == null || !GboardRamblerSentenceLang.wellFormed(r)) return null;
      diagHits++;
      return r;
    } catch (Throwable e) {
      diagFailures++;
      return null;
    }
  }

  /**
   * Fixes systematic CMUdict-to-Bengali phoneme artifacts across all 17,841 table entries:
   * initial "un-" -> "আ", "-ear/-eer" "ির্লি" -> "িয়ারলি", "oi/oy" "য়স/য়ন্ট" -> "য়েস/য়েন্ট",
   * double "জজ" plurals -> "জেস", voiced plural "-s" trailing "জ" -> "স", and awkward clusters.
   */
  static String cleanCmuLoanSpelling(String lo, String bn) {
    if (lo == null || bn == null || bn.isEmpty()) return bn;
    String s = bn;
    if ((lo.startsWith("under") || (lo.startsWith("un") && lo.length() >= 4)) && s.startsWith("অ") && !s.startsWith("অ্যা")) {
      s = "আ" + s.substring(1);
    }
    if (lo.startsWith("up") && lo.length() >= 4 && s.startsWith("অপ")) {
      s = "আপ" + s.substring(2);
    }
    if (lo.startsWith("multi") && s.startsWith("মল্টি")) {
      s = "মাল্টি" + s.substring(5);
    }
    if (lo.startsWith("exp") && s.startsWith("ইক্স্প")) {
      s = "এক্সপ" + s.substring(6);
    }
    if (s.contains("ির্লি")) {
      s = s.replace("ির্লি", "িয়ারলি");
    }
    if (s.contains("াইঅন্ট")) {
      s = s.replace("াইঅন্ট", "ায়েন্ট");
    }
    if (lo.endsWith("body") && s.endsWith("বোডি")) {
      s = s.substring(0, s.length() - 4) + "বডি";
    }
    if (lo.endsWith("one") && s.endsWith("ওয়ন")) {
      s = s.substring(0, s.length() - 4) + "ওয়ান";
    }
    if (s.contains("ন্চওয়")) {
      s = s.replace("ন্চওয়", "নচুয়া");
    }
    if (lo.endsWith("ted") && s.endsWith("টিড")) {
      s = s.substring(0, s.length() - 3) + "টেড";
    } else if (lo.endsWith("ded") && s.endsWith("ডিড")) {
      s = s.substring(0, s.length() - 3) + "ডেড";
    }
    if ((lo.endsWith("nce") || lo.endsWith("nse")) && s.endsWith("নস")) {
      s = s.substring(0, s.length() - 2) + "ন্স";
    }
    if ((lo.endsWith("ear") || lo.endsWith("eer")) && s.endsWith("ির")) {
      s = s.substring(0, s.length() - 2) + "িয়ার";
    }
    if (lo.endsWith("board") && s.endsWith("বর্ড")) {
      s = s.substring(0, s.length() - 4) + "বোর্ড";
    }
    if (lo.contains("oi") || lo.contains("oy")) {
      s = s.replace("য়স", "য়েস").replace("য়ন্ট", "য়েন্ট");
    }
    s = s.replace("ক্স্চ", "ক্সচ")
         .replace("ক্স্ট", "ক্সট")
         .replace("ম্প্লি", "ম্পলি")
         .replace("ন্জ", "ঞ্জ");
    if (s.endsWith("জজ")) {
      s = s.substring(0, s.length() - 2) + "জেস";
    } else if (s.endsWith("সজ") && lo.endsWith("ses")) {
      s = s.substring(0, s.length() - 2) + "সেস";
    }
    if (lo.endsWith("s")
        && !lo.endsWith("ss")
        && !lo.endsWith("se")
        && !lo.endsWith("ze")
        && !lo.endsWith("ge")
        && !lo.endsWith("ays")
        && !lo.endsWith("eys")
        && !lo.endsWith("oys")
        && s.endsWith("জ")
        && s.length() >= 2) {
      char prev = s.charAt(s.length() - 2);
      if ("ডংনমলবগরভদটকপ".indexOf(prev) >= 0) {
        s = s.substring(0, s.length() - 1) + "স";
      }
    }
    return s;
  }
}
