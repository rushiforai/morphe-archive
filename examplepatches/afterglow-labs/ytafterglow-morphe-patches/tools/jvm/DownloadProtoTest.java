package app.afterglow.extension.downloads;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;

public final class DownloadProtoTest {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static byte[] number(long n){ByteArrayOutputStream b=new ByteArrayOutputStream();do{int v=(int)(n&127);n>>>=7;b.write(v|(n!=0?128:0));}while(n!=0);return b.toByteArray();}
    private static byte[] concat(byte[]...arrays){ByteArrayOutputStream b=new ByteArrayOutputStream();for(byte[] a:arrays)b.write(a,0,a.length);return b.toByteArray();}
    private static byte[] field(int f,byte[] value){return concat(number(((long)f<<3)|2),number(value.length),value);}
    private static byte[] integer(int f,long value){return concat(number((long)f<<3),number(value));}
    private static byte[] text(String v){return v.getBytes(StandardCharsets.UTF_8);}
    private static void rejected(byte[] bytes){try{DownloadProto.parse(bytes);throw new AssertionError("Malformed data accepted");}catch(IOException expected){checks++;}}
    public static void main(String[] args)throws Exception{
        String id="jNQXAC9IVRw";byte[] nested=field(1,text(id));
        for(int f:new int[]{382320942,133724106})check(id.equals(DownloadProto.downloadCommandVideoId(field(f,nested))),"explicit download action");
        check(id.equals(DownloadProto.downloadCommandVideoId(field(73080600,concat(nested,integer(2,1))))),"offline add action");
        check(DownloadProto.downloadCommandVideoId(field(73080600,concat(nested,integer(2,2)))).isEmpty(),"remove action passes through");
        check(DownloadProto.downloadCommandVideoId(field(48687757,nested)).isEmpty(),"watch action passes through");
        check(DownloadProto.downloadCommandVideoId(field(382320942,field(1,text("../../private")))).isEmpty(),"invalid identifier rejected");
        check(DownloadProto.downloadCommandVideoId(field(382320942,field(2,text("PLplaylist")))).isEmpty(),"playlist is not a video");
        DownloadProto response=DownloadProto.parse(concat(field(4,field(3,concat(integer(1,137),field(5,text("video/mp4")),integer(7,1920),integer(8,1080),integer(12,4294967296L)))),field(11,concat(field(1,text(id)),field(15,text("A title with ü"))))));
        DownloadProto format=DownloadProto.parse(response.message(4).all(3).get(0).bytes);
        check(format.number(12)==4294967296L,"64-bit file length");
        check(format.number(8)==1080&&format.number(7)==1920,"video dimensions");
        check(response.message(11).text(15).equals("A title with ü"),"utf8 metadata");
        rejected(new byte[]{0});rejected(new byte[]{10,127});rejected(new byte[]{8,(byte)128});
        rejected(new byte[]{8,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,2});
        rejected(new byte[]{13,1,2});rejected(new byte[]{11});rejected(new byte[DownloadProto.LIMIT+1]);
        Random random=new Random(18);
        check(DownloadFormatPolicy.supported("video/mp4; codecs=\"avc1.640028\"",29),"H264 MP4");
        check(DownloadFormatPolicy.supported("audio/mp4; codecs=\"mp4a.40.2\"",29),"AAC M4A");
        check(DownloadFormatPolicy.supported("video/webm; codecs=\"vp09.00.51.08\"",29),"VP9 WebM");
        check(DownloadFormatPolicy.supported("audio/webm; codecs=\"opus\"",29),"Opus WebM");
        check(!DownloadFormatPolicy.supported("audio/mp4; codecs=\"opus\"",36),"Opus MP4 unsupported");
        check(!DownloadFormatPolicy.supported("video/mp4; codecs=\"vp09.00.51.08\"",36),"VP9 MP4 unsupported");
        check(!DownloadFormatPolicy.supported("video/mp4; codecs=\"av01.0.08M.08\"",33),"AV1 API gate");
        check(DownloadFormatPolicy.supported("video/mp4; codecs=\"av01.0.08M.08\"",34),"AV1 supported API");
        check(!DownloadFormatPolicy.supported("video/webm; codecs=\"av01.0.08M.08\"",36),"AV1 WebM unsupported");
        check(!DownloadFormatPolicy.supported("application/octet-stream",36),"Unknown media unsupported");
        for(int i=0;i<2000;i++){byte[] data=new byte[random.nextInt(128)];random.nextBytes(data);try{DownloadProto.parse(data);}catch(IOException expected){}checks++;}
        System.out.println("Download protocol: "+checks+" checks passed");
    }
}
