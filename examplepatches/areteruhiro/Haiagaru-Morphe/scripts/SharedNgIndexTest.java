package app.morphe.extension.chmate;
import java.util.*;

public final class SharedNgIndexTest {
    static int checks;
    static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
    public static void main(String[] args){
        List<SharedNgRules.Rule> rules=new ArrayList<>();
        String[] values={"Abc123","ab12-CD34","ab12","CD34","死ね","名前","◆trip"};
        for(int i=0;i<7;i++)for(int board=0;board<2;board++)rules.add(new SharedNgRules.Rule(String.format("%064x",rules.size()+1),board==0?"5ch/all":"edge/all",SharedNgIndex.KINDS[i],values[i],"",i+1,false,1+i%5,i%3));
        rules.add(new SharedNgRules.Rule("f".repeat(64),"*","keyword","全角Ａ","",3,false));
        rules.add(new SharedNgRules.Rule("e".repeat(64),"*","name","名前","",3,false));
        rules.add(new SharedNgRules.Rule("d".repeat(64),"5ch/all","keyword","revoked","",99,true));
        Random random=new Random(18);
        for(int n=0;n<10000;n++){
            int votes=1+random.nextInt(9),level=1+random.nextInt(5),mask=random.nextInt(128);
            Set<String> ignored=n%3==0?Set.of(rules.get(n%rules.size()).id):Set.of();
            Set<String> excluded=n%7==0?Set.of("edge/all"):Set.of();
            SharedNgIndex index=new SharedNgIndex(rules,votes,ignored,excluded,mask);
            String board=n%3==0?"5ch/all":n%3==1?"edge/all":"pink/all",id=n%2==0?"Abc123":"other",name=n%4==0?"名前 ◆trip (ﾜｯﾁｮｲ ab12-CD34)":"neutral",body=n%5==0?"死ね 全角A":n%2==0?"revoked":"neutral";
            boolean expected=false;
            for(SharedNgRules.Rule r:rules){int kind=Arrays.asList(SharedNgIndex.KINDS).indexOf(r.kind);
                if(r.revoked||r.votes<Math.max(votes,r.minVotes)||ignored.contains(r.id)||excluded.contains(r.board)||(mask&(1<<kind))==0)continue;
                if(r.matchesPrepared(board,id,SharedNgRules.wacchoi(name),"","",SharedNgRules.text(body),votes)
                        ||(r.kind.equals("name")||r.kind.equals("trip"))&&r.board.equals(board)&&name.contains(r.value)){expected=true;break;}
            }
            check(expected==index.matches(board,id,name,body));
        }
        // ID-only matching must not normalize a huge body or parse dates.
        check(new SharedNgIndex(List.of(rules.get(0)),1,Set.of(),Set.of(),127).matches("5ch/all","Abc123","",null));
        var high=new SharedNgRules.Rule("c".repeat(64),"5ch/all","id","HighLevel","",1,false,5,1);
        check(new SharedNgIndex(List.of(high),1,Set.of(),Set.of(),127).matches("5ch/all","HighLevel","",""));
        check(!new SharedNgIndex(List.of(high),2,Set.of(),Set.of(),127).matches("5ch/all","HighLevel","",""));
        System.out.println("PASS shared NG index equivalence and no-strength "+checks);
    }
}
