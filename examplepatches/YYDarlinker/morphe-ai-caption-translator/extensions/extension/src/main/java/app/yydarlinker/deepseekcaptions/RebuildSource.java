package app.yydarlinker.deepseekcaptions;

import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.*;
import org.json.*;

/** Immutable evidence, not subtitles. Native segment bounds are never inferred from target text. */
final class RebuildSource {
  enum Precision {
    NATIVE,
    ESTIMATED,
    ALIGNED
  }

  enum AnchorKind { WORD_ONSET, SEGMENT_ONSET, CUE_ONSET, CUE_END_BOUND }

  static final class TimeAnchor {
    final int boundary;
    final long timeMs;
    final AnchorKind kind;
    final String origin;
    final int cue;
    TimeAnchor(int boundary,long timeMs,AnchorKind kind,String origin,int cue) {
      this.boundary=boundary;this.timeMs=timeMs;this.kind=kind;this.origin=origin;this.cue=cue;
    }
  }

  static final class TimedWindow {
    final int from,to;
    final long start,end;
    TimedWindow(int from,int to,long start,long end){this.from=from;this.to=to;this.start=start;this.end=end;}
    boolean contains(long time){return start<=time&&time<end;}
  }

  static final class Word {
    final String text, key;
    final long start, end;
    final int cue;
    final Precision precision;

    Word(String t, long s, long e, int c, Precision p) {
      text = t;
      key = key(t);
      start = s;
      end = e;
      cue = c;
      precision = p;
    }
  }

  /** Coarse spans are ordered BEFORE interpolation; never sort invented word onsets. */
  private static final class Span {
    final String text;
    final long start, end;
    final int cue;
    final boolean nativeOffset, speakerBreak;
    final List<Integer> speakerOffsets;

    Span(String t, long a, long z, int c, boolean n) {
      this(t,a,z,c,n,false);
    }
    Span(String t,long a,long z,int c,boolean n,boolean speaker) {
      this(t,a,z,c,n,speaker,Collections.emptyList());
    }
    Span(String t,long a,long z,int c,boolean n,boolean speaker,List<Integer> offsets) {
      speakerBreak=speaker;speakerOffsets=offsets;
      text = t;
      start = a;
      end = z;
      cue = c;
      nativeOffset = n;
    }
  }

  final List<Word> words;
  final List<TimeAnchor> anchors;
  final boolean coarseCueReconstructed;
  final int coarseCueCount;
  final String formatEvidence;

  RebuildSource(List<Word> values) {
    this(values, Collections.emptyList(), false, 0, "");
  }

  private RebuildSource(List<Word> values, boolean reconstructed, int count) {
    this(values, Collections.emptyList(), reconstructed, count, "");
  }
  private RebuildSource(List<Word> values,List<TimeAnchor> anchors,boolean reconstructed,int count,String evidence) {
    formatEvidence=evidence;
    words = Collections.unmodifiableList(new ArrayList<>(values));
    this.anchors=Collections.unmodifiableList(new ArrayList<>(anchors));
    coarseCueReconstructed = reconstructed;
    coarseCueCount = count;
  }

  private RebuildSource(List<Word> values,boolean reconstructed,int count,String evidence) {
    this(values,Collections.emptyList(),reconstructed,count,evidence);
  }

  static final Pattern TOKEN =
      Pattern.compile(
          "[\\p{IsHan}\\p{IsHiragana}\\p{IsKatakana}\\p{IsHangul}]|[+-]?\\p{N}+(?:[.,:/-]\\p{N}+)*(?:[a-zA-Z]+)?(?:%|％)?|[\\p{L}\\p{M}]+(?:[.'’_\\-][\\p{L}\\p{M}\\p{N}]+)*|[^\\s]");

  static List<String> tokens(String text) {
    List<String> result = new ArrayList<>();
    Matcher m = TOKEN.matcher(text == null ? "" : text);
    while (m.find()) {
      String t = m.group();
      if (!lexical(t) && !result.isEmpty() && !opening(t))
        result.set(result.size() - 1, result.get(result.size() - 1) + t);
      else result.add(t);
    }
    return result;
  }

