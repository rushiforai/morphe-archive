package app.morphe.extension.chmate;
public final class ChainAboneReasonTest {
 public static void main(String[] args){int checks=0;
  for(int f=0;f<0x80000;f++){
   boolean want=(f&4096)!=0;
   for(int bit:new int[]{8,16,32,512,2048,16384,65536,262144})if((f&bit)!=0)want=false;
   if(ChainAboneVisibility.chainOnly(f)!=want)throw new AssertionError("reason "+f);checks++;
  }
  System.out.println("PASS "+checks+" native chain-only vs direct NG reason combinations");
 }
}
