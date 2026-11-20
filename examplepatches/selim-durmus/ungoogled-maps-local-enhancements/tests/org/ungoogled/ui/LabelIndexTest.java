package org.ungoogled.ui;
import java.util.*;
import org.ungoogled.ui.LabelIndex.Candidate;
public final class LabelIndexTest {
    static void check(boolean yes,String message){if(!yes)throw new AssertionError(message);}
    static SavedStore.Place place(String name,double lat,double lng){SavedStore.Place p=new SavedStore.Place();p.name=name;p.lat=lat;p.lng=lng;return p;}
    static Candidate label(String label,SavedStore.Place p){return new Candidate(Candidate.LABEL,label,p.name,"",p);}
    static List<Candidate> data() {
        List<Candidate> all=new ArrayList<>();
        all.add(label("Home",place("Central Library",51.0455,-114.0549)));
        all.add(label("Work",place("Bow Building",51.0478,-114.0626)));
        all.add(label("Gym",place("Repsol Sport Centre",51.0367,-114.0592)));
        SavedStore.Place bridge=place("Peace Bridge",51.0546,-114.0784);
        all.add(new Candidate(Candidate.SAVED,bridge.name,"Starred places","Bridge",bridge));
        SavedStore.Place costco=place("Costco Beacon Hill",51.1268,-114.2050);
        all.add(new Candidate(Candidate.SAVED,costco.name,"Want to go","bulk groceries and gas Warehouse store",costco));
        SavedStore.Place cafe=place("Analog Coffee 17th Ave",51.0379,-114.0855);
        all.add(new Candidate(Candidate.SAVED,cafe.name,"Coffee","Coffee shop",cafe));
        all.add(new Candidate(Candidate.RECENT,"Peace Bridge","Recent","",place("Peace Bridge",51.0546,-114.0784)));
        all.add(new Candidate(Candidate.RECENT,"Repsol Sport Centre","Recent","",place("Repsol Sport Centre",51.0367,-114.0592)));
        return all;
    }
    static String first(String query){List<Candidate> r=LabelIndex.rankLocal(data(),query);return r.isEmpty()?null:r.get(0).title;}
    public static void main(String[] args) {
        check(LabelIndex.rank(Arrays.asList("Sinem clinic","My Sinem","Sinem")," sinem ").equals(Arrays.asList(2,0,1)),"exact before prefix before word");
        check(LabelIndex.score("SİNEM","sinem")==LabelIndex.EXACT,"Turkish dotted I");
        check(LabelIndex.score("Café Mum","cafe")==LabelIndex.PREFIX,"accent matching");
        check(LabelIndex.score("Home","")==-1,"empty query");
        check(LabelIndex.score("Home","work")==-1,"no match");
        check(LabelIndex.score("  My   Gym ","my gym")==LabelIndex.EXACT,"spacing");
        check(LabelIndex.score("Costco Beacon Hill","beacon")==LabelIndex.WORD,"word start");
        check(LabelIndex.score("Prince's Island Park","island")==LabelIndex.WORD,"word after an apostrophe");
        check(LabelIndex.score("Peace Bridge","eace")==LabelIndex.INSIDE,"inside a word");
        check(LabelIndex.rank(Arrays.asList("Gym B","Gym A"),"gym").equals(Arrays.asList(1,0)),"stable alphabetical ties");
        check("Analog Coffee 17th Ave".equals(first("coffee")),"saved place by name");
        check("Costco Beacon Hill".equals(first("groceries")),"saved place by note");
        check("Gym".equals(first("g")),"label first on one letter");
        check(LabelIndex.rankLocal(data(),"g").size()==1,"one letter: no notes, no matches inside words");
        check(LabelIndex.rankLocal(data(),"").size()==3,"empty query: Home, Work and labels only");
        check("Home".equals(first("")),"empty query starts with Home");
        check(LabelIndex.rankLocal(data(),"peace").size()==1,"a place both saved and recent shows once");
        check(LabelIndex.rankLocal(data(),"peace").get(0).kind==Candidate.SAVED,"saved wins over recent");
        check(LabelIndex.rankLocal(data(),"repsol").size()==1,"a labelled place found by its name shows once");
        check("Gym".equals(first("repsol")),"as its label");
        System.out.println("Label matching checks passed.");
    }
}