  static boolean lexical(String s) {
    return s.codePoints().anyMatch(Character::isLetterOrDigit);
  }

  private static boolean opening(String s) {
    return "([{（【《“‘\"".contains(s);
  }

  private static final Pattern KEY_EDGE=Pattern.compile("^[^\\p{L}\\p{N}+\\-]+|[^\\p{L}\\p{N}%]+$");
  static String key(String s) {
    return KEY_EDGE.matcher(Normalizer.normalize(s, Normalizer.Form.NFKC)
        .toLowerCase(Locale.ROOT)
        .replace('’', '\'')
        .replace('−', '-')
        ).replaceAll("");
  }

  static boolean cjk(int c) {
    Character.UnicodeScript s = Character.UnicodeScript.of(c);
    return s == Character.UnicodeScript.HAN
        || s == Character.UnicodeScript.HIRAGANA
        || s == Character.UnicodeScript.KATAKANA
        || s == Character.UnicodeScript.HANGUL;
  }

  static String join(List<Word> w, int from, int to) {
    StringBuilder b = new StringBuilder();
    for (int i = from; i <= to; i++) {
      String s = w.get(i).text;
      if (b.length() > 0 && !s.isEmpty()) {
        int l = b.codePointBefore(b.length()), q = s.codePointAt(0);
        if (!cjk(l)
            && !cjk(q)
            && Character.isLetterOrDigit(q)
            && !"([{（【《“‘".contains(new String(Character.toChars(l)))) b.append(' ');
      }
      b.append(s);
    }
    return b.toString();
  }

  String text(int a, int b) {
    return join(words, a, b);
  }

  int nativeWordCount() {
    int count=0;for(Word word:words)if(word.precision==Precision.NATIVE)count++;return count;
  }
  int segmentAnchorCount() {
    int count=0;for(TimeAnchor anchor:anchors)if(anchor.kind==AnchorKind.SEGMENT_ONSET)count++;return count;
  }
  int cueAnchorCount() {
    int count=0;for(TimeAnchor anchor:anchors)if(anchor.kind==AnchorKind.CUE_ONSET||anchor.kind==AnchorKind.CUE_END_BOUND)count++;return count;
  }
  boolean hasPartialTiming() { return segmentAnchorCount()>0||cueAnchorCount()>0; }
  int matchedWordCount(RebuildSource reference) {
    return reference==null?0:uniqueWordMatches(words,reference.words).size();
  }
  int timingQualityAgainst(RebuildSource primary) {
    int matched=primary==null?6:primary.matchedWordCount(this);
    if(matched<6)return 0;
    if(nativeWordCount()>0)return 3;
    if(segmentAnchorCount()>0)return 2;
    if(cueAnchorCount()>0)return 1;
    return 0;
  }
  String timingCapabilities() {
    return "word_direct="+nativeWordCount()+";segment_anchors="+segmentAnchorCount()
        +";cue_anchors="+cueAnchorCount()+";words="+words.size()+";format="
        +(formatEvidence.isEmpty()?"unknown":formatEvidence);
  }

  List<TimedWindow> windows() {
    if(words.isEmpty())return Collections.emptyList();
    List<TimedWindow> result=new ArrayList<>();int from=0;long start=words.get(0).start,end=words.get(0).end;
    int cue=words.get(0).cue;
    for(int i=1;i<words.size();i++){
      Word prior=words.get(i-1),now=words.get(i);
      boolean split=now.cue!=cue || now.start-prior.end>=650 || now.text.startsWith(">>");
      if(split){if(end>start)result.add(new TimedWindow(from,i-1,start,end));from=i;start=now.start;cue=now.cue;}
      end=Math.max(end,now.end);
    }
    if(end>start)result.add(new TimedWindow(from,words.size()-1,start,end));
    return Collections.unmodifiableList(result);
  }
  TimedWindow windowAt(long time) {
    TimedWindow latest=null;for(TimedWindow window:windows()){
      if(window.contains(time))return window;
      if(window.start<=time)latest=window;
    }return null;
  }

