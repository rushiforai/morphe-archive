"""Execute the car playback owner against real lifecycle and surface sequences."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/CarPlayback.java"

class WuplayCarPlaybackTests(unittest.TestCase):
    def test_surface_replacement_stale_selection_and_close(self):
        self.assertTrue(SOURCE.is_file(), "Car playback owner is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            probe = root / "PlaybackProbe.java"
            probe.write_text(r'''import java.util.*;
import nl.johninnl.wuplaycar.CarPlayback;
public class PlaybackProbe {
 static class Engine implements CarPlayback.Engine<String> {
  String surface,url; int prepares,releases,bindings; long position=5000,duration=10000; boolean playing;
  public void surface(String value){surface=value;bindings++;}
  public void prepare(String value,Map<String,String> headers,long resume){url=value;position=resume;prepares++;playing=true;}
  public boolean playing(){return playing;} public void playing(boolean value){playing=value;}
  public long position(){return position;} public long duration(){return duration;}
  public void seek(long value){position=value;} public void release(){releases++;}
 }
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args){
  Engine e=new Engine();CarPlayback<String> owner=new CarPlayback<>(e);
  String first=new String("surface"),second=new String("surface");
  owner.bind(first);owner.bind(second);owner.unbind(first);
  check(e.surface==second,"late destruction detached replacement surface");
  owner.unbind(second);check(e.surface==null,"current surface not detached");
  long old=owner.beginSelection(),current=owner.beginSelection();
  check(!owner.select(old,"https://old.test/video",Collections.emptyMap(),0),"stale native result played");
  check(owner.select(current,"https://new.test/video",Collections.singletonMap("User-Agent","WuPlay"),2000),"latest result rejected");
  check(e.prepares==1&&e.url.equals("https://new.test/video")&&e.position==2000,"selection wrong");
  owner.toggle();check(!e.playing,"pause failed");owner.toggle();check(e.playing,"resume failed");
  owner.seekBy(-30000);check(e.position==0,"seek went negative");
  owner.seekBy(30000);check(e.position==10000,"seek exceeded duration");
  e.duration=-1;e.position=5000;owner.seekBy(20000);check(e.position==25000,"unknown duration clamped incorrectly");
  owner.close();owner.close();check(e.releases==1,"engine released more than once");
  int bindings=e.bindings;owner.bind(first);check(e.bindings==bindings,"closed owner rebound surface");
  check(!owner.select(current,"https://stale.test/video",Collections.emptyMap(),0),"closed owner accepted playback");
 }
}''')
            result = subprocess.run(["javac", "-d", str(root), str(SOURCE), str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result = subprocess.run(["java","-cp",str(root),"PlaybackProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarProfileTests(unittest.TestCase):
    def test_pin_unlock_is_bound_to_profile_key_and_session(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/ProfileAccess.java"
        self.assertTrue(source.is_file(), "Car PIN access gate is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "ProfileProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.ProfileAccess;
public class ProfileProbe {
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args){ProfileAccess gate=new ProfileAccess();
  check(!gate.allowed("one","key-a",true));check(gate.unlock("one","key-a"));check(gate.allowed("one","key-a",true));
  check(!gate.allowed("one","key-b",true));check(!gate.unlock("one","key-a"));
  check(gate.allowed("two","public",false));check(!gate.allowed("one","key-a",true));
  check(gate.unlock("one","key-a"));check(gate.allowed("one","key-a",false));check(!gate.allowed("one","key-a",true));
  check(gate.unlock("one","key-a"));gate.clear();check(!gate.allowed("one","key-a",true));
  check(!gate.allowed(null,null,false));check(!gate.unlock(null,null));
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"ProfileProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarMetadataTests(unittest.TestCase):
    def test_native_meta_response_preserves_episodes_and_description(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/NativeMetadata.java"
        self.assertTrue(source.is_file(), "Native MetaResponse adapter is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "MetadataProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.NativeMetadata;import java.util.*;
public class MetadataProbe {
 public static final class Meta { public Object videos;public String description; Meta(Object v,String d){videos=v;description=d;} }
 public static final class Response { public Meta meta;Response(Meta value){meta=value;} }
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args)throws Exception {
  Meta meta=new Meta(List.of("episode-1","episode-2"),"A series overview");
  NativeMetadata.Value value=NativeMetadata.decode(new Response(meta));
  check(value.meta==meta);check(value.videos.equals(List.of("episode-1","episode-2")));check(value.description.equals("A series overview"));
  check(NativeMetadata.decode(new Response(new Meta(null,null))).videos.isEmpty());
  try{NativeMetadata.decode(new Response(null));throw new AssertionError("null metadata accepted");}catch(IllegalStateException expected){}
  try{NativeMetadata.decode(new Response(new Meta("wrong schema","")));throw new AssertionError("non-list episodes accepted");}catch(IllegalStateException expected){}
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"MetadataProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarCatalogPagingTests(unittest.TestCase):
    def test_native_batch_cursor_is_not_the_car_page_offset(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/CatalogWindow.java"
        self.assertTrue(source.is_file(), "Native-batch car pagination is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "CatalogProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.CatalogWindow;import java.util.*;
public class CatalogProbe {
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args){List<Integer> items=new ArrayList<>();for(int i=0;i<70;i++)items.add(i);
  CatalogWindow<Integer> builtin=new CatalogWindow<>(items,-1);
  check(builtin.items().equals(items.subList(0,30)));check(builtin.remoteCursor()==-1);
  builtin=builtin.nextLocal();check(builtin.items().equals(items.subList(30,60)));check(builtin.remoteCursor()==-1);
  builtin=builtin.nextLocal();check(builtin.items().equals(items.subList(60,70)));check(builtin.nextLocal()==null&&builtin.remoteCursor()==-1);
  CatalogWindow<Integer> addon=new CatalogWindow<>(items.subList(0,50),64);
  check(addon.remoteCursor()==-1);addon=addon.nextLocal();check(addon.items().equals(items.subList(30,50)));check(addon.remoteCursor()==64);
  CatalogWindow<Integer> filtered=new CatalogWindow<>(Collections.emptyList(),100);check(filtered.items().isEmpty()&&filtered.remoteCursor()==100);
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"CatalogProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarNavigationTests(unittest.TestCase):
    def test_now_playing_stream_return_preserves_root_and_matches_title(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/NavigationStack.java"
        self.assertTrue(source.is_file(), "Safe stream return navigation is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "NavigationProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.NavigationStack;import java.util.*;
public class NavigationProbe {
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args){List<String> closed=new ArrayList<>();Deque<String> pages=new ArrayDeque<>(List.of("root","nowplaying","tracks"));
  check(!NavigationStack.rewind(pages,p->p.equals("streams-current"),closed::add));check(new ArrayList<>(pages).equals(List.of("root")));check(closed.equals(List.of("tracks","nowplaying")));
  pages=new ArrayDeque<>(List.of("root","streams-other","player","tracks"));check(!NavigationStack.rewind(pages,p->p.equals("streams-current"),p->{}));check(new ArrayList<>(pages).equals(List.of("root")));
  pages=new ArrayDeque<>(List.of("root","details","streams-current","player","tracks"));check(NavigationStack.rewind(pages,p->p.equals("streams-current"),p->{}));check(new ArrayList<>(pages).equals(List.of("root","details","streams-current")));
  Object root=new Object(),oldPage=new Object(),replacement=new Object();Deque<Object> live=new ArrayDeque<>(List.of(root,oldPage));
  check(NavigationStack.current(live,oldPage,false));live.removeLast();live.add(replacement);
  check(!NavigationStack.current(live,oldPage,false));check(!NavigationStack.current(live,replacement,true));
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"NavigationProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarViewportTests(unittest.TestCase):
    def test_caption_and_video_stay_above_host_navigation_bar(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/VideoViewport.java"
        self.assertTrue(source.is_file(), "Host-visible video viewport is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "ViewportProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.VideoViewport;import java.util.*;
public class ViewportProbe {
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args){
  VideoViewport v=VideoViewport.fit(800,480,0,0,800,424,16f/9f);
  check(Arrays.equals(new int[]{v.left,v.top,v.width,v.height},new int[]{23,0,754,424}));
  VideoViewport rightPanel=VideoViewport.fit(800,480,0,0,520,424,16f/9f);
  check(Arrays.equals(new int[]{rightPanel.left,rightPanel.top,rightPanel.width,rightPanel.height},new int[]{23,0,754,424}));
  VideoViewport leftPanel=VideoViewport.fit(800,480,280,0,800,424,16f/9f);
  check(Arrays.equals(new int[]{leftPanel.left,leftPanel.top,leftPanel.width,leftPanel.height},new int[]{23,0,754,424}));
  check(v.captionBottomMargin==91);check(480-v.captionBottomMargin<424);
  v=VideoViewport.fit(800,480,100,20,700,420,1f);check(v.left==200&&v.top==20&&v.width==400&&v.height==400);
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"ViewportProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)


class WuplayCarHostTests(unittest.TestCase):
    def test_gearslip_package_names_accept_resigned_hosts_and_reject_other_packages(self):
        source=ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/HostPackages.java"
        self.assertTrue(source.is_file(), "Package-based Gearslip host policy is missing")
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);probe=root / "HostProbe.java"
            probe.write_text(r'''import nl.johninnl.wuplaycar.HostPackages;
public class HostProbe {
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[] args){
  check(HostPackages.allowed(new String[]{"app.seb3thehacker.gearslip"}));
  check(HostPackages.allowed(new String[]{"app.seb3thehacker.gearslip.dev"}));
  check(HostPackages.allowed(new String[]{"app.johninnl.drivedeck"}));
  check(HostPackages.allowed(new String[]{"app.johninnl.drivedeck.dev"}));
  check(!HostPackages.allowed(new String[]{"app.johninnl.drivedeck.fake"}));
  check(HostPackages.allowed(new String[]{"another.package","app.seb3thehacker.gearslip"}));
  check(!HostPackages.allowed(null));check(!HostPackages.allowed(new String[]{}));
  check(!HostPackages.allowed(new String[]{null,"another.package"}));
  check(!HostPackages.allowed(new String[]{"app.seb3thehacker.gearslip.evil"}));
  check(!HostPackages.allowed(new String[]{"app.seb3thehacker.gearslip.dev.evil"}));
 }
}''')
            result=subprocess.run(["javac","-d",str(root),str(source),str(probe)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            result=subprocess.run(["java","-cp",str(root),"HostProbe"],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
