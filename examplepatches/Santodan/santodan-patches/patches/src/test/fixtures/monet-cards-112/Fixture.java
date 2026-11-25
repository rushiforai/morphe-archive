import a.*;
import java.util.*;
import software.santodan.extension.monetcards.*;

public class Fixture {
    static final gs1 MINUS=new gs1(),PLUS=new gs1(),APPLY=new gs1();
    static int applied,saved;
    static final fx1 ORIGINAL=()->{throw new AssertionError("Native finite callback used");};
    static void check(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    static List<w33.Button> render(ty1 composer,cm5 state,ek5 style) {
        w33.rendered.clear(); composer.theme=style;
        DisplayedCards.buttons("-",state.g()>4,MINUS,style,ORIGINAL,null,PLUS,APPLY,composer,100,32,state,4,Integer.MAX_VALUE);
        DisplayedCards.buttons("+",state.g()<Integer.MAX_VALUE,PLUS,style,ORIGINAL,MINUS,null,APPLY,composer,200,64,state,4,Integer.MAX_VALUE);
        fx1 apply=()->{applied++;saved=state.g();return qf8.a;};
        DisplayedCards.footer110(432,APPLY,PLUS,apply,composer,state,4,Integer.MAX_VALUE);
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Unbalanced groups");
        return new ArrayList<>(w33.rendered);
    }
    static w33.Button target(List<w33.Button> row,gs1 focus) {
        for(var button:row)if(button.focus==focus){check(button.enabled,"Disabled focus target");return button;}
        throw new AssertionError("Unrendered focus target");
    }
    static void navigation(List<w33.Button> row) {
        for(int n=0;n<4;n++)if(row.get(n).enabled)check(target(row,row.get(n).down)==row.get(4),"Down misses Max");
        check(target(row,row.get(4).right)==row.get(5)&&target(row,row.get(5).left)==row.get(4),"Footer horizontal path");
        check(!target(row,row.get(4).up).footer&&!target(row,row.get(5).up).footer,"Up misses enabled count button");
    }
    public static void run() {
        NativeLayout.modern=true;NativeLayout.v112=true;
        check(CardLimit.pickerMaximum(4,20)==Integer.MAX_VALUE&&CardLimit.pickerMaximum(2,6)==6,"Picker scope");
        for(String key:List.of("recommendations_card_limit","continue_watching_card_limit","live_channel_card_limit"))
            check(CardLimit.schemaMaximum(key,20)==Integer.MAX_VALUE,"Schema cap remains");
        check(CardLimit.schemaMaximum("grid_columns",20)==20,"Unrelated schema changed");
        check(CardLimit.summary(Integer.MAX_VALUE).equals("Max")&&CardLimit.summary(372).equals("372"),"Native numeric summaries");
        check(CardLimit.number(Integer.MAX_VALUE,4,Integer.MAX_VALUE).equals("Max")&&CardLimit.number(Integer.MAX_VALUE,2,6).equals("2147483647"),"Number scope");
        ty1 composer=new ty1(); cm5 state=new cm5(20); ek5 theme=new ek5(123);
        var row=render(composer,state,theme);
        check(row.size()==6&&row.get(4).label.equals("Max")&&row.get(5).label.equals("Apply"),"Native footer labels");
        check(state.writes==0&&applied==0,"Composition wrote or saved a value");
        check(row.get(0).label.equals("\u221210")&&row.get(1).label.equals("-")&&row.get(2).label.equals("+")&&row.get(3).label.equals("+10"),"Count order");
        for(var b:row)check(b.style==theme,"Native theme identity changed");
        check(row.get(1).focus==MINUS&&row.get(2).focus==PLUS&&row.get(5).focus==APPLY,"Native focus identity changed");
        for(int n=0;n<4;n++) {
            check(row.get(n).left==(n==0?null:row.get(n-1).focus),"Left chain");
            check(row.get(n).right==(n==3?null:row.get(n+1).focus),"Right chain");
        }
        navigation(row);
        row.get(3).press();check(state.g()==30,"+10");row.get(2).press();check(state.g()==31,"+1");
        row.get(0).press();check(state.g()==21,"-10");row.get(1).press();check(state.g()==20,"-1");
        row.get(4).press();check(state.g()==Integer.MAX_VALUE&&applied==0,"Max must edit draft only");
        row.get(5).press();check(applied==1&&saved==Integer.MAX_VALUE,"Original Apply callback lost");
        // Restart the text child without the parent's scoped label; native instance remembers Max.
        composer.h0(0x53444312);
        try { check(w33.text(row.get(4).focus,composer).equals("Max"),"Text restart lost Max"); }
        finally { composer.r(false); }
        check(DisplayedCards.text("Localized Apply",new ty1()).equals("Localized Apply"),"Scoped label leaked");
        row=render(composer,state,theme);navigation(row);check(!row.get(2).enabled&&!row.get(3).enabled,"Max increments enabled");
        row.get(1).press();check(state.g()==19,"Max finite restoration");
        var next=render(composer,state,new ek5(456));
        check(next.get(0).focus==row.get(0).focus&&next.get(4).focus==row.get(4).focus&&next.get(0).click==row.get(0).click,"Remembered controls lost");
        for(var b:next)check(b.style.color==456,"Theme refresh lost");
        state.i(4);row=render(composer,state,theme);navigation(row);check(!row.get(0).enabled&&!row.get(1).enabled,"Minimum guard");
        state.i(Integer.MAX_VALUE-1);row=render(composer,state,theme);row.get(3).press();check(state.g()==Integer.MAX_VALUE,"Overflow");
        cm5 other=new cm5(50);var otherRow=render(new ty1(),other,theme);otherRow.get(0).press();check(other.g()==40&&state.g()==Integer.MAX_VALUE,"Picker state isolation");
        cm5 replacement=new cm5(100);var replaced=render(composer,replacement,theme);navigation(replaced);replaced.get(3).press();check(replacement.g()==110,"Replacement draft");
        w33.rendered.clear();fx1 callback=()->qf8.a;
        DisplayedCards.buttons("+",true,PLUS,theme,callback,MINUS,null,APPLY,composer,987,64,other,2,6);
        check(w33.rendered.size()==1&&w33.rendered.get(0).click==callback&&w33.rendered.get(0).flags==987,"Unrelated picker changed");
        gs1 unrelated=new gs1();DisplayedCards.footer110(123,unrelated,PLUS,callback,composer,other,2,6);
        check(w33.rendered.size()==2&&w33.rendered.get(1).label.equals("Apply")&&w33.rendered.get(1).click==callback,"Unrelated footer changed");
        hx1 properties=value->qf8.a;check(DisplayedCards.properties(properties,unrelated)==properties,"Unrelated focus changed");
        w33.failFooter=true;
        try { render(composer,new cm5(20),theme);throw new AssertionError("Footer error swallowed"); } catch(IllegalStateException expected) {}
        finally { w33.failFooter=false; }
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Footer failure unbalanced groups");
        check(DisplayedCards.text("Apply",new ty1()).equals("Apply"),"Failure leaked scoped title");
        w33.fail=true;
        try { render(composer,new cm5(20),theme);throw new AssertionError("Button error swallowed"); } catch(IllegalStateException expected) {}
        finally { w33.fail=false; }
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Button failure unbalanced groups");
    }
}