  static boolean terminal(String s) {
    return s.matches("(?s).*[.!?。！？][\\\"'”’）)]*$")
        && !s.matches("(?i).*(?:\\bMr|\\bMrs|\\bDr|\\bProf|\\bvs|\\betc)\\.");
  }

  static boolean nonSpeech(String s) {
    String t = s.trim().toLowerCase(Locale.ROOT);
    return t.matches("[♪♫\\s]+")
        || t.matches("[\\[（(【]\\s*(music|applause|laughter|音乐|掌声|笑声)\\s*[\\]）)】]");
  }

  static RebuildSource read(byte[] body, CaptionDocument.Parsed parsed) throws Exception {
    List<Span> spans = new ArrayList<>();
    Map<Integer, CoarseFrame> frames = new HashMap<>();
    String raw = new String(body, StandardCharsets.UTF_8).trim();
    if(raw.startsWith("\uFEFF"))raw=raw.substring(1).trim();
    boolean webVtt=raw.startsWith("WEBVTT");String formatEvidence="";
    if(webVtt) {
      WebVttSourceReader.Result vtt=WebVttSourceReader.read(raw);formatEvidence=vtt.evidence();
      for(WebVttSourceReader.Range range:vtt.ranges)
        spans.add(new Span(range.text,range.start,range.end,range.cue,range.nativeStart,range.speakerBreak,range.speakerOffsets));
    }
    if (raw.startsWith("{")) {
      JSONArray es = new JSONObject(raw).optJSONArray("events");
      if (es != null)
        for (int i = 0; i < es.length(); i++) {
          JSONObject e = es.optJSONObject(i);
          if (e == null) continue;
          JSONArray ss = e.optJSONArray("segs");
          if (ss == null) continue;
          long start = e.optLong("tStartMs", -1), duration = e.optLong("dDurationMs", -1);
          if (start < 0) continue;
          long next = Long.MAX_VALUE;
          for (int j = i + 1; j < es.length(); j++) {
            JSONObject n = es.optJSONObject(j);
            if (n != null && n.optLong("tStartMs", -1) > start && n.optJSONArray("segs") != null) {
              next = n.optLong("tStartMs");
              break;
            }
          }
          long end = duration > 0 ? start + duration : next == Long.MAX_VALUE ? start + 2000 : next;
          if (end <= start) continue;
          boolean offsets = false;
          for (int j = 0; j < ss.length(); j++) {
            JSONObject part = ss.optJSONObject(j);
            offsets |= part != null && part.has("tOffsetMs");
          }
          if (!offsets) {
            StringBuilder text = new StringBuilder();
            for (int j = 0; j < ss.length(); j++) {
              JSONObject part = ss.optJSONObject(j);
              if (part != null) text.append(part.optString("utf8", ""));
            }
            if (e.has("wWinId")) {
              int window = e.optInt("wWinId");
              frames.put(
                  window,
                  appendFrame(
                      spans,
                      text.toString(),
                      start,
                      end,
                      i,
                      e.optInt("aAppend", 0) == 1,
                      frames.get(window)));
            } else spans.add(new Span(text.toString(), start, end, i, false));
          } else {
            // Merge runs with no independent onset instead of inventing simultaneous word order.
            long offset = 0;
            StringBuilder text = new StringBuilder();
            boolean nativeStart = true;
            for (int j = 0; j < ss.length(); j++) {
              JSONObject part = ss.optJSONObject(j);
              if (part == null) continue;
              if (part.has("tOffsetMs")) {
                long value = part.optLong("tOffsetMs", -1);
                if (value < offset || value < 0 || start + value >= end)
                  throw new IllegalArgumentException("source_offset_order");
                if (value > offset) {
                  if (text.length() > 0)
                    spans.add(
                        new Span(text.toString(), start + offset, start + value, i, nativeStart));
                  text.setLength(0);
                  offset = value;
                  nativeStart = true;
                }
              }
              text.append(part.optString("utf8", ""));
            }
            if (text.length() > 0)
              spans.add(new Span(text.toString(), start + offset, end, i, nativeStart));
          }
        }
    }
    if (spans.isEmpty() && !webVtt) {
      int i = 0;
      for (CaptionDocument.Cue c : parsed.cues())
        spans.add(new Span(c.text, c.startMs, c.endMs, i++, false));
    }
    // Ordering comes from real cue/segment onsets. A multiword coarse span remains indivisible
    // during ordering. Equal real native onsets may be repeated by an overlapping JSON3 window.
    spans.sort(Comparator.comparingLong((Span v) -> v.start));
    List<Span> ordered = new ArrayList<>();
    Set<String> nativeSeen = new HashSet<>();
    for (Span span : spans) {
      List<String> ts = tokens(span.text);
      if (ts.isEmpty() || span.end <= span.start) continue;
      if (!webVtt && span.nativeOffset && ts.size() == 1 && !nativeSeen.add(span.start + "|" + key(ts.get(0))))
        continue;
      if (!ordered.isEmpty() && ordered.get(ordered.size() - 1).start == span.start) {
        Span a = ordered.remove(ordered.size() - 1);
        // Simultaneous coarse observations have no word-order timing proof. Keep both texts.
        ordered.add(
            new Span(
                a.text.trim() + " " + span.text.trim(),
                a.start,
                Math.max(a.end, span.end),
                a.cue,
                false));
      } else ordered.add(span);
    }
    List<Word> out = new ArrayList<>();
    List<TimeAnchor> observed = new ArrayList<>();
    boolean repaired = false;
    int coarse = 0;
    for (int i = 0; i < ordered.size(); i++) {
      Span span = ordered.get(i);
      boolean estimated = !span.nativeOffset || tokens(span.text).size() != 1;
      if (estimated) coarse++;
      long end = span.end;
      if (i + 1 < ordered.size() && ordered.get(i + 1).start < end) {
        end = ordered.get(i + 1).start;
        repaired |= estimated;
      }
      int first=out.size();Set<Integer> speakerWords=new HashSet<>();if(span.speakerBreak)speakerWords.add(0);
      List<String> spanTokens=tokens(span.text);
      AnchorKind onsetKind=span.nativeOffset && spanTokens.size()==1
          ? AnchorKind.WORD_ONSET : span.nativeOffset ? AnchorKind.SEGMENT_ONSET : AnchorKind.CUE_ONSET;
      if(!spanTokens.isEmpty()) observed.add(new TimeAnchor(first,span.start,onsetKind,
          webVtt?"vtt":raw.startsWith("{")?"json3":"cue",span.cue));
      if(span.speakerOffsets.isEmpty())add(out,span.text,span.start,end,span.cue,span.nativeOffset);
      else {
        List<String> speech=new ArrayList<>();int from=0;
        for(int mark:span.speakerOffsets)if(mark>=from && mark<span.text.length()) {
          speech.addAll(tokens(span.text.substring(from,mark).replace('\u00a0',' ')));
          speakerWords.add(speech.size());from=mark;
        }
        speech.addAll(tokens(span.text.substring(from).replace('\u00a0',' ')));
        if(end-span.start<speech.size())throw new IllegalArgumentException("vtt_voice_time_capacity");
        addTokens(out,speech,span.text,span.start,end,span.cue,span.nativeOffset);
      }
      if(!spanTokens.isEmpty()) observed.add(new TimeAnchor(out.size(),end,AnchorKind.CUE_END_BOUND,
          webVtt?"vtt":raw.startsWith("{")?"json3":"cue",span.cue));
      for(int index:speakerWords)if(first+index>=first && first+index<out.size()){Word word=out.get(first+index);
        out.set(first+index,new Word(">>"+word.text,word.start,word.end,word.cue,word.precision));}
    }
    if (out.isEmpty()) throw new IllegalArgumentException("source_empty");
    for (int i = 1; i < out.size(); i++)
      if (out.get(i).start < out.get(i - 1).end)
        throw new IllegalArgumentException("source_time_order");
    return new RebuildSource(out, observed, repaired, coarse,formatEvidence);
  }

