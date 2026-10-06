package app.yydarlinker.deepseekcaptions;


/**
 * Bounded, display-only joins for accepted adjacent events. It never changes source ownership or
 * the timing stored on either accepted event.
 */
final class RebuildDisplayMerge {
  static final long SHORT_PAGE_MS = 1000;
  static final long MAX_ADJACENCY_GAP_MS = 0;
  static final long MAX_MERGED_EVENT_MS = 5000;
  static final int MAX_MERGED_CODE_POINTS = 48;
  static final int MAX_CPS = 12;

  static final class Merged {
    final RebuildProtocol.Event left, right;
    final int from, to;
    final long start, end;
    final String text;

    Merged(RebuildProtocol.Event a, RebuildProtocol.Event b, String value) {
      left = a;
      right = b;
      from = a.from;
      to = b.to;
      start = a.start;
      end = b.end;
      text = value;
    }

    String id() {
      return "merge:" + from + "-" + to;
    }

    int codePoints() {
      return text.codePointCount(0, text.length());
    }

    double cps() {
      return codePoints() * 1000.0 / Math.max(1, end - start);
    }
  }

  private RebuildDisplayMerge() {}

  static boolean isShort(RebuildProtocol.Event event) {
    return event != null && event.end > event.start && event.end - event.start < SHORT_PAGE_MS;
  }

  /** A small non-terminal lead may offer a join, but is always independently visible. */
  static boolean isLead(RebuildProtocol.Event event) {
    if (event == null || event.text == null) return false;
    String text = normalize(event.text);
    return !text.isEmpty()
        && text.codePointCount(0, text.length()) <= 12
        && !endsWithTerminal(text);
  }

  static Merged merge(RebuildSource source, RebuildProtocol.Event left,
      RebuildProtocol.Event right) {
    if (!adjacent(source, left, right)) return null;
    if (!isLead(left) && !isShort(right)) return null;
    String text = join(left.text, right.text);
    long start = left.start;
    long end = right.end;
    int count = text.codePointCount(0, text.length());
    long duration = end - start;
    if (duration <= 0 || duration > MAX_MERGED_EVENT_MS || count > MAX_MERGED_CODE_POINTS
        || count * 1000L > duration * MAX_CPS) return null;
    return new Merged(left, right, text);
  }

  static boolean adjacent(RebuildSource source, RebuildProtocol.Event left,
      RebuildProtocol.Event right) {
    if (source == null || left == null || right == null || left.to + 1 != right.from
        || RebuildPlanner.hardBreakBefore(source,right.from)) return false;
    if (left.start >= left.end || right.start >= right.end || left.end > right.start) return false;
    return right.start - left.end <= MAX_ADJACENCY_GAP_MS;
  }

  static boolean shouldDeferLead(RebuildSource source, RebuildProtocol.Event lead,
      RebuildProtocol.Event continuation, long position) {
    return false; // Display preference is never authority to hide an accepted lead.
  }

  private static String normalize(String value) {
    return value == null ? "" : value.replaceAll("\\s+$", "").trim();
  }

  private static boolean endsWithTerminal(String value) {
    int cp = value.codePointBefore(value.length());
    return "。！？!?；;".indexOf(cp) >= 0;
  }

  private static String join(String left, String right) {
    String a = left == null ? "" : left.trim();
    String b = right == null ? "" : right.trim();
    if (a.isEmpty()) return b;
    if (b.isEmpty()) return a;
    int l = a.codePointBefore(a.length());
    int r = b.codePointAt(0);
    if (!RebuildSource.cjk(l) && !RebuildSource.cjk(r)
        && Character.isLetterOrDigit(r)
        && Character.isLetterOrDigit(l)) return a + " " + b;
    return a + b;
  }
}


