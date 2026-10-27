import a.*;
import java.util.*;
import software.santodan.extension.monetcards.*;

public class Fixture {
    static final cm1 MINUS=new cm1(),PLUS=new cm1(),APPLY=new cm1();
    static int applied,saved;
    static final iq1 ORIGINAL=()->{throw new AssertionError("unsafe native single-step callback used for card picker");};
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static List<mq2.Button> render(yr1 composer,q15 state,zz4 style){
        mq2.rendered.clear();composer.theme=style;
        DisplayedCards.buttons("-",state.g()>4,MINUS,style,ORIGINAL,null,PLUS,APPLY,composer,100,32,state,4,Integer.MAX_VALUE);
        DisplayedCards.buttons("+",state.g()<Integer.MAX_VALUE,PLUS,style,ORIGINAL,MINUS,null,APPLY,composer,200,64,state,4,Integer.MAX_VALUE);
        check(mq2.rendered.size()==4,"Max is not in the crowded top row");
        iq1 apply=()->{applied++;saved=state.g();return s67.a;};
        DisplayedCards.footer("Apply",apply,APPLY,PLUS,composer,3456,state,4,Integer.MAX_VALUE);
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"Compose groups balanced");
        return new ArrayList<>(mq2.rendered);
    }
    static mq2.Button target(List<mq2.Button> row,cm1 focus){
        for(mq2.Button button:row)if(button.focus==focus)return button;
        throw new AssertionError("focus target is not rendered in this picker");
    }
    static mq2.Button move(List<mq2.Button> row,mq2.Button from,String direction){
        cm1 focus=direction.equals("down")?from.down:direction.equals("up")?from.up:direction.equals("left")?from.left:from.right;
        mq2.Button to=target(row,focus);check(to.enabled,"focus target is disabled");return to;
    }
    static void navigation(List<mq2.Button> row){
        for(int n=0;n<4;n++)if(row.get(n).enabled)
            check(move(row,row.get(n),"down").label.equals("Max"),"Down from every enabled count control enters Max");
        check(move(row,row.get(4),"right").label.equals("Apply"),"Right goes from Max to Apply");
        check(move(row,row.get(5),"left").label.equals("Max"),"Left goes from Apply to Max");
        check(!move(row,row.get(4),"up").footer&&!move(row,row.get(5),"up").footer,"Up returns to an enabled count button");
    }
    public static void run(){
        check(CardLimit.pickerMaximum(4,20)==Integer.MAX_VALUE&&CardLimit.pickerMaximum(2,6)==6,"only displayed card maximum changes");
        check(CardLimit.schemaMaximum("recommendations_card_limit",20)==Integer.MAX_VALUE,"recommendation schema");
        check(CardLimit.schemaMaximum("continue_watching_card_limit",20)==Integer.MAX_VALUE,"continue watching schema");
        check(CardLimit.schemaMaximum("live_channel_card_limit",20)==Integer.MAX_VALUE,"live schema");
        check(CardLimit.schemaMaximum("grid_columns",20)==20,"unrelated schema unchanged");
        check("Max".equals(CardLimit.label(0x7f110354,new Object[]{Integer.MAX_VALUE}))&&CardLimit.label(10,new Object[]{Integer.MAX_VALUE})==null,"summary scoped to card resource");
        check(CardLimit.number(Integer.MAX_VALUE,4,Integer.MAX_VALUE).equals("Max")&&CardLimit.number(Integer.MAX_VALUE,2,6).equals("2147483647"),"native number label scope");
        check(CardLimit.step(20,10,20)==30&&CardLimit.step(372,10,372)==382,"above 20");
        check(CardLimit.step(4,-10,4)==4&&CardLimit.step(Integer.MAX_VALUE-1,10,20)==Integer.MAX_VALUE,"minimum and overflow");
        yr1 composer=new yr1();q15 state=new q15(20);zz4 theme=new zz4(0x123456);
        List<mq2.Button> row=render(composer,state,theme);
        check(row.size()==6,"four count buttons and two footer buttons");
        check(row.get(0).label.equals("\u221210")&&row.get(1).label.equals("-")&&row.get(2).label.equals("+")&&row.get(3).label.equals("+10"),"count row order");
        check(row.get(4).label.equals("Max")&&row.get(5).label.equals("Apply")&&row.get(4).footer&&row.get(5).footer,"Max is immediately left of Apply with native pill styling");
        check(state.writes==0&&applied==0,"composition does not change or save value");
        for(mq2.Button b:row)check(b.style==theme,"native current theme shared by both rows");
        check(row.get(1).focus==MINUS&&row.get(2).focus==PLUS&&row.get(5).focus==APPLY,"original native focus requesters retained");
        for(int n=0;n<4;n++){
            check(row.get(n).left==(n==0?null:row.get(n-1).focus),"count row left navigation");
            check(row.get(n).right==(n==3?null:row.get(n+1).focus),"count row right navigation");
            check(row.get(n).down==row.get(4).focus,"all count buttons point down to Max");
        }
        check(row.get(4).right==APPLY&&row.get(5).left==row.get(4).focus,"Max/Apply horizontal link");
        check(row.get(4).left==null&&row.get(5).right==null&&row.get(4).down==null&&row.get(5).down==null,"footer boundaries preserved");
        check(row.get(4).up==row.get(0).focus&&row.get(5).up==PLUS,"up returns to count row");
        navigation(row);
        check(row.get(3).press()==s67.a&&state.g()==30,"plus ten updates native state");
        check(row.get(2).press()==s67.a&&state.g()==31,"plus one");
        row.get(0).press();check(state.g()==21,"minus ten");row.get(1).press();check(state.g()==20,"minus one");
        row.get(4).press();check(state.g()==Integer.MAX_VALUE&&applied==0,"Max edits draft without applying");
        row.get(5).press();check(applied==1&&saved==Integer.MAX_VALUE,"original Apply saves selected Max");
        row=render(composer,state,theme);check(!row.get(2).enabled&&!row.get(3).enabled,"increments disabled at maximum");navigation(row);
        row.get(1).press();check(state.g()==19,"leaving Max restores finite value");
        List<mq2.Button> rerendered=render(composer,state,new zz4(0xabcdef));
        check(rerendered.get(0).focus==row.get(0).focus&&rerendered.get(4).focus==row.get(4).focus,"extra focus remembered");
        check(rerendered.get(0).click==row.get(0).click,"click actions remembered");
        for(mq2.Button b:rerendered)check(b.style.color==0xabcdef,"theme update applies to both rows");
        state.i(4);row=render(composer,state,theme);check(!row.get(0).enabled&&!row.get(1).enabled&&row.get(2).enabled,"minimum enablement");navigation(row);
        state.i(Integer.MAX_VALUE-1);row=render(composer,state,theme);row.get(3).press();check(state.g()==Integer.MAX_VALUE,"no overflow");
        q15 other=new q15(100);yr1 otherComposer=new yr1();List<mq2.Button> otherRow=render(otherComposer,other,theme);otherRow.get(0).press();check(other.g()==90&&state.g()==Integer.MAX_VALUE,"picker state isolation");
        q15 replacement=new q15(50);List<mq2.Button> replacementRow=render(composer,replacement,theme);navigation(replacementRow);replacementRow.get(3).press();check(replacement.g()==60&&state.g()==Integer.MAX_VALUE,"replacement draft routed correctly");
        mq2.rendered.clear();final int[] calls={0};iq1 callback=()->{calls[0]++;return s67.a;};
        DisplayedCards.buttons("+",true,PLUS,theme,callback,MINUS,null,APPLY,composer,987,64,other,2,6);
        check(mq2.rendered.size()==1&&mq2.rendered.get(0).click==callback&&mq2.rendered.get(0).flags==987&&mq2.rendered.get(0).defaults==64,"unrelated picker unchanged");
        cm1 unrelated=new cm1();DisplayedCards.footer("Apply",callback,unrelated,PLUS,composer,123,other,2,6);
        check(mq2.rendered.size()==2&&mq2.rendered.get(1).click==callback&&mq2.rendered.get(1).flags==123,"unrelated footer unchanged");
        kq1 properties=value->s67.a;check(DisplayedCards.properties(properties,unrelated)==properties,"unrelated focus untouched");
        mq2.rendered.get(0).press();check(calls[0]==1,"unrelated callback preserved");
        mq2.fail=true;
        try{render(composer,new q15(20),theme);throw new AssertionError("renderer error swallowed");}catch(IllegalStateException expected){}
        finally{mq2.fail=false;}
        check(composer.groups.isEmpty()&&composer.begins==composer.ends,"render failure balances groups");
    }
}
