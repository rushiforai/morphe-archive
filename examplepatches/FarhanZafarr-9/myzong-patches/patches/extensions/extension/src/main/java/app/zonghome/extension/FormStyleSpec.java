package app.zonghome.extension;

/** Scope-local roles; no input data or validation behavior is changed. */
final class FormStyleSpec {
    enum Role { INPUT, DIGIT, PRIMARY, SECONDARY, DESTRUCTIVE, LINK, TITLE, BODY, ERROR, PANEL, KEY, STEP, LINE }
    static boolean digit(String name) {
        if(!name.startsWith("etP") || name.length()<4 || name.length()>5)return false;
        for(int i=3;i<name.length();i++)if(name.charAt(i)<'0'||name.charAt(i)>'9')return false;
        return true;
    }
    static Role role(String name) {
        if(digit(name))return Role.DIGIT;
        if(name.startsWith("et"))return Role.INPUT;
        switch(name) {
            case "btnUpdate":case "btnRegister":case "btnContinue":case "btnLogin":case "nextBtn":case "startBtn":case "appCompatButton":return Role.PRIMARY;
            case "skipBtn":case "btnSkip":case "btnPinResend":return Role.SECONDARY;
            case "tbDeletAllAccounts":case "tbDeleteAllAccounts":return Role.DESTRUCTIVE;
            case "lblMbbRegistration":case "tvTerms":case "forgotPin":case "tvForgotPin":case "signup":case "click":return Role.LINK;
            case "tvFullName":case "tvTitle":case "titleMobileNum":case "tvPinLbl":case "enterPin":case "renterPin":case "tvOldPin":case "loginText":case "titleTv":return Role.TITLE;
            case "tvError":case "errorText":case "tvAlert":return Role.ERROR;
            case "layout":case "constraintPin":case "keyboard":case "mbbAndTerms":return Role.PANEL;
            case "one":case "two":case "three":case "four":case "five":case "six":case "seven":case "eight":case "nine":case "zero":return Role.KEY;
            case "text1":case "text2":case "text3":case "text4":case "text5":return Role.STEP;
            case "line1":case "line2":case "line3":case "line4":return Role.LINE;
            default:return Role.BODY;
        }
    }
    static int fieldStroke(boolean enabled,boolean focused,boolean error,int accent,int track,int disabled,int errorColor) {
        if(error)return errorColor;
        if(!enabled)return disabled;
        return focused?accent:track;
    }
}
