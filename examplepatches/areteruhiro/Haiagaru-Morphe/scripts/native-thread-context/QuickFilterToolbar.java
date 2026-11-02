package app.morphe.extension.chmate;
final class QuickFilterToolbar {
    static Object findResponseViewModel(Object fragment)throws Exception {
        return NativeFields.find(fragment.getClass(),"model").get(fragment);
    }
}
