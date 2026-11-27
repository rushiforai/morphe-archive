package local.privacy;
import java.util.*;
public final class RenderWorkCheck {
 public static final class Author {
  int ids, names;
  public String Q(){ids++;return "account";}
  public String S(){ids++;return "old-account";}
  public String g0(){ids++;return "comment-account";}
  public String h0(){ids++;return "old-comment";}
  public String y(){names++;throw new AssertionError("nickname re-read");}
  public String z(){names++;throw new AssertionError("nickname re-read");}
  public String Y(){names++;throw new AssertionError("nickname re-read");}
 }
 public static final class Item { final int type; Item(int n){type=n;} public int h(){return type;} }
 static void check(boolean ok){if(!ok)throw new AssertionError();}
 public static void main(String[]args){
  Author a=new Author(); AuthorInfo.configure(true);
  for(int i=0;i<10000;i++){check(AuthorInfo.listName(a,"nickname").equals("nickname"));check(AuthorInfo.commentName(a,"comment").equals("comment"));}
  check(a.ids==0 && a.names==0);
  SettingsState.enabled=true;
  check(AuthorInfo.listName(a,"nickname").equals("nickname (account)"));
  check(AuthorInfo.commentName(a,"comment").equals("comment (comment-account)"));
  AuthorInfo.configure(false);
  check(AuthorInfo.listName(a,"nickname").equals("nickname (old-account)"));
  check(AuthorInfo.commentName(a,"comment").equals("comment (old-comment)"));
  check(a.ids==4 && a.names==0);
  check(AuthorInfo.listName(null,null).isEmpty());
  List<Object> source=new ArrayList<>(Arrays.asList(new Item(1),new Item(2),null,new Object(),new Item(9)));
  SettingsState.mask=0;check(HomeFilter.filter(source)==source);
  SettingsState.mask=8;check(HomeFilter.filter(source)==source);
  SettingsState.mask=5;List<?> result=HomeFilter.filter(source);
  check(result.size()==3 && result.get(0)==source.get(1) && result.get(1)==null && result.get(2)==source.get(3));
  check(source.size()==5);
  SettingsState.mask=63;check(HomeFilter.filter(Collections.singletonList(new Item(1))).isEmpty());
  check(HomeFilter.filter(null)==null);
  System.out.println("PASS: 20,000 ID-off render calls with zero model getter calls; both version ID mappings; home filter identity, order, null/unknown items and input preservation");
 }
}