package app.zonghome.extension;

import java.util.Arrays;

public final class OtpPastePlanTest {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static int apply(String[] cells,OtpPastePlan plan) {
        int completions=0;
        for(int i=plan.start;i<cells.length;i++){cells[i]="";check(Arrays.stream(cells).mapToInt(String::length).sum()<cells.length,"Mixed code became complete during clearing");}
        for(int i=0;i<plan.digits.length();i++) {
            cells[plan.start+i]=String.valueOf(plan.digits.charAt(i));
            if(Arrays.stream(cells).mapToInt(String::length).sum()==cells.length)completions++;
        }
        return completions;
    }
    public static void main(String[] args) {
        check(OtpPastePlan.prefix("etP1").equals("etP"),"OTP row");
        check(OtpPastePlan.prefix("etP01").equals("etP0"),"Old PIN row");
        check(OtpPastePlan.prefix("etP21").equals("etP2"),"Confirmation PIN row must remain separate");
        check(OtpPastePlan.prefix("etPhone")==null,"Normal phone field must remain unchanged");
        var complete=OtpPastePlan.create("12 34-56",6,4);
        check(complete.start==0 && complete.digits.equals("123456"),"Full code replaces current row from first box");
        String[] old={"9","8","7","6","5","4"};
        check(apply(old,complete)==1 && String.join("",old).equals("123456"),"Existing code replaced without mixed-code completion");
        var partial=OtpPastePlan.create("34",6,2);String[] row={"1","2","9","9","9","9"};
        check(apply(row,partial)==0 && String.join("",row).equals("1234"),"Partial paste keeps prefix and clears stale suffix");
        check(OtpPastePlan.create("1234567",6,0).rejected,"No silent truncation");
        check(OtpPastePlan.create("1234",6,4).rejected,"Overflowing partial paste rejected");
        check(OtpPastePlan.create("۴۵۶۷",4,0).digits.equals("4567"),"Persian digits normalized");
        check(OtpPastePlan.create("١٢٣٤٥",5,0).digits.equals("12345"),"Five-box keyboard and Arabic digits");
        check(OtpPastePlan.create("1",6,0)==null && OtpPastePlan.create("ab1234",4,0)==null,"Normal typing/non-code text delegates to native input");
        System.out.println("PASS: 4/5/6 digit paste, row isolation, partial replacement, stale-code clearing, Unicode digits and overflow handling");
    }
}
