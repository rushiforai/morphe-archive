package dev.jason.gboardpatches.extension.sharedmodel;
import java.util.*;
import java.util.regex.*;
/** Derive UTF-16 ranges from literal corrected text; the model never has to count offsets. */
public final class GrammarEdits {
 public static final class Edit { public final int start,end;public final String replacement;Edit(int s,int e,String r){start=s;end=e;replacement=r;} }
 private static final Pattern TOKENS=Pattern.compile("[\\p{L}\\p{M}\\p{N}'’]+|\\s+|.",Pattern.DOTALL);
 private static final class Token {final String text;final int start,end;Token(String t,int s,int e){text=t;start=s;end=e;}}
 private GrammarEdits(){}
 private static List<Token> tokens(String text){List<Token> out=new ArrayList<>();Matcher m=TOKENS.matcher(text);while(m.find())out.add(new Token(m.group(),m.start(),m.end()));return out;}
 public static List<Edit> between(String original,String corrected){
  if(original==null || corrected==null || original.length()>1024 || corrected.length()>1536 || corrected.trim().isEmpty() || original.equals(corrected))return Collections.emptyList();
  List<Token> a=tokens(original),b=tokens(corrected);if(a.size()>256 || b.size()>256)return Collections.emptyList();
  int n=a.size(),m=b.size();int[][] common=new int[n+1][m+1];
  for(int i=n-1;i>=0;i--)for(int j=m-1;j>=0;j--)common[i][j]=a.get(i).text.equals(b.get(j).text)?1+common[i+1][j+1]:Math.max(common[i+1][j],common[i][j+1]);
  List<Edit> raw=new ArrayList<>();int i=0,j=0;
  while(i<n || j<m){
   if(i<n && j<m && a.get(i).text.equals(b.get(j).text)){i++;j++;continue;}
   int start=i<n?a.get(i).start:original.length();StringBuilder replacement=new StringBuilder();
   while(i<n || j<m){
    if(i<n && j<m && a.get(i).text.equals(b.get(j).text))break;
    if(j<m && (i==n || common[i][j+1]>=common[i+1][j]))replacement.append(b.get(j++).text);else i++;
   }
   int end=i<n?a.get(i).start:original.length();raw.add(new Edit(start,end,replacement.toString()));
  }
  if(raw.size()>8)return Collections.emptyList();
  List<Edit> edits=new ArrayList<>();
  for(int first=0;first<raw.size();){
   int last=first;Edit one=raw.get(first);int start=one.start,end=one.end;
   if(start==end){
    Token adjacent=null;for(Token token:a){if(token.start==start){adjacent=token;break;}if(token.end==start)adjacent=token;}
    if(adjacent==null)return Collections.emptyList();start=Math.min(start,adjacent.start);end=Math.max(end,adjacent.end);
   }
   while(last+1<raw.size() && raw.get(last+1).start<end){last++;end=Math.max(end,raw.get(last).end);}
   StringBuilder block=new StringBuilder(original.substring(start,end));
   for(int k=last;k>=first;k--){Edit r=raw.get(k);block.replace(r.start-start,r.end-start,r.replacement);}
   if(end<=start || end-start>256)return Collections.emptyList();edits.add(new Edit(start,end,block.toString()));first=last+1;
  }
  StringBuilder reconstructed=new StringBuilder(original);for(int k=edits.size()-1;k>=0;k--){Edit e=edits.get(k);reconstructed.replace(e.start,e.end,e.replacement);}
  return reconstructed.toString().equals(corrected)?Collections.unmodifiableList(edits):Collections.emptyList();
 }
}
