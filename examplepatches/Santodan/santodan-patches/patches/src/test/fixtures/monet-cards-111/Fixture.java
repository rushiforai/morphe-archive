import a.*;
import java.util.*;
import software.santodan.extension.monetcards.*;

public class Fixture {
    static final ur1 MINUS=new ur1(),PLUS=new ur1(),APPLY=new ur1();
    static int applied,saved;
    static final tw1 ORIGINAL=()->{throw new AssertionError("Native finite callback used");};
    static void check(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    static List<b33.Button> render(iy1 composer,mi5 state,og5 style) {
        b33.rendered.clear(); composer.theme=style;
        DisplayedCards.buttons("-",state.g()>4,MINUS,style,ORIGINAL,null,PLUS,APPLY,composer,100,32,state,4,Integer.MAX_VALUE);
        DisplayedCards.buttons("+",state.g()<Integer.MAX_VALUE,PLUS,style,ORIGINAL,MINUS,null,APPLY,composer,200,64,state,4,Integer.MAX_VALUE);
        tw1 apply=()->{applied++;saved=state.g();return u08.a;};
        DisplayedCards.footer110(432,APPLY,PLUS,apply,composer,state,4,Integer.MAX_VALUE);
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Unbalanced groups");
        return new ArrayList<>(b33.rendered);
    }
    static b33.Button target(List<b33.Button> row,ur1 focus) {
        for(var button:row)if(button.focus==focus){check(button.enabled,"Disabled focus target");return button;}
        throw new AssertionError("Unrendered focus target");
    }
    static void navigation(List<b33.Button> row) {
        for(int n=0;n<4;n++)if(row.get(n).enabled)check(target(row,row.get(n).down)==row.get(4),"Down misses Max");
        check(target(row,row.get(4).right)==row.get(5)&&target(row,row.get(5).left)==row.get(4),"Footer horizontal path");
        check(!target(row,row.get(4).up).footer&&!target(row,row.get(5).up).footer,"Up misses enabled count button");
    }
    public static void run() {
        NativeLayout.modern=true;NativeLayout.v111=true;
        check(CardLimit.pickerMaximum(4,20)==Integer.MAX_VALUE&&CardLimit.pickerMaximum(2,6)==6,"Picker scope");
        for(String key:List.of("recommendations_card_limit","continue_watching_card_limit","live_channel_card_limit"))
            check(CardLimit.schemaMaximum(key,20)==Integer.MAX_VALUE,"Schema cap remains");
        check(CardLimit.schemaMaximum("grid_columns",20)==20,"Unrelated schema changed");
        check(CardLimit.summary(Integer.MAX_VALUE).equals("Max")&&CardLimit.summary(372).equals("372"),"Native numeric summaries");
        check(CardLimit.number(Integer.MAX_VALUE,4,Integer.MAX_VALUE).equals("Max")&&CardLimit.number(Integer.MAX_VALUE,2,6).equals("2147483647"),"Number scope");
        iy1 composer=new iy1(); mi5 state=new mi5(20); og5 theme=new og5(123);
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
        try { check(b33.text(row.get(4).focus,composer).equals("Max"),"Text restart lost Max"); }
        finally { composer.r(false); }
        check(DisplayedCards.text("Localized Apply",new iy1()).equals("Localized Apply"),"Scoped label leaked");
        row=render(composer,state,theme);navigation(row);check(!row.get(2).enabled&&!row.get(3).enabled,"Max increments enabled");
        row.get(1).press();check(state.g()==19,"Max finite restoration");
        var next=render(composer,state,new og5(456));
        check(next.get(0).focus==row.get(0).focus&&next.get(4).focus==row.get(4).focus&&next.get(0).click==row.get(0).click,"Remembered controls lost");
        for(var b:next)check(b.style.color==456,"Theme refresh lost");
        state.i(4);row=render(composer,state,theme);navigation(row);check(!row.get(0).enabled&&!row.get(1).enabled,"Minimum guard");
        state.i(Integer.MAX_VALUE-1);row=render(composer,state,theme);row.get(3).press();check(state.g()==Integer.MAX_VALUE,"Overflow");
        mi5 other=new mi5(50);var otherRow=render(new iy1(),other,theme);otherRow.get(0).press();check(other.g()==40&&state.g()==Integer.MAX_VALUE,"Picker state isolation");
        mi5 replacement=new mi5(100);var replaced=render(composer,replacement,theme);navigation(replaced);replaced.get(3).press();check(replacement.g()==110,"Replacement draft");
        b33.rendered.clear();tw1 callback=()->u08.a;
        DisplayedCards.buttons("+",true,PLUS,theme,callback,MINUS,null,APPLY,composer,987,64,other,2,6);
        check(b33.rendered.size()==1&&b33.rendered.get(0).click==callback&&b33.rendered.get(0).flags==987,"Unrelated picker changed");
        ur1 unrelated=new ur1();DisplayedCards.footer110(123,unrelated,PLUS,callback,composer,other,2,6);
        check(b33.rendered.size()==2&&b33.rendered.get(1).label.equals("Apply")&&b33.rendered.get(1).click==callback,"Unrelated footer changed");
        vw1 properties=value->u08.a;check(DisplayedCards.properties(properties,unrelated)==properties,"Unrelated focus changed");
        b33.failFooter=true;
        try { render(composer,new mi5(20),theme);throw new AssertionError("Footer error swallowed"); } catch(IllegalStateException expected) {}
        finally { b33.failFooter=false; }
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Footer failure unbalanced groups");
        check(DisplayedCards.text("Apply",new iy1()).equals("Apply"),"Failure leaked scoped title");
        b33.fail=true;
        try { render(composer,new mi5(20),theme);throw new AssertionError("Button error swallowed"); } catch(IllegalStateException expected) {}
        finally { b33.fail=false; }
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Button failure unbalanced groups");
    }
}