  /**
   * Only explicit, overlapping display windows may carry earlier text. Repetition alone is not
   * evidence.
   */
  private static final class CoarseFrame {
    final List<String> tokens;
    final long end;
    final boolean rolling;
    final int lastCue;

    CoarseFrame(List<String> ts, long e, boolean r, int c) {
      tokens = ts;
      end = e;
      rolling = r;
      lastCue = c;
    }
  }

  private static CoarseFrame appendFrame(
      List<Span> out,
      String text,
      long start,
      long end,
      int cue,
      boolean append,
      CoarseFrame previous) {
    List<String> now = tokens(text);
    if (now.isEmpty()) return previous;
    int carry = 0;
    boolean rolling = false;
    if (previous != null && !append && start < previous.end) {
      boolean grows =
          now.size() > previous.tokens.size()
              && sameRange(previous.tokens, 0, now, 0, previous.tokens.size());
      if (grows) {
        carry = previous.tokens.size();
        rolling = true;
      } else if (previous.rolling) {
        for (int n = Math.min(previous.tokens.size(), now.size()); n > 0; n--)
          if (sameRange(previous.tokens, previous.tokens.size() - n, now, 0, n)) {
            carry = n;
            rolling = true;
            break;
          }
      }
    }
    int lastCue = previous == null ? cue : previous.lastCue;
    if (carry < now.size()) {
      StringBuilder fresh = new StringBuilder();
      for (int n = carry; n < now.size(); n++) {
        String value = now.get(n);
        if (fresh.length() > 0
            && !value.isEmpty()
            && !cjk(fresh.codePointBefore(fresh.length()))
            && !cjk(value.codePointAt(0))) fresh.append(' ');
        fresh.append(value);
      }
      out.add(new Span(fresh.toString(), start, end, cue, false));
      lastCue = cue;
    }
    return new CoarseFrame(now, end, rolling, lastCue);
  }

