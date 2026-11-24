package app.zonghome.extension;

public final class OnboardingFollowupTest {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static float difference(float a,float b){return Math.abs(((a-b+540)%360+360)%360-180);}
    public static void main(String[] args){
        check(ProfileSkipPolicy.shouldSkip(true,false),"OTP onboarding should be skippable");
        check(!ProfileSkipPolicy.shouldSkip(true,true),"Never skip Profile opened from navigation");
        check(!ProfileSkipPolicy.shouldSkip(false,false),"Never skip ordinary Profile");
        check(!ProfileSkipPolicy.shouldSkip(false,true),"Never skip ordinary navigation");
        for(long boundary:new long[]{2400,4800,9600,123456000}) {
            float before=LoadingPhase.turn(boundary-1),after=LoadingPhase.turn(boundary);
            check(difference(before,after)<.2f,"Outer ring jumped at "+boundary);
            check(difference(-1.5f*before,-1.5f*after)<.3f,"Inner ring jumped at "+boundary);
            check(Math.abs(LoadingPhase.pulse(boundary-1)-LoadingPhase.pulse(boundary))<.002,"Sweep jumped");
        }
        for(long t:new long[]{0,1,2399,2400,4799,987654321}){
            check(LoadingPhase.turn(t)==LoadingPhase.turn(t+4800),"Rotation does not repeat");
            check(LoadingPhase.pulse(t)==LoadingPhase.pulse(t+4800),"Sweep does not repeat");
        }
        check(FormStyleSpec.role("btnUpdate")==FormStyleSpec.Role.PRIMARY,"Profile action styling");
        check(FormStyleSpec.role("lblMbbRegistration")==FormStyleSpec.Role.LINK,"MBB disclaimer link styling");
        System.out.println("PASS: OTP-only Profile skip policy; both loader rings and sweeps remain continuous and periodic");
    }
}
