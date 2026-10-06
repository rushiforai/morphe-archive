package e.e.a;

public final class ThemeRulesTest {
 public static void main(String[] args) {
  check(ThemeRules.mode(null, true).equals("material"));
  check(ThemeRules.mode(null, false).equals("light"));
  for(boolean night:new boolean[]{false,true}) {
   check(!ThemeRules.night("light",night));
   check(ThemeRules.night("dark",night));
   check(ThemeRules.night("material",night)==night);
   for(int sdk:new int[]{23,30,31,36}) {
    check(ThemeRules.style("light",night,sdk).equals("MyThemeLight"));
    check(ThemeRules.style("dark",night,sdk).equals("MyThemeDark"));
    check(ThemeRules.style("material",night,sdk).equals(sdk>=31?"MyThemeMaterialYou":night?"MyThemeDark":"MyThemeLight"));
   }
  }
  check(ThemeRules.mode("dark",true).equals("dark"));
  check(ThemeRules.mode("light",true).equals("light"));
  System.out.println("PASS: migration, explicit modes, system night and pre-Android-12 fallback");
 }
 private static void check(boolean ok) {if(!ok)throw new AssertionError();}
}
