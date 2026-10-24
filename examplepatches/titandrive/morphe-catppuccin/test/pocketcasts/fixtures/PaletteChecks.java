import app.morphe.extension.pocketcasts.PocketThemes;
import java.util.Arrays;
public final class PaletteChecks {
 public static void main(String[] args) throws Exception {
  Object array=PocketThemes.append(Arrays.copyOf(mtd.values(),9),mtd.CATPPUCCIN_LATTE,mtd.CATPPUCCIN_MACCHIATO,mtd.RADIOACTIVITY);
  if (((mtd[])array).length!=12) throw new AssertionError();
  for (utd setting:utd.values()) if (((Enum<?>)PocketThemes.theme(setting)).name()!=setting.name()) throw new AssertionError();
  if (PocketThemes.ordinal(mtd.CATPPUCCIN_MACCHIATO)!=1 || mtd.CATPPUCCIN_MACCHIATO.ordinal()!=10) throw new AssertionError();
  Object[] zeros=new Object[107];Arrays.fill(zeros,0L);
  Palette stock=(Palette)Palette.class.getConstructors()[0].newInstance(zeros);
  if (PocketThemes.palette(stock,mtd.DARK)!=stock) throw new AssertionError();
  Palette dark=(Palette)PocketThemes.palette(stock,mtd.CATPPUCCIN_MACCHIATO);
  Palette light=(Palette)PocketThemes.palette(stock,mtd.CATPPUCCIN_LATTE);
  if ((dark.colors[0]>>>32)!=0xff24273aL || (light.colors[0]>>>32)!=0xffeff1f5L) throw new AssertionError();
  if ((dark.colors[26]>>>32)!=0xffc6a0f6L || stock.colors[0]!=0) throw new AssertionError();
  if (PocketThemes.palette(stock,mtd.CATPPUCCIN_MACCHIATO)!=dark) throw new AssertionError();
  if (PocketThemes.palette(stock,mtd.RADIOACTIVITY)==stock) throw new AssertionError();
  System.out.println("PASS: added identities, persistence conversion, stock isolation, both palettes and Radioactivity");
 }
}
