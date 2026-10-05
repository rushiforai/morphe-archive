import e.e.a.GestureRules;
public final class GestureRulesTest {
 static int checks;static void check(boolean value){if(!value)throw new AssertionError("case "+checks);checks++;}
 public static void main(String[] args){
  check(!GestureRules.vertical(2,12,24));
  check(!GestureRules.vertical(30,30,24));
  check(!GestureRules.vertical(60,20,24));
  check(GestureRules.vertical(5,-50,24));
  check(GestureRules.vertical(-5,50,24));
  for(float density:new float[]{1,2,3}){
   float w=360*density,h=180*density;
   check(GestureRules.startArea(w/2,h/2,w,h,density));
   check(!GestureRules.startArea(2*density,h/2,w,h,density));
   check(!GestureRules.startArea(w/2,8*density,w,h,density));
   check(!GestureRules.startArea(w/2,h-8*density,w,h,density));
  }
  check(GestureRules.target(true,true,80,360)==2);
  check(GestureRules.target(true,true,280,360)==1);
  check(GestureRules.target(true,false,80,360)==1);
  check(GestureRules.target(false,true,280,360)==2);
  check(GestureRules.value(50,0,180,0,100)==50);
  check(GestureRules.value(50,-1000,180,0,100)==100);
  check(GestureRules.value(50,1000,180,0,100)==0);
  System.out.println("Gesture rules: "+checks+" accidental-swipe and adjustment checks passed");
 }
}
