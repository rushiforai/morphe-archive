package app.morphe.extension.chmate;
import java.nio.file.*;import java.nio.charset.*;
public final class PostingIpRulesTest {
    private static int checks;
    private static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    public static void main(String[] args)throws Exception{
        for(String ip:new String[]{"192.0.2.1","2001:db8::1","::1","::ffff:192.0.2.1"}){
            check(PostingIpRules.address(ip),"numeric address "+ip);
            check(PostingIpRules.exposes("名無し (ﾜｯﾁｮｲ ab12-CD34 ["+ip+"])","本文"),"header "+ip);
        }
        for(String name:new String[]{"名無し [2001:ce8:154:afc0:* [上級国民]]","名無し [192.0.2.*]","名無し (192.0.2.1/24)"})check(PostingIpRules.exposes(name,""),"masked/CIDR header");
        for(String ip:new String[]{"example.com","abc:","1.2.3.999","[::1]","1.2.3.4\ntext","::ffff:999.2.3.4"})check(!PostingIpRules.address(ip),"reject invalid response "+ip);
        check(!PostingIpRules.exposes("名無し (ﾜｯﾁｮｲ ab12-CD34)","IP表示です [192.0.2.1]"),"body address does not classify thread");
        check(!PostingIpRules.exposes("名無し ID:ABCD 999.0.0.1",null),"invalid header is not IP");
        check(PostingIpRules.exposes("名無し","VIPQ2_EXTDAT: checked:vvvvvv:1000:512:: EXT was configured"),"server setting with IP");
        check(!PostingIpRules.exposes("名無し","VIPQ2_EXTDAT: checked:vvvvv:1000:512:: EXT was configured"),"slip without IP");
        for(int mask=0;mask<4;mask++)for(int route=0;route<3;route++)check(PostingIpRules.warn(mask,route)==(mask!=0&&(route==0||(mask&route)!=0)),"network matrix");
        if(args.length>0){String first=Files.readString(Path.of(args[0]),Charset.forName("MS932")).split("\n",2)[0];String[] fields=first.split("<>",5);check(PostingIpRules.exposes(fields[0],fields[3]),"reported live Part5 IP-visible header");}
        System.out.println("PASS "+checks+" IP header/settings/mask/network checks");
    }
}
