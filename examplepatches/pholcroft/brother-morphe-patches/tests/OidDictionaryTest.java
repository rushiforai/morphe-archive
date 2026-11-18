import app.template.extension.extension.OidDictionary;
public final class OidDictionaryTest {
 public static void main(String[] args){
  OidDictionary.Entry sys=OidDictionary.lookup("1.3.6.1.2.1.1.1.0");
  if(sys==null||!sys.name.equals("System description")||!sys.symbol.equals("sysDescr"))throw new AssertionError("identify sysDescr instance");
  OidDictionary.Entry lang=OidDictionary.lookup("1.3.6.1.2.1.43.15.1.1.2.1.10");
  if(lang==null||!lang.symbol.equals("prtInterpreterLangFamily"))throw new AssertionError("table instances use same definition");
  if(OidDictionary.lookup("1.3.6.1.2.1.43.15.1.1.20.1.10")!=null)throw new AssertionError("prefix matching must respect numeric boundaries");
  if(!"PostScript".equals(lang.valueMeaning("integer:6")))throw new AssertionError("decode language value 6");
  if(lang.valueMeaning("integer:987")!=null||lang.valueMeaning("octets:Ng==")!=null)throw new AssertionError("unverified values must remain uninterpreted");
  OidDictionary.Entry papers=OidDictionary.lookup("1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.71.12.1.2.17");
  if(papers==null||!papers.name.contains("paper"))throw new AssertionError("identify Brother indexed paper table");
  OidDictionary.Entry pdl=OidDictionary.lookup("1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.70.1.1.2.1");
  if(pdl==null||pdl.valueMeaning("integer:17")==null||pdl.valueMeaning("integer:3")!=null)throw new AssertionError("interpret only supported Brother PDL value");
  OidDictionary.Entry path=OidDictionary.lookup("1.3.6.1.2.1.43.13.4.1.9.1.2");
  if(path==null||!path.valueMeaning("integer:3").contains("long-edge")||path.valueMeaning("integer:88")!=null)throw new AssertionError("decode standard paper path types");
  String phoenix="1.3.6.1.4.1.2435.2.4.3.2435.5.39.";
  checkValues(phoenix+"1.0","Not supported","Supported");
  checkValues(phoenix+"2.0","Disabled","Enabled");
  if(OidDictionary.lookup(phoenix+"3.0").valueMeaning("integer:1")!=null)
   throw new AssertionError("version must stay numeric");
  String vendor="1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.";
  checkValues(vendor+"63.5.1.4.11","Locked","Not locked");
  checkValues(vendor+"63.5.1.4.5","Locked","Not locked");
  for(String oid:new String[]{"69.2.1.0","69.1.5.0","69.1.6.0","69.1.2.0"})
   checkValues(vendor+oid,"Not supported","Supported");
  OidDictionary.Entry globalLock=OidDictionary.lookup(vendor+"63.3.0");
  if(!"Inactive".equals(globalLock.valueMeaning("integer:1"))||
     !"Active".equals(globalLock.valueMeaning("integer:2"))||globalLock.valueMeaning("integer:0")!=null)
   throw new AssertionError("overall function lock has its own encoding");
  if(OidDictionary.lookup("1.3.6.1.4.1.2435.999")!=null)throw new AssertionError("unknown vendor OIDs must not be guessed");
 }
 private static void checkValues(String oid,String zero,String one){
  OidDictionary.Entry e=OidDictionary.lookup(oid);
  if(e==null||!zero.equals(e.valueMeaning("integer:0"))||!one.equals(e.valueMeaning("integer:1"))||
     e.valueMeaning("integer:2")!=null)throw new AssertionError("wrong value meanings for "+oid);
 }
}
