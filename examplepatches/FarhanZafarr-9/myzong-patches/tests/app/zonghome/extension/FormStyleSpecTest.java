package app.zonghome.extension;

public final class FormStyleSpecTest {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args) {
        for(String name:new String[]{"etP1","etP6","etP01","etP21","etP24"})check(FormStyleSpec.digit(name),"PIN/OTP cell not recognized: "+name);
        for(String name:new String[]{"etPassword","etPhone","etPin","etMobileNumber","etP123"})check(!FormStyleSpec.digit(name),"Normal field mistaken for digit box: "+name);
        check(FormStyleSpec.role("tbDeletAllAccounts")==FormStyleSpec.Role.DESTRUCTIVE,"Destructive action must not look like Continue");
        check(FormStyleSpec.role("skipBtn")==FormStyleSpec.Role.SECONDARY,"Skip hierarchy");
        check(FormStyleSpec.role("tvTerms")==FormStyleSpec.Role.LINK,"Terms link hierarchy");
        check(FormStyleSpec.fieldStroke(true,true,true,1,2,3,4)==4,"Validation error wins over focused accent");
        check(FormStyleSpec.fieldStroke(false,true,false,1,2,3,4)==3,"Disabled state wins over focus");
        check(FormStyleSpec.fieldStroke(true,true,false,1,2,3,4)==1,"Focused outline");
        check(FormStyleSpec.fieldStroke(true,false,false,1,2,3,4)==2,"Idle outline");
        System.out.println("PASS: PIN/OTP field classification, button/link hierarchy and focused/disabled/error priority");
    }
}
