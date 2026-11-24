package app.morphe.extension.chmate;
import java.util.*;
public final class ThreadTabGroupsTest {
    static int checks;
    static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
    public static void main(String[] args){
        ThreadTabGroups state=new ThreadTabGroups();
        state.reconcile(Arrays.asList("a","b","c","d"));
        check(state.display==ThreadTabGroups.Display.TWO_ROWS);
        ThreadTabGroups.Group group=state.merge("a","b");
        check(group.tabs.equals(Arrays.asList("b","a")));
        check(state.owner("a")==state.owner("b"));
        state.select("b");check(group.active.equals("b"));
        state.detach("b");check(state.owner("b")==null);
        check(state.order().contains("b"));check(group.active.equals("a"));
        state.move("c",group.id,0);check(group.tabs.equals(Arrays.asList("c","a")));
        state.display=ThreadTabGroups.Display.ONE_ROW;
        check(state.owner("c")==group);
        state.reorder("d",0);check(state.order().get(0).equals("d"));
        state.reconcile(Arrays.asList("a","b","d"));check(group.tabs.equals(Arrays.asList("a")));
        state.detach("a");check(state.groups().isEmpty());
        check(state.order().size()==3);
        ThreadTabGroups.Group other=state.merge("a","d");
        state.ungroup(other.id);check(state.order().size()==3);check(state.groups().isEmpty());
        state.reconcile(Arrays.asList("a","a","b"));check(state.order().size()==2);
        ThreadTabGroups.Group restored=state.restore("persisted","日本語グループ",0xff112233,Arrays.asList("a","missing"),"missing");
        check(restored.tabs.equals(Arrays.asList("a")));
        check(restored.active.equals("a"));
        check(restored.name.equals("日本語グループ"));
        ThreadTabGroups.Group empty=state.restore("empty","空",0,Arrays.asList("missing"),null);
        check(empty==null);check(state.groups().size()==1);
        state.move("a",restored.id,99);check(restored.tabs.equals(Arrays.asList("a")));
        check(state.merge("a","a")==restored);
        state.reconcile(Collections.emptyList());check(state.groups().isEmpty());check(state.order().isEmpty());
        state.reconcile(Arrays.asList("a","b","c","d","e","f"));
        ThreadTabGroups.Group first=state.merge("a","b"),second=state.merge("c","d"),unrelated=state.merge("e","f");
        ThreadTabGroups.Group merged=state.mergeGroups(first.id,second.id);
        check(merged.tabs.equals(Arrays.asList("d","c","b","a")));
        check(state.groups().size()==2);check(state.owner("a")==merged);check(state.owner("c")==merged);
        check(state.owner("f")==unrelated);check(state.order().size()==6);
        check(!merged.id.equals(first.id)&&!merged.id.equals(second.id));
        state.detach("b");check(state.owner("b")==null);check(state.order().contains("b"));
        state.reconcile(Arrays.asList("one","two","three"));
        ThreadTabGroups.Group selected=state.create(Arrays.asList("one","two","one")," 手動選択 ");
        check(selected.tabs.equals(Arrays.asList("one","two")));check(selected.name.equals("手動選択"));
        ThreadTabGroups.Group single=state.create(Arrays.asList("three"),"");check(single.tabs.size()==1);
        int before=state.groups().size();
        try{state.create(Arrays.asList("one","missing"),"invalid");throw new AssertionError("Accepted missing tab");}catch(IllegalArgumentException expected){check(state.groups().size()==before);check(state.owner("one")==selected);}
        try{state.create(Collections.emptyList(),"invalid");throw new AssertionError("Accepted empty selection");}catch(IllegalArgumentException expected){check(state.groups().size()==before);}
        System.out.println("PASS "+checks);
    }
}
