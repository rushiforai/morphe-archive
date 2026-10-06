package app.yydarlinker.deepseekcaptions;

import java.util.*;
import java.util.regex.*;

/** Pure WebVTT input grammar. Display carry requires timing, continuity and exact line evidence. */
final class WebVttSourceReader {
  private static final String TIME="(?:[0-9]{2,}:)?[0-9]{2}:[0-9]{2}\\.[0-9]{3}";
  private static final Pattern HEADER=Pattern.compile("^("+TIME+")[ \\t]+-->[ \\t]+("+TIME+")(?:[ \\t]+(.*))?$");
  private static final Pattern STAMP=Pattern.compile(TIME);
  static final class Range {
    final String text;final long start,end;final int cue;final boolean nativeStart,speakerBreak;final List<Integer> speakerOffsets;
    Range(String t,long a,long z,int c,boolean n,boolean s,List<Integer> offsets){text=t;start=a;end=z;cue=c;nativeStart=n;speakerBreak=s;speakerOffsets=Collections.unmodifiableList(new ArrayList<>(offsets));}
  }
  static final class Result {
    final List<Range> ranges;final int carryLines,snapshots,unproven;
    Result(List<Range> r,int c,int s,int u){ranges=Collections.unmodifiableList(r);carryLines=c;snapshots=s;unproven=u;}
    String evidence(){return "vtt_carry_lines="+carryLines+";vtt_display_snapshots="+snapshots+";carry_unproven="+unproven;}
  }
  private static final class Cue {
    final long start,end;final int id;final String settings,payload,voice;
    final List<String> rawLines,lines;final boolean stamps,multiVoice;final String lastVoice;
    Cue(long a,long z,int c,String settings,String payload) {
      start=a;end=z;id=c;this.settings=settings;this.payload=payload;
      rawLines=new ArrayList<>();lines=new ArrayList<>();boolean timing=false;String speaker="",lastSpeaker="";boolean multiple=false;
      for(String line:payload.split("\n",-1)) {
        String value=decode(line).trim();
        if(!value.isEmpty()){rawLines.add(line);lines.add(value);}
        timing|=hasTimestamp(line);
        Matcher v=Pattern.compile("<v[ \\t]+([^>]+)>").matcher(line);while(v.find()){String voice=v.group(1).trim();if(speaker.isEmpty())speaker=voice;else if(!speaker.equals(voice))multiple=true;lastSpeaker=voice;}
      }
      stamps=timing;voice=speaker;multiVoice=multiple;lastVoice=lastSpeaker;
    }
    String lastLine(){return lines.isEmpty()?"":lines.get(lines.size()-1);}
    String text(){return String.join("\n",lines);}
  }
  static boolean metadata(String block) {
    String first=block.trim().split("\n",2)[0];
    return first.matches("WEBVTT(?:[ \\t].*)?") || first.matches("NOTE(?:[ \\t].*)?")
        || first.equals("STYLE") || first.equals("REGION");
  }
  static Result read(String body) {
    List<Cue> cues=new ArrayList<>();String normal=body.replace("\r\n","\n").replace('\r','\n');
    int id=0;
    for(String block:normal.split("\n[ \\t]*\n")) {
      String trimmed=block.trim();
      if(metadata(trimmed))continue;
      String[] lines=block.split("\n",-1);int at=-1;Matcher header=null;
      for(int i=0;i<Math.min(2,lines.length);i++) {Matcher m=HEADER.matcher(lines[i].trim());if(m.matches()){at=i;header=m;break;}}
      if(at<0){if(block.contains("-->"))throw new IllegalArgumentException("vtt_cue_header_invalid");continue;}
      long start=time(header.group(1)),end=time(header.group(2));if(start<0 || end<=start)throw new IllegalArgumentException("vtt_cue_window_invalid");
      String payload=String.join("\n",Arrays.copyOfRange(lines,at+1,lines.length));
      Cue cue=new Cue(start,end,id++,header.group(3)==null?"":header.group(3),payload);
      if(!cue.lines.isEmpty())cues.add(cue);
    }
    List<Range> ranges=new ArrayList<>();Cue previous=null;long displayEnd=-1;int carry=0,snapshots=0,unproven=0;
    String lastVoice="";
    for(int index=0;index<cues.size();index++) {
      Cue cue=cues.get(index),next=index+1<cues.size()?cues.get(index+1):null;
      boolean continuous=previous!=null && cue.start<=displayEnd && cue.start>=previous.start
          && !cue.multiVoice && !previous.multiVoice
          && cue.settings.equals(previous.settings) && cue.voice.equals(previous.lastVoice);
      boolean snapshot=continuous && previous.stamps && !cue.stamps && cue.lines.size()==1
          && cue.text().equals(previous.lastLine()) && next!=null && next.start==cue.end
          && next.stamps && next.lines.size()>1 && next.lines.get(0).equals(cue.text())
          && !hasTimestamp(next.rawLines.get(0)) && next.settings.equals(cue.settings) && next.voice.equals(cue.voice);
      if(snapshot){snapshots++;displayEnd=cue.end;continue;}
      List<String> active=new ArrayList<>(cue.rawLines);
      if(continuous && previous.stamps && cue.stamps && active.size()>1
          && !hasTimestamp(active.get(0)) && cue.lines.get(0).equals(previous.lastLine())) {
        active.remove(0);carry++;
      } else if(continuous && previous.stamps && !cue.stamps && cue.text().equals(previous.lastLine()))unproven++;
      String payload=String.join("\n",active);
      boolean speaker=!cue.voice.isEmpty() && !lastVoice.isEmpty() && !cue.voice.equals(lastVoice);
      if(!cue.lastVoice.isEmpty())lastVoice=cue.lastVoice;
      ranges.addAll(payload(payload,cue.start,cue.end,cue.id,speaker));
      previous=cue;displayEnd=cue.end;
    }
    return new Result(ranges,carry,snapshots,unproven);
  }
  private static boolean hasTimestamp(String value) {
    Matcher m=Pattern.compile("<([^>]+)>").matcher(value);
    while(m.find())if(STAMP.matcher(m.group(1)).matches())return true;
    return false;
  }
  private static List<Range> payload(String value,long start,long end,int cue,boolean speaker) {
    List<Range> out=new ArrayList<>();StringBuilder text=new StringBuilder();long at=start,last=start;
    boolean nativeStart=false;int rt=0;String voice="";List<Integer> speakerOffsets=new ArrayList<>();
    for(int i=0;i<value.length();) {
      char ch=value.charAt(i);
      if(ch=='<') {
        int close=value.indexOf('>',i+1);
        if(close>=0) {
          String tag=value.substring(i+1,close);
          if(STAMP.matcher(tag).matches()) {
            long stamp=time(tag);
            if(stamp<=last || stamp<=start || stamp>=end)throw new IllegalArgumentException("vtt_timestamp_order_or_window");
            if(text.length()>0)out.add(new Range(text.toString(),at,stamp,cue,nativeStart,speaker,speakerOffsets));
            boolean nextSpeaker=speakerOffsets.contains(text.length());
            if(text.length()>0)speaker=nextSpeaker;
            speakerOffsets.clear();text.setLength(0);at=stamp;last=stamp;nativeStart=true;i=close+1;continue;
          }
          if(tag.matches("[0-9].*:.*"))throw new IllegalArgumentException("vtt_timestamp_invalid");
          if(known(tag)) {
            if(tag.startsWith("v ") || tag.startsWith("v\t")){String nextVoice=tag.substring(1).trim();
              if(!voice.isEmpty() && !voice.equals(nextVoice))speakerOffsets.add(text.length());voice=nextVoice;}
            if(tag.equals("rt"))rt++;if(tag.equals("/rt")){if(rt==0)throw new IllegalArgumentException("vtt_ruby_order");rt--;}
            i=close+1;continue;
          }
          if(tag.matches("/?[A-Za-z].*"))throw new IllegalArgumentException("vtt_tag_unsupported");
        }
      }
      if(ch=='&') {
        int semi=value.indexOf(';',i+1);
        if(semi>i && semi-i<=16) {
          String decoded=entity(value.substring(i+1,semi));
          if(decoded!=null){if(rt==0)text.append(decoded);i=semi+1;continue;}
        }
      }
      if(rt==0)text.append(ch);i++;
    }
    if(rt!=0)throw new IllegalArgumentException("vtt_ruby_unclosed");
    if(text.length()>0)out.add(new Range(text.toString(),at,end,cue,nativeStart,speaker,speakerOffsets));
    return out;
  }
  static String decode(String value) {
    StringBuilder out=new StringBuilder();for(Range r:payload(value,0,Long.MAX_VALUE,0,false))out.append(r.text);
    return out.toString();
  }
  private static boolean known(String tag) {
    return tag.matches("/?(?:b|i|u|ruby|rt|c|v|lang)")
        || tag.matches("c(?:\\.[^ \\t<>.]+)+") || tag.matches("(?:v|lang)[ \\t]+[^<>]+");
  }
  private static String entity(String value) {
    switch(value){case "amp":return "&";case "lt":return "<";case "gt":return ">";case "nbsp":return "\u00a0";
      case "lrm":return "\u200e";case "rlm":return "\u200f";default:}
    if(value.startsWith("#"))try {
      int cp=value.startsWith("#x") || value.startsWith("#X") ? Integer.parseInt(value.substring(2),16) : Integer.parseInt(value.substring(1));
      if(Character.isValidCodePoint(cp) && (cp<0xd800 || cp>0xdfff) && cp!=0)return new String(Character.toChars(cp));
    } catch(NumberFormatException ignored){}
    return null;
  }
  private static long time(String value) {
    if(!STAMP.matcher(value).matches())return -1;
    String[] bits=value.split(":");try {
      long hour=bits.length==3?Long.parseLong(bits[0]):0;
      int minute=Integer.parseInt(bits[bits.length-2]);double second=Double.parseDouble(bits[bits.length-1]);
      if(minute>=60 || second>=60 || hour>Long.MAX_VALUE/3600000)return -1;
      return hour*3600000+minute*60000+Math.round(second*1000);
    } catch(NumberFormatException invalid){return -1;}
  }
}
