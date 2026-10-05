package e.e.a;
public final class PlayerRulesTest {
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
 public static void main(String[] args){
  check(GestureRules.target(true,false,0,100)==1,"volume alone covers left");
  check(GestureRules.target(false,true,100,100)==2,"brightness alone covers right");
  check(GestureRules.target(true,true,49,100)==2&&GestureRules.target(true,true,50,100)==1,"split sides");
  check(GestureRules.target(false,false,50,100)==0,"disabled");
  check(!GestureRules.vertical(50,10,5)&&!GestureRules.vertical(1,2,5)&&GestureRules.vertical(1,40,5),"direction and slop");
  check(GestureRules.value(5,-1000,100,0,10)==10&&GestureRules.value(5,1000,100,0,10)==0,"clamp");
  CommentClockRules c=new CommentClockRules();check(c.position(1000,true,2,0)==1000,"initial");
  check(c.position(1000,true,2,20)==1040&&c.position(1000,true,2,40)==1080,"smooth double speed");
  check(c.position(1000,true,2,500)<=1200,"buffering bounded");
  check(c.position(1500,false,2,520)==1500,"pause exact");
  check(c.position(800,true,2,540)==800,"backward seek");
  check(c.position(4000,true,2,560)==4000,"forward seek");
  check(c.position(4000,true,.25f,580)==4000&&c.position(4000,true,.25f,600)==4005,"quarter speed");
  check(c.position(4000,true,3,620)==4000&&c.position(4000,true,3,640)==4060,"triple speed");
  System.out.println("PlayerRulesTest passed");
 }
}
