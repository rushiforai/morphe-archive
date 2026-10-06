package app.yydarlinker.deepseekcaptions;

import java.util.*;

/** Network ownership blocks only. There is no second local subtitle segmentation pipeline. */
final class RebuildPlanner {
  private static final java.util.concurrent.ConcurrentHashMap<String,java.util.regex.Pattern> PATTERNS = new java.util.concurrent.ConcurrentHashMap<>();
  static boolean matches(String value,String regex) {return PATTERNS.computeIfAbsent(regex,java.util.regex.Pattern::compile).matcher(value).matches();}
  static final int MAX_WORDS = 160, MAX_CHARS = 1600;
  static final long MAX_SPAN = 30000;

  static final class Block {
    final int index, from, to;
    final long start, end;
    final boolean continuedBefore, continuedAfter;

    Block(int i, int f, int t, RebuildSource s) {
      index = i;
      from = f;
      to = t;
      start = s.words.get(f).start;
      end = s.words.get(t).end;
      continuedBefore = f > 0 && !boundary(s, f - 1);
      continuedAfter = t + 1 < s.words.size() && !boundary(s, t);
    }

    String id() {
      return "b" + index + "_" + from + "_" + to;
    }
  }

  /** Explicit legacy entry for fixed English fixtures. */
  static List<Block> plan(RebuildSource s) { return plan(s, CaptionLanguageContext.LEGACY); }
  static List<Block> plan(RebuildSource s, CaptionLanguageContext context) {
    List<Block> out = new ArrayList<>();
    int from = 0;
    while (from < s.words.size()) {
      int end = from, lastBoundary = -1, chars = 0;
      long aim = out.isEmpty() ? 6000 : 14000;
      for (int i = from; i < s.words.size(); i++) {
        RebuildSource.Word w = s.words.get(i);
        long span = w.end - s.words.get(from).start;
        if (i > from
            && (i - from >= MAX_WORDS || span > MAX_SPAN || chars + w.text.length() > MAX_CHARS))
          break;
        end = i;
        chars += w.text.length();
        if(out.isEmpty() && span>=6000 && i+1<s.words.size() && safeCut(s,i,context) && resourceScore(s,i,context)>=50) break;
        if (boundary(s, i)) {
          lastBoundary = i;
          if (span >= aim || i + 1 == s.words.size() || hardBreakBefore(s, i + 1))
            break;
        }
      }
      if (lastBoundary >= from) end = lastBoundary;
      // Search BACKWARD inside hard resource limits. No invented extension beyond the ceiling.
      else if (end + 1 < s.words.size()) {
        int best = end, score = Integer.MIN_VALUE;
        for (int i = end; i > from + (end - from) / 2; i--) {
          if (!safeCut(s, i, context)) continue;
          int candidate = resourceScore(s, i, context);
          if (candidate > score) {
            best = i;
            score = candidate;
          }
        }
        if (score != Integer.MIN_VALUE) end = best;
        // If all late candidates are dependent, prefer any earlier safe cut; otherwise
        // retain the hard cut and declare continuation rather than making an impossible protocol.
        else if(dependentEnding(s,end,context))for(int i=end-1;i>=from;i--)if(safeCut(s,i,context)){end=i;break;}
      }
      out.add(new Block(out.size(), from, end, s));
      from = end + 1;
    }
    return Collections.unmodifiableList(out);
  }

  static boolean dependentEnding(RebuildSource s, int i) {
    if (i < 0 || i >= s.words.size()) return false;
    if (RebuildSource.terminal(s.words.get(i).text)) return false;
    String x = s.words.get(i).key;
    String previous=i>0?s.words.get(i-1).key:"";
    // A stranded preposition can complete a question; do not forbid "where ... coming from / and yet".
    if(x.equals("from")&&matches(previous,"come|comes|coming|came")&&i+1<s.words.size()
        &&s.words.get(i+1).key.matches("and|but|however"))return false;
    if(matches(x,"firstly|secondly|thirdly|finally|then")&&matches(previous,"and|but|or"))return true;
    return matches(x,"(?i)(if|because|although|though|while|which|that|so|as|than|and|or|but|to|of|with|without|for|from|in|on|at|by|about|including|into|between|like|rather|whether|unless|until|before|after|where|when|what|who|how|more|less|not|no|its|their|his|her|this|that|a|an|the|every|each|any|some|another|firstly|secondly|thirdly)");
  }

  static boolean strongDependentEnding(RebuildSource s,int i) {
    if (boundary(s,i))return false;
    return s.words.get(i).key.matches("(?i)(if|because|although|unless|whether|including|the|an)");
  }

  static boolean safeCut(RebuildSource s, int i) {
    return i >= 0 && i < s.words.size() && !dependentEnding(s, i) && !protectedCut(s,i);
  }

