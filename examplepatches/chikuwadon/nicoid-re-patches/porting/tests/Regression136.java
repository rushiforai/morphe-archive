package e.e.a;
import java.io.File;
import java.util.concurrent.atomic.AtomicReference;
public final class Regression136 {
    static int checks;
    static int fileReads;
    static File file(String name,long bytes) {
        return new File(name) {
            public boolean isFile(){return true;}
            public long length(){fileReads++;return bytes;}
        };
    }
    static void check(boolean value,String label) {
        if(!value)throw new AssertionError(label);
        checks++;
    }
    static void expect(long actual,long wanted,String label) { check(actual==wanted,label+": "+actual); }
    public static void main(String[] args)throws Exception {
        expect(Dev117.completedBytes("/cache","sm1"),-2,"outside listing falls back");
        Dev117.start("/cache/",new File[]{file("sm1.ncache",4096)});
        expect(Dev117.completedBytes("/cache","sm1"),-2,"packed without marker must be validated");
        Dev117.start("/cache",new File[]{file("sm1.ncache",4096),file("sm1.mp4",1),file("sm1.m3u8",40)});
        expect(Dev117.completedBytes("/cache","sm1"),-2,"packed index retains precedence");
        Dev117.start("/cache",new File[]{file("sm1.mp4",0),file("sm1.m3u8",40),file("sm1_asset_1",500),file("sm1_asset_2",700)});
        expect(Dev117.completedBytes("/cache","sm1"),1200,"HLS asset total");
        expect(Dev117.completedBytes("/other","sm1"),-2,"different storage falls back");
        Dev117.start("/cache",new File[]{file("sm1.mp4",1023)});
        expect(Dev117.completedBytes("/cache","sm1"),-2,"small marker validation");
        Dev117.start("/cache",new File[]{file("sm1.mp4",1024)});
        expect(Dev117.completedBytes("/cache","sm1"),1024,"normal MP4");
        Dev117.start("/cache",new File[]{file("sm1.mp4",0)});
        expect(Dev117.completedBytes("/cache","sm1"),-1,"empty incomplete file");
        Dev117.start("/cache",new File[]{file("sm1.m3u8",30),file("sm1_asset_1",500)});
        expect(Dev117.completedBytes("/cache","sm1"),-1,"HLS without completion marker");
        Dev117.start("/cache",null);
        expect(Dev117.completedBytes("/cache","sm1"),-1,"no listed entry");
        Dev117.finish();
        expect(Dev117.completedBytes("/cache","sm1"),-2,"listing cleanup");
        File[] many=new File[3000];
        for(int i=0;i<many.length;i++)many[i]=file("sm"+i+".mp4",4096+i);
        fileReads=0;
        Dev117.start("/cache",many);
        int scanReads=fileReads;
        for(int i=0;i<many.length;i++)expect(Dev117.completedBytes("/cache","sm"+i),4096+i,"bulk MP4");
        check(fileReads==scanReads,"lookups do not re-read files");
        AtomicReference<Throwable> error=new AtomicReference<>();
        Thread thread=new Thread(()->{
            try {expect(Dev117.completedBytes("/cache","sm1"),-2,"worker isolation");}
            catch(Throwable e){error.set(e);}
        });
        thread.start();thread.join();
        if(error.get()!=null)throw new AssertionError(error.get());
        Dev117.finish();
        System.out.println("PASS cache regression "+checks+" checks; 3000 rows, "+scanReads+" file reads during indexing and 0 during lookups");
    }
}
