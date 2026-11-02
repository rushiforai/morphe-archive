package e.e.a;
public final class SearchBounds110 {
 public static long parse(String s){s=s.trim();if(s.isEmpty())return -1;if(!s.matches("[0-9]+"))throw new IllegalArgumentException();try{return Long.parseLong(s);}catch(NumberFormatException e){throw new IllegalArgumentException();}}
 public static boolean valid(long low,long high){return low>=-1&&high>=-1&&(low<0||high<0||low<=high);}
 public static String sort(String key){if("hotMylist".equals(key))throw new IllegalArgumentException("Trending sort is unavailable");return "registeredAt".equals(key)?"startTime":"duration".equals(key)?"lengthSeconds":"viewCount".equals(key)?"viewCounter":"commentCount".equals(key)?"commentCounter":"mylistCount".equals(key)?"mylistCounter":"lastCommentTime";}
}
