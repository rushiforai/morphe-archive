package app.morphe.extension.chmate;
public final class NativeFieldsTest {
    static class Parent {private int value=7;}
    static class Child extends Parent {private String label="ok";}
    public static void main(String[] args)throws Exception{
        Child a=new Child(),b=new Child();
        java.lang.reflect.Field first=NativeFields.find(Child.class,"value"),second=NativeFields.find(Child.class,"value");
        if(first!=second||first.getInt(a)!=7)throw new AssertionError("inherited field cache");
        first.setInt(a,9);if(first.getInt(b)!=7)throw new AssertionError("must not cache instance data");
        if(!NativeFields.find(Child.class,"label").get(a).equals("ok"))throw new AssertionError();
        try{NativeFields.find(Child.class,"missing");throw new AssertionError();}catch(NoSuchFieldException expected){}
        if(NativeFields.all(Child.class).size()!=2)throw new AssertionError();
        System.out.println("PASS native field metadata cache/inheritance/isolation");
    }
}
