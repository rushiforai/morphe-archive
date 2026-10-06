package app.morphe.extension.shared.settings;
import java.util.Locale;
/** N33 JVM signature fixture authored from the planner's original 1.45.0 DEX. ART uses real classes. */
public enum AppLanguage {
    DEFAULT("en"), EN("en"), HANS("zh-Hans-CN"), HANT("zh-Hant-TW"), ES("es"), FR("fr"), DE("de"), PT("pt"), RU("ru"), JA("ja"), KO("ko"), AR("ar"), HI("hi"), ID("id"), VI("vi");
    private final Locale locale;
    AppLanguage(String tag){locale=Locale.forLanguageTag(tag);}
    public Locale getLocale(){return this==DEFAULT?Locale.getDefault():locale;}
}