  private static boolean sameRange(List<String> a, int x, List<String> b, int y, int count) {
    for (int k = 0; k < count; k++) if (!key(a.get(x + k)).equals(key(b.get(y + k)))) return false;
    return count > 0;
  }

  private static void add(
      List<Word> out, String text, long start, long end, int cue, boolean nativeOffset) {
    List<String> ts = tokens(text.replace('\u00a0', ' '));
    addTokens(out,ts,text,start,end,cue,nativeOffset);
  }
  private static void addTokens(List<Word> out,List<String> ts,String text,long start,long end,int cue,boolean nativeOffset) {
    if (ts.isEmpty() || end <= start) return;
    if (end - start < ts.size()) {
      out.add(new Word(text.trim(), start, end, cue, Precision.ESTIMATED));
      return;
    }
    // Uniform lexical allocation is explicitly estimated; no spelling-length timing heuristic.
    for (int i = 0; i < ts.size(); i++) {
      long a = start + (end - start) * i / ts.size(),
          b = start + (end - start) * (i + 1) / ts.size();
      if (b > a)
        out.add(
            new Word(
                ts.get(i),
                a,
                b,
                cue,
                nativeOffset && ts.size() == 1 ? Precision.NATIVE : Precision.ESTIMATED));
    }
  }

  /** Local evidence alignment, not a global shift. Ambiguous words are deliberately left alone. */
  RebuildSource align(RebuildSource reference) { return align(reference,null); }

  RebuildSource align(RebuildSource reference,java.util.function.Consumer<String> report) {
    RebuildSource direct=alignNativeOnly(reference,report);
    if(direct!=this)return direct;
    return direct.alignPartial(reference,report);
  }

