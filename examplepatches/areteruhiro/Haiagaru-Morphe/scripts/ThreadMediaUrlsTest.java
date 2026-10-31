package app.morphe.extension.chmate;
import java.util.*;
public class ThreadMediaUrlsTest{static int checks;static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
public static void main(String[] args){String[] reported={"https://i.imgur.com/FPbIGqD.png","https://i.imgur.com/7dWXW8q.png","https://i.imgur.com/plIzBCz.png","https://i.imgur.com/RtFIpTS.jpeg"};
for(String url:reported){check(ThreadMediaUrls.collect(url,new String[0]).equals(List.of(url)));check(MediaGallery.links(Arrays.asList(reported),url,4096).size()==4);}
check(ThreadMediaUrls.collect("ttps://i.imgur.com/a.png",null).equals(List.of("https://i.imgur.com/a.png")));
check(ThreadMediaUrls.collect("https://e.org/a.png https://e.org/b.gif https://e.org/c.mp4",new String[]{"https://e.org/a.png"}).size()==3);
check(ThreadMediaUrls.collect("https://e.org/page https://img.5ch.net/ico/a.gif",null).isEmpty());
check(ThreadMediaUrls.collect("https://pbs.twimg.com/media/abc?format=jpg&name=orig",null).equals(List.of("https://pbs.twimg.com/media/abc.jpg?format=jpg&name=orig")));
check(ThreadMediaUrls.collect("",new String[]{"https://i.imgur.com/resolved.jpg"}).size()==1);
check(ThreadMediaUrls.collect("\u0003https://e.org/a.jpg\u0003",null).equals(List.of("https://e.org/a.jpg")));
System.out.println("PASS "+checks+" thread-media body/native collection checks");}}