  static boolean protectedCut(RebuildSource s,int i) {
    if(i<0||i+1>=s.words.size()||boundary(s,i))return false;
    String left=s.words.get(i).key, right=s.words.get(i+1).key;
    String pair=left+" "+right;
    // A direction particle belongs with its verb even when the time ceiling is near.
    if(matches(pair,"(?i)(modernization picture|out past|range out|ballistic missiles?|cruise missiles?|surface-to-air missiles?|aircraft carriers?|fifth generation|5th generation|generation (fighters?|aircraft)|korean peninsula|purchasing power|power parity)"))return true;
    // ASR 'then' is left unchanged. Comparative context is a dependency hint, not a correction.
    if(matches(left,"than|then")&&s.text(Math.max(0,i-35),i).matches("(?s).*\\b(more|less|rather)\\b.*"))return true;
    if(left.equals("past") && matches(right,"[a-z][a-z-]+"))return true;
    if(left.equals("universally")&&matches(right,"phased|replaced|adopted"))return true;
    // A finite verb after a lexical subject is a weak syntactic signal; do not hard-reject it.
    return matches(left,"[a-z][a-z'-]+")&&!matches(left,"and|or|but|then|also|was|were|is|are|be|been|being|has|have|had|can|could|will|would|not|never|that|which|who")
        && matches(right,"reduced|increased|announced|decided|said|argued|explained|aims|plans");
  }

  static int resourceScore(RebuildSource s, int i) {
    String left = s.words.get(i).key;

    // Protect visibly dependent endings. This only chooses among request cuts; never edits text.
    if (dependentEnding(s, i) || protectedCut(s,i)
        || matches(left,"(?i)(a|an|the|of|to|with|without|and|or|not|no|very|particularly|more|less|than|as)")
        || matches(left,"[+-]?[0-9].*")) return -100;
    String next = s.text(i + 1, Math.min(s.words.size() - 1, i + 7)).toLowerCase(Locale.ROOT);
    // A contrast pivot or dated proposition can start the next request without stranding
    // the preceding conditional or verb phrase in the previous request.
    if (matches(next,"^(if|because|although|unless|but|while|however|whereas|instead|secondly|thirdly|finally)\\b.*")
        || matches(next,"^and (then|so|finally|critically|yet|i|we|it|this|that|while)\\b.*")
        || matches(next,"^come [12][0-9]{3}\\b.*")) return 60;
    if (next.matches(
            "^(it|this|that|they|we|he|she|i)"
                + " (is|was|were|are|has|have|had|will|would|can|could|do|did)\\b.*")
        || matches(next,"^(the|a|an) [a-z]+(?: [a-z]+)? (is|was|were|are|has|have|had|will|would|can|could)\\b.*")
        || matches(next,"^[a-z][a-z'-]+ (reduced|increased|announced|decided|said|argued|explained|aims|plans)\\b.*")
        || matches(next,"^in [12][0-9]{3} (?:[a-z]+ ){1,2}(?:could|can|had|has|was|were|is|are)\\b.*")
        || matches(next,"^the (reality|creation|question|point|goal|reason|problem|result|argument)\\b.*")
        || next.startsWith("i'm ")
        || next.startsWith("let's ")) return 50;
    if (left.endsWith(",") || s.words.get(i).text.endsWith(",")) return 30;
    return s.words.get(i).cue != s.words.get(i + 1).cue ? 10 : 0;
  }

  static boolean dependentEnding(RebuildSource s,int i,CaptionLanguageContext context) {
    return context.englishSource && dependentEnding(s,i);
  }
  static boolean strongDependentEnding(RebuildSource s,int i,CaptionLanguageContext context) {
    return context.canApplyEnglishToChinese && strongDependentEnding(s,i);
  }
  static boolean protectedCut(RebuildSource s,int i,CaptionLanguageContext context) {
    return context.englishSource && protectedCut(s,i);
  }
  static boolean safeCut(RebuildSource s,int i,CaptionLanguageContext context) {
    return i>=0 && i<s.words.size() && !dependentEnding(s,i,context) && !protectedCut(s,i,context);
  }
  static int resourceScore(RebuildSource s,int i,CaptionLanguageContext context) {
    if(context.englishSource)return resourceScore(s,i);
    if(boundary(s,i))return 60;
    String text=s.words.get(i).text;
    if(text.endsWith(",") || text.endsWith("，") || text.endsWith(";") || text.endsWith("；"))return 30;
    return i+1<s.words.size() && s.words.get(i).cue!=s.words.get(i+1).cue ? 10 : 0;
  }

  /** Same hard source ownership boundary as RebuildProtocol; punctuation is only a soft cut. */
  static boolean hardBreakBefore(RebuildSource s, int token) {
    return token > 0 && token < s.words.size()
        && (s.words.get(token).start - s.words.get(token - 1).end >= 650
            || s.words.get(token).text.startsWith(">>"));
  }

  static boolean boundary(RebuildSource s, int i) {
    return RebuildSource.terminal(s.words.get(i).text)
        || i + 1 == s.words.size()
        || s.words.get(i + 1).start - s.words.get(i).end >= 650
        || s.words.get(i + 1).text.startsWith(">>");
  }

  static String context(RebuildSource s, int from, int to) {
    if (from > to) return "";
    int lo = Math.max(0, from), hi = Math.min(s.words.size() - 1, to);
    String x = s.text(lo, hi);
    while (x.length() > 360 && hi > lo) {
      if (from < 0) lo++;
      else hi--;
      x = s.text(lo, hi);
    }
    return x.length() <= 360 ? x : "";
  }
}