  private RebuildSource alignNativeOnly(RebuildSource reference,java.util.function.Consumer<String> report) {
    if(reference==null){alignmentReport(report,"reason=missing_reference;adopted_segments=0");return this;}
    Map<String,Integer> left=ngrams(words),right=ngrams(reference.words);
    Map<Integer,Integer> matches=new TreeMap<>();Set<Integer> anchors=new HashSet<>();int last=-1;
    for(int i=0;i+2<words.size();i++) {
      String key=gram(words,i);Integer a=left.get(key),j=right.get(key);
      if(a==null || a!=i || j==null || j<0 || j<=last)continue;
      boolean valid=true;
      for(int n=0;n<3;n++)if(Math.abs(words.get(i+n).start-reference.words.get(j+n).start)>10000)valid=false;
      if(valid){for(int n=0;n<3;n++)matches.put(i+n,j+n);anchors.add(i);last=j+2;i+=2;}
    }
    if(matches.size()<6){alignmentReport(report,"reason=insufficient_unique_anchors;matched_words="+matches.size()+";adopted_segments=0");return this;}
    List<Word> proposed=new ArrayList<>(words);int adopted=0,skipped=0,aligned=0;StringBuilder evidence=new StringBuilder();
    List<Integer> eligible=new ArrayList<>();
    for(Map.Entry<Integer,Integer> e:matches.entrySet()) {
      Word a=words.get(e.getKey()),b=reference.words.get(e.getValue());
      if(a.precision==Precision.ESTIMATED && b.precision==Precision.NATIVE && b.start<b.end)eligible.add(e.getKey());
    }
    for(int at=0;at<eligible.size();) {
      int from=eligible.get(at),to=from,jFrom=matches.get(from);at++;
      while(at<eligible.size()) {
        int next=eligible.get(at);
        if(next!=to+1 || matches.get(next)!=matches.get(to)+1
            || RebuildPlanner.hardBreakBefore(this,next) || RebuildPlanner.hardBreakBefore(reference,matches.get(next)))break;
        to=next;at++;
      }
      boolean complete=false;
      for(int anchor:anchors)if(anchor>=from && anchor+2<=to){complete=true;break;}
      String reason=complete ? "" : "incomplete_native_anchor";
      if(reason.isEmpty()) {
        long prior=from==0 ? -1 : proposed.get(from-1).end;
        for(int i=from;i<=to;i++) {
          Word b=reference.words.get(matches.get(i));
          if(b.start<0 || b.start>=b.end || b.start<prior){reason="segment_time_or_boundary_conflict";break;}
          prior=b.end;
        }
        if(reason.isEmpty() && to+1<words.size() && prior>proposed.get(to+1).start)reason="segment_time_or_boundary_conflict";
      }
      if(reason.isEmpty()) {
        for(int cut=Math.max(1,from);cut<=Math.min(words.size()-1,to+1);cut++) {
          Word oldLeft=words.get(cut-1),oldRight=words.get(cut);
          Word newLeft=cut-1>=from && cut-1<=to ? reference.words.get(matches.get(cut-1)) : proposed.get(cut-1);
          Word newRight=cut>=from && cut<=to ? reference.words.get(matches.get(cut)) : proposed.get(cut);
          if(!oldRight.text.startsWith(">>") && (oldRight.start-oldLeft.end>=650)!=(newRight.start-newLeft.end>=650)) {
            reason="hard_source_gap_changed";break;
          }
        }
      }
      if(reason.isEmpty()) {
        for(int i=from;i<=to;i++){Word a=words.get(i),b=reference.words.get(matches.get(i));
          proposed.set(i,new Word(a.text,b.start,b.end,a.cue,Precision.ALIGNED));aligned++;}
        adopted++;reason="adopted";
      } else skipped++;
      if(adopted+skipped<=16){if(evidence.length()>0)evidence.append(',');evidence.append(from).append('-').append(to)
          .append('@').append(jFrom).append(':').append(reason);}
    }
    int hardBreakRestored=0;
    boolean changed=true;int guardPass=0;
    while(changed&&guardPass++<3){
      changed=false;
      for(int i=1;i<proposed.size();i++){
        boolean beforeGap=words.get(i).start-words.get(i-1).end>=650;
        boolean afterGap=proposed.get(i).start-proposed.get(i-1).end>=650;
        if(beforeGap!=afterGap){
          if(proposed.get(i)!=words.get(i)){proposed.set(i,words.get(i));changed=true;}
          if(proposed.get(i-1)!=words.get(i-1)){proposed.set(i-1,words.get(i-1));changed=true;}
          hardBreakRestored++;
        }
      }
    }
    int effective=0;for(int i=0;i<proposed.size();i++)if(proposed.get(i)!=words.get(i))effective++;
    alignmentReport(report,"matched_words="+matches.size()+";native_candidates="+eligible.size()
        +";adopted_segments="+adopted+";skipped_segments="+skipped+";aligned_words="+aligned
        +";hard_break_restored="+hardBreakRestored+";segments_bounded="+evidence+";segments_omitted="+Math.max(0,adopted+skipped-16));
    return effective==0 ? this : new RebuildSource(proposed,this.anchors,coarseCueReconstructed,coarseCueCount,formatEvidence);
  }

