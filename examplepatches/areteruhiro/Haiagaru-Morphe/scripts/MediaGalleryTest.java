package app.morphe.extension.chmate;
import java.util.*;
public final class MediaGalleryTest {
    static int checks;
    static void eq(Object value,Object expected){if(!Objects.equals(value,expected))throw new AssertionError(value+" != "+expected);checks++;}
    public static void main(String[] args){
        String image="https://example.org/a.jpg",gif="https://example.org/b.gif",video="https://example.org/c.mp4";
        eq(MediaGallery.links(Arrays.asList(image,gif,video,gif,"https://example.org/page"),gif),new ArrayList<>(Arrays.asList(image,gif,video)));
        eq(MediaGallery.links(Arrays.asList(image,gif),video),new ArrayList<>(Arrays.asList(video)));
        eq(MediaGallery.links(null,gif),new ArrayList<>(Arrays.asList(gif)));
        eq(MediaGallery.links(Arrays.asList(image,gif),"file:///bad.gif"),new ArrayList<String>());
        eq(MediaGallery.links(Arrays.asList("ttps://example.org/b.gif",gif),gif).size(),1);
        for(String url:Arrays.asList(image,gif,video,"https://example.org/a.webp?x=1","https://example.org/a.webm"))eq(MediaGallery.supported(url),true);
        for(String url:Arrays.asList("javascript:evil.gif","https://user:secret@example.org/a.gif","https://example.org/page",null))eq(MediaGallery.supported(url),false);
        eq(MediaGallery.step(-100,5,48),1);eq(MediaGallery.step(100,5,48),-1);
        eq(MediaGallery.step(-20,5,48),0);eq(MediaGallery.step(100,100,48),0);eq(MediaGallery.step(0,100,48),0);
        eq(MediaGallery.threadStep(0,-100,48),1);eq(MediaGallery.threadStep(0,100,48),-1);
        eq(MediaGallery.threadStep(-100,5,48),1);eq(MediaGallery.threadStep(100,5,48),-1);
        eq(MediaGallery.threadStep(10,20,48),0);eq(MediaGallery.threadStep(100,100,48),0);
        // Every native version uses four directions only for whole-thread paging.
        for(boolean whole:new boolean[]{false,true}) {
            eq(MediaGallery.gestureStep(0,-200,48,whole),whole?1:0);
            eq(MediaGallery.gestureStep(0,200,48,whole),whole?-1:0);
            eq(MediaGallery.gestureStep(-200,0,48,whole),1);
            eq(MediaGallery.gestureStep(200,0,48,whole),-1);
        }
        eq(MediaGallery.gestureStep(10,20,48,true),0);
        eq(MediaGallery.gestureStep(200,200,48,true),0);
        eq(MediaGallery.gestureStep(0,-200,48,false),0);
        List<String> thread=new ArrayList<>();for(int i=0;i<500;i++)thread.add("https://example.org/"+i+".jpg");
        eq(MediaGallery.links(thread,thread.get(350),4096).size(),500);
        eq(MediaGallery.links(thread,thread.get(350)).size(),1);
        eq(MediaGallery.links(thread,thread.get(0)).size(),128);
        eq(MediaGallery.links(thread,thread.get(350),4096).indexOf(thread.get(350)),350);
        thread.add(thread.get(0));eq(MediaGallery.links(thread,thread.get(0),4096).size(),500);
        System.out.println("PASS MediaGallery "+checks+" checks");
    }
}
