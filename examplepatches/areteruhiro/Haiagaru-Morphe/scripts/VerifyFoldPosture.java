package app.morphe.extension.chmate;
public final class VerifyFoldPosture {
    public static void main(String[] args) {
        int checks=0;
        for(boolean feature:new boolean[]{false,true})for(boolean verified:new boolean[]{false,true})for(boolean multi:new boolean[]{false,true}){
            Boolean actual=FoldPosturePolicy.tablet(feature,verified,multi);
            Boolean expected=feature?Boolean.TRUE:!verified||multi?null:Boolean.FALSE;
            if(!java.util.Objects.equals(actual,expected))throw new AssertionError("feature="+feature+", verified="+verified+", split="+multi);
            checks++;
        }
        System.out.println("PASS "+checks+" fold posture cases: confirmed hinge, cover, ordinary device, first closed launch and split window");
    }
}