  /**
   * Consume segment/cue boundaries even when the reference has no word-level offsets.  This is a
   * local, bounded affine remap: source shape between two observed boundaries is preserved, native
   * words and hard gaps are immutable constraints, and a tail without a right boundary is never
   * extrapolated.
   */
  private RebuildSource alignPartial(RebuildSource reference,java.util.function.Consumer<String> report) {
    if(reference==null||reference.anchors.isEmpty())return this;
    Map<Integer,Integer> refToPrimary=uniqueWordMatches(this.words,reference.words);
    if(refToPrimary.size()<6){alignmentReport(report,"partial_reason=insufficient_unique_context;matched_words="+refToPrimary.size()+";anchors_adopted=0;actual_retimed=0");return this;}
    List<BoundaryPair> pairs=new ArrayList<>();int mapped=0;
    for(TimeAnchor anchor:reference.anchors){
      int primary=mapBoundary(anchor.boundary,refToPrimary,reference.words.size(),words.size());
      if(primary<0||primary>words.size())continue;
      if(anchor.kind==AnchorKind.CUE_END_BOUND&&anchor.boundary==0)continue;
      pairs.add(new BoundaryPair(primary,anchor.timeMs,anchor.kind));mapped++;
    }
    pairs.sort(Comparator.comparingInt(p->p.boundary));
    List<BoundaryPair> unique=new ArrayList<>();
    for(BoundaryPair pair:pairs){
      if(!unique.isEmpty()&&unique.get(unique.size()-1).boundary==pair.boundary){
        BoundaryPair prior=unique.get(unique.size()-1);
        if(anchorRank(pair.kind)>anchorRank(prior.kind))unique.set(unique.size()-1,pair);
      } else unique.add(pair);
    }
    if(unique.size()<2){alignmentReport(report,"partial_reason=unmapped_boundaries;matched_words="+refToPrimary.size()+";anchors_seen="+reference.anchors.size()+";anchors_mapped="+mapped+";anchors_adopted=0;actual_retimed=0");return this;}
    List<Word> proposed=new ArrayList<>(words);int adopted=0,retimed=0,skipped=0,adoptedAnchors=0;
    StringBuilder components=new StringBuilder();
    for(int n=0;n+1<unique.size();n++){
      BoundaryPair left=unique.get(n),right=unique.get(n+1);
      if(right.boundary<=left.boundary||right.time<=left.time)continue;
      if(right.boundary-left.boundary<1)continue;
      long oldLeft=boundaryTime(words,left.boundary),oldRight=boundaryTime(words,right.boundary);
      if(oldRight<=oldLeft)continue;
      String reason="";
      for(int i=left.boundary;i<right.boundary;i++){
        if(i>=words.size()){reason="boundary_out_of_range";break;}
        if(RebuildPlanner.hardBreakBefore(this,i)){reason="hard_source_gap";break;}
      }
      List<Word> candidate=new ArrayList<>(proposed);
      int local=0;
      if(reason.isEmpty())for(int i=left.boundary;i<right.boundary;i++){
        Word old=words.get(i);
        if(old.precision!=Precision.ESTIMATED)continue;
        long a=mapTime(old.start,oldLeft,oldRight,left.time,right.time);
        long b=mapTime(old.end,oldLeft,oldRight,left.time,right.time);
        if(b<=a){reason="non_monotone";break;}
        candidate.set(i,new Word(old.text,a,b,old.cue,Precision.ESTIMATED));local++;
      }
      if(reason.isEmpty()){
        if(left.boundary>0&&candidate.get(left.boundary-1).end>candidate.get(left.boundary).start)reason="left_constraint";
        if(reason.isEmpty()&&right.boundary<words.size()&&candidate.get(right.boundary-1).end>candidate.get(right.boundary).start)reason="right_constraint";
      }
      if(reason.isEmpty()&&local>0){
        for(int i=left.boundary;i<right.boundary;i++)if(candidate.get(i).precision==Precision.ESTIMATED){
          if(candidate.get(i).start!=words.get(i).start||candidate.get(i).end!=words.get(i).end)retimed++;
        }
        proposed=candidate;adopted++;adoptedAnchors+=2;
        if(components.length()>0)components.append(',');components.append(left.boundary).append('-').append(right.boundary).append("@")
            .append(left.time).append('-').append(right.time).append(":adopted");
      } else if(!reason.isEmpty()){
        skipped++;if(components.length()<900){if(components.length()>0)components.append(',');components.append(left.boundary).append('-').append(right.boundary).append(':').append(reason);}
      }
    }
    String detail="partial_matched_words="+refToPrimary.size()+";anchors_seen="+reference.anchors.size()
        +";anchors_mapped="+mapped+";anchors_adopted="+adoptedAnchors+";partial_components="+adopted
        +";partial_skipped="+skipped+";actual_retimed="+retimed+";partial_components_detail="+components;
    alignmentReport(report,detail);
    return retimed==0?this:new RebuildSource(proposed,this.anchors,coarseCueReconstructed,coarseCueCount,formatEvidence);
  }

