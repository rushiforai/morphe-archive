package app.morphe.extension.chmate;

import java.util.*;

public final class ResponseMenuOrderTest {
    static int checks;
    static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    record Action(int id,Object intent,Runnable callback) {}
    public static void main(String[] args) {
        int[] base={50,51,70,71,72,73,74,0x7e484a01,0x7e484b01};
        List<Action> source=new ArrayList<>();for(int id:base)source.add(new Action(id,new Object(),()->{}));
        Map<Integer,Integer> rank=new HashMap<>();int[] desired={74,51,0x7e484a01,72,70,50,0x7e484b01,73,71};
        for(int n=0;n<desired.length;n++)rank.put(desired[n],n);
        List<Action> ordered=new ArrayList<>(source);ResponseMenuOrder.apply(ordered,Action::id,rank);
        check(ordered.stream().map(Action::id).toList().equals(Arrays.stream(desired).boxed().toList()),"share slots interleaved with native and added actions");
        for(Action action:source)check(ordered.stream().anyMatch(a->a==action),"item/destination/callback identity");
        List<Action> once=new ArrayList<>(ordered);ResponseMenuOrder.apply(ordered,Action::id,rank);check(ordered.equals(once),"repeat stable");
        ordered=new ArrayList<>(source);ResponseMenuOrder.apply(ordered,Action::id,Map.of(50,1,51,0));check(ordered.equals(source),"no saved shares leaves old menu unchanged");
        List<Action> noShares=new ArrayList<>(List.of(source.get(0),source.get(1)));ResponseMenuOrder.apply(noShares,Action::id,rank);
        check(noShares.equals(List.of(source.get(0),source.get(1))),"unavailable shares do not reorder unrelated menu");
        Action unknownA=new Action(999,null,null),unknownB=new Action(998,null,null);
        ordered=new ArrayList<>(source);ordered.add(unknownA);ordered.add(unknownB);ResponseMenuOrder.apply(ordered,Action::id,rank);
        check(ordered.get(ordered.size()-2)==unknownA&&ordered.get(ordered.size()-1)==unknownB,"unknown actions retained in stable order");
        Random random=new Random(59170);
        for(int n=0;n<100;n++){
            List<Action> shuffled=new ArrayList<>(source);Collections.shuffle(shuffled,random);
            ResponseMenuOrder.apply(shuffled,Action::id,rank);
            check(shuffled.equals(once),"persisted ranks override insertion sequence "+n);
        }
        System.out.println("PASS "+checks+" remembered-share order checks");
    }
}
