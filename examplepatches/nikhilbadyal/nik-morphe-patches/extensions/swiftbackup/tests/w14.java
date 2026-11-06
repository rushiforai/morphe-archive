/** Stand in for the exact native serialization API; production backup logic and schema validation remain real. */
public final class w14 {
    public static String exported;
    public static String imported;
    public static final Gson SERIALIZER = new Gson();
    public static Gson c() { return SERIALIZER; }
    public static Gson d() { return SERIALIZER; }
    public static final class Gson {
        public String i(Object model) { return exported; }
        public Object c(String json, Class<?> model) throws Exception { imported = json; return model.getConstructor().newInstance(); }
    }
}
