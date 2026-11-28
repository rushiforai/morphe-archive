package com.waze.gw;

import java.util.*;
import java.nio.ByteBuffer;
import java.nio.charset.*;

/** Strict bounded JSON at the unsigned OTA trust boundary; no Android parser coercions. */
final class HudOtaJson {
 private final String text; private int pos;
 private HudOtaJson(String text) { this.text=text; }
 static Map<String,Object> parse(String text) {
  if(text==null || text.length()>1048576) throw bad();
  HudOtaJson p=new HudOtaJson(text); Object v=p.value(0); p.ws();
  if(p.pos!=text.length() || !(v instanceof Map)) throw bad();
  return object(v);
 }
 static Map<String,Object> bytes(byte[] bytes) {
  try { return parse(StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
   .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString()); }
  catch(CharacterCodingException e) { throw bad(); }
 }
 @SuppressWarnings("unchecked") static Map<String,Object> object(Object v) { if(!(v instanceof Map)) throw bad(); return (Map<String,Object>)v; }
 static void keys(Map<String,Object> o, String required, String optional) {
  Set<String> allowed=new HashSet<>(Arrays.asList((required+","+optional).split(",")));
  for(String k:required.split(",")) if(!k.isEmpty()&&!o.containsKey(k)) throw bad();
  if(!allowed.containsAll(o.keySet())) throw bad();
 }
 static String string(Map<String,Object> o,String key,int min,int max) {
  Object v=o.get(key); if(!(v instanceof String)) throw bad(); String s=(String)v;
  if(s.length()<min||s.length()>max) throw bad(); return s;
 }
 static long number(Map<String,Object> o,String key,long min,long max) {
  Object v=o.get(key); if(!(v instanceof Long)) throw bad(); long n=(Long)v;
  if(n<min||n>max) throw bad(); return n;
 }
 static IllegalArgumentException bad() { return new IllegalArgumentException("Invalid OTA JSON/schema"); }
 private void ws() { while(pos<text.length()&&" \t\r\n".indexOf(text.charAt(pos))>=0) pos++; }
 private boolean take(char c) { ws(); if(pos<text.length()&&text.charAt(pos)==c){pos++;return true;} return false; }
 private Object value(int depth) {
  if(depth>24) throw bad(); ws(); if(pos>=text.length()) throw bad(); char c=text.charAt(pos);
  if(c=='"') return str();
  if(c=='{') { pos++; Map<String,Object> m=new LinkedHashMap<>(); if(take('}')) return m;
   do { ws(); if(pos>=text.length()||text.charAt(pos)!='"') throw bad(); String k=str();
    if(m.containsKey(k)||!take(':')) throw bad(); m.put(k,value(depth+1));
   } while(take(',')); if(!take('}')) throw bad(); return m; }
  if(c=='[') {pos++; List<Object> a=new ArrayList<>(); if(take(']')) return a;
   do {a.add(value(depth+1));} while(take(',')); if(!take(']')) throw bad(); return a;}
  for(String literal:new String[]{"true","false","null"}) if(text.startsWith(literal,pos)) {
   pos+=literal.length(); return literal.equals("null")?null:Boolean.valueOf(literal); }
  int start=pos; if(c=='-') pos++; if(pos>=text.length()) throw bad();
  if(text.charAt(pos)=='0') pos++; else { if(text.charAt(pos)<'1'||text.charAt(pos)>'9') throw bad(); while(pos<text.length()&&digit(text.charAt(pos))) pos++; }
  boolean integer=true;
  if(pos<text.length()&&text.charAt(pos)=='.') {integer=false;pos++;int a=pos;while(pos<text.length()&&digit(text.charAt(pos)))pos++;if(a==pos)throw bad();}
  if(pos<text.length()&&"eE".indexOf(text.charAt(pos))>=0) {integer=false;pos++;if(pos<text.length()&&"+-".indexOf(text.charAt(pos))>=0)pos++;int a=pos;while(pos<text.length()&&digit(text.charAt(pos)))pos++;if(a==pos)throw bad();}
  try {String n=text.substring(start,pos); if(integer) return Long.valueOf(n); double d=Double.parseDouble(n);if(!Double.isFinite(d))throw bad();return Double.valueOf(d);}catch(NumberFormatException e){throw bad();}
 }
 private static boolean digit(char c){return c>='0'&&c<='9';}
 private String str() {
  pos++;StringBuilder b=new StringBuilder();boolean done=false;
  while(pos<text.length()) {char c=text.charAt(pos++);if(c=='"'){done=true;break;}if(c<32)throw bad();
   if(c=='\\'){if(pos>=text.length())throw bad();c=text.charAt(pos++);switch(c){
    case '"': case '\\': case '/':break;case 'b':c='\b';break;case 'f':c='\f';break;case 'n':c='\n';break;case 'r':c='\r';break;case 't':c='\t';break;
    case 'u':if(pos+4>text.length()||!text.substring(pos,pos+4).matches("[0-9a-fA-F]{4}"))throw bad();try{c=(char)Integer.parseInt(text.substring(pos,pos+4),16);}catch(NumberFormatException e){throw bad();}pos+=4;break;default:throw bad();}}
   b.append(c);
  }
  if(!done)throw bad();String s=b.toString();for(int i=0;i<s.length();i++){char c=s.charAt(i);if(Character.isHighSurrogate(c)){if(++i>=s.length()||!Character.isLowSurrogate(s.charAt(i)))throw bad();}else if(Character.isLowSurrogate(c))throw bad();}return s;
 }
}
