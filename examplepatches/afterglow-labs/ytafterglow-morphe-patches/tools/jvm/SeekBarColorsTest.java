import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.theme.SeekBarColorPolicy;
import java.util.EnumMap;
import java.util.Map;
import static app.afterglow.extension.settings.ThemeRole.*;

public final class SeekBarColorsTest {
    private static int checks;
    private static void equal(int actual,int expected,String message){checks++;if(actual!=expected)throw new AssertionError(message+": "+Integer.toHexString(actual)+" != "+Integer.toHexString(expected));}
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static ThemePalette palette(Object... values){Map<ThemeRole,Integer> colors=new EnumMap<>(ThemeRole.class);for(int i=0;i<values.length;i+=2)colors.put((ThemeRole)values[i],(Integer)values[i+1]);return ThemePalette.fromColors(colors);}
    private static int color(int original,ThemePalette p,ThemeRole role,boolean owner,boolean red){return SeekBarColorPolicy.resolve(original,p,role,owner,red);}
    public static void main(String[] args) {
        ThemePalette system=ThemePalette.system();
        for(int original:new int[]{0,0x00334455,0x33FFFFFF,0x99FFFFFF,0xCCFFFFFF,0xFFFFFFFF,0xFFFF0033}) {
            for(ThemeRole role:new ThemeRole[]{SEEK_PLAYED,SEEK_BUFFERED,SEEK_LIVE,SEEK_SCRUBBER,SEEK_SCRUBBER_LIVE})
                equal(color(original,system,role,true,false),original,"unconfigured native color/alpha preserved for "+role);
            equal(color(original,system,SEEK_BUFFERED,true,true),original,"red progress cannot recolor native buffer");
            equal(color(original,palette(BACKGROUND,0xFF001122),SEEK_BUFFERED,true,false),original,"unrelated theme role does not invent buffering");
            equal(color(original,palette(SEEK_BUFFERED,0x00445566),SEEK_BUFFERED,false,true),original,"unselected seek owner does not color buffer");
        }
        equal(color(0x99FFFFFF,palette(SEEK_BUFFERED,0x80112233),SEEK_BUFFERED,true,false),0x80112233,"explicit buffer alpha retained");
        equal(color(0x99FFFFFF,palette(SEEK_BUFFERED,0),SEEK_BUFFERED,true,true),0,"transparent buffer is configured, not unset");
        equal(color(0xCCFFFFFF,palette(SEEK_PLAYED,0xFF2358FF),SEEK_BUFFERED,true,false),0x99A6A6A6,"existing iOS buffered derivation reaches native renderer");
        equal(color(0xCCFFFFFF,palette(SEEK_LIVE,0xFFFF0088),SEEK_BUFFERED,true,false),0xCCFFFFFF,"live track alone leaves native buffering");
        equal(color(0xFFEA0033,system,SEEK_PLAYED,true,true),0xFFFF0000,"legacy red played behavior retained");
        equal(color(0xFFEA0033,palette(SEEK_PLAYED,0xFF00CCDD),SEEK_PLAYED,true,true),0xFF00CCDD,"explicit played role keeps precedence over red option");
        ThemePalette liveOnly=palette(SEEK_SCRUBBER_LIVE,0xFFAA00DD);
        equal(color(0xFFFF0033,liveOnly,SeekBarColorPolicy.scrubberRole(false),true,false),0xFFFF0033,"live-only role does not recolor VOD thumb");
        equal(color(0xFFFF0033,liveOnly,SeekBarColorPolicy.scrubberRole(true),true,false),0xFFAA00DD,"confirmed current live thumb uses live role");
        ThemePalette distinct=palette(SEEK_SCRUBBER,0xFF33CC66,SEEK_SCRUBBER_LIVE,0xFFAA00DD);
        for(String[] ids:new String[][]{{"",""},{null,"live-a"},{"live-a",null},{"live-a","vod-b"},{"vod-b","live-a"},{"live-a","LIVE-A"}})
            check(!SeekBarColorPolicy.liveForVideo(ids[0],ids[1],true),"unknown/stale/prefetched response cannot claim current live thumb");
        check(!SeekBarColorPolicy.liveForVideo("archived-live","archived-live",false),"recorded live video is a VOD");
        check(SeekBarColorPolicy.liveForVideo("live-a","live-a",true),"native ongoing-live response matches current player");
        String[] current={"","live-a","live-a","vod-b","vod-b","live-c"};
        String[] response={"live-a","live-a","prefetched-b","live-a","vod-b","live-c"};
        boolean[] live={true,true,true,true,false,true};
        int[] expected={0xFF33CC66,0xFFAA00DD,0xFF33CC66,0xFF33CC66,0xFF33CC66,0xFFAA00DD};
        for(int i=0;i<current.length;i++)equal(color(0xFFFF0033,distinct,
                SeekBarColorPolicy.scrubberRole(SeekBarColorPolicy.liveForVideo(current[i],response[i],live[i])),true,false),expected[i],"player/response transition "+i);
        equal(color(0xFFFF0033,palette(SEEK_LIVE,0xFF4455FF),SEEK_SCRUBBER_LIVE,true,false),0xFF4455FF,"live thumb uses existing live-track fallback");
        equal(color(0xFFFF0033,palette(SEEK_LIVE,0xFF4455FF,SEEK_SCRUBBER,0xFF00BB77),SEEK_SCRUBBER_LIVE,true,false),0xFF00BB77,"explicit normal thumb keeps iOS fallback precedence");
        equal(color(0xFFFF0033,distinct,SEEK_SCRUBBER_LIVE,false,false),0xFFFF0033,"unselected seek owner does not color live thumb");
        System.out.println("SeekBarColorsTest: "+checks+" checks passed");
    }
}