  private static final class BoundaryPair {
    final int boundary;final long time;final AnchorKind kind;
    BoundaryPair(int b,long t,AnchorKind k){boundary=b;time=t;kind=k;}
  }
  private static int anchorRank(AnchorKind kind){return kind==AnchorKind.WORD_ONSET?4:kind==AnchorKind.SEGMENT_ONSET?3:kind==AnchorKind.CUE_ONSET?2:1;}
  private static int mapBoundary(int boundary,Map<Integer,Integer> matches,int refSize,int primarySize){
    if(boundary<=0)return 0;
    if(boundary>=refSize)return primarySize;
    Integer exact=matches.get(boundary);if(exact!=null)return exact;
    Integer prior=matches.get(boundary-1);return prior==null?-1:prior+1;
  }
  private static long boundaryTime(List<Word> values,int boundary){
    if(values.isEmpty())return 0;
    if(boundary<=0)return values.get(0).start;
    if(boundary>=values.size())return values.get(values.size()-1).end;
    return values.get(boundary).start;
  }
  private static long mapTime(long value,long oldA,long oldB,long newA,long newB){
    long numerator=(value-oldA)*(newB-newA);
    return newA+Math.round((double)numerator/(double)(oldB-oldA));
  }
  private static Map<Integer,Integer> uniqueWordMatches(List<Word> primary,List<Word> reference){
    Map<String,Integer> left=ngrams(primary),right=ngrams(reference);
    Map<Integer,Integer> out=new TreeMap<>();int last=-1;
    for(int i=0;i+2<primary.size();i++){
      String gram=gram(primary,i);Integer a=left.get(gram),j=right.get(gram);
      if(a==null||a!=i||j==null||j<0||j<=last)continue;
      for(int n=0;n<3;n++)out.put(j+n,i+n);last=j+2;i+=2;
    }return out;
  }
  String precisionEvidence() {
    int nativeWords=0,estimatedWords=0,alignedWords=0;
    for(Word word:words) switch(word.precision){case NATIVE:nativeWords++;break;case ALIGNED:alignedWords++;break;default:estimatedWords++;}
    return "native="+nativeWords+";estimated="+estimatedWords+";aligned="+alignedWords
        +";segment_anchors="+segmentAnchorCount()+";cue_anchors="+cueAnchorCount()
        +(formatEvidence.isEmpty()?"":";"+formatEvidence);
  }
  private static void alignmentReport(java.util.function.Consumer<String> report,String detail) {
    if(report!=null)report.accept(detail);
  }

  private static String gram(List<Word> w, int i) {
    return key(w.get(i).text) + "|" + key(w.get(i + 1).text) + "|" + key(w.get(i + 2).text);
  }

  private static Map<String, Integer> ngrams(List<Word> w) {
    Map<String, Integer> m = new HashMap<>();
    for (int i = 0; i + 2 < w.size(); i++) {
      String k = gram(w, i);
      m.put(k, m.containsKey(k) ? -1 : i);
    }
    return m;
  }
}
