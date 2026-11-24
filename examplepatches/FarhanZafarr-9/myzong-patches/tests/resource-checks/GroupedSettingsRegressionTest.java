import app.morphe.patcher.patch.*;
import java.io.File;
import java.util.*;

/** Checks the shipped public catalog and the mapping from positive options to internal hide hooks. */
public final class GroupedSettingsRegressionTest {
    static void check(boolean value,String message) { if(!value)throw new AssertionError(message); }
    @SuppressWarnings("unchecked")
    public static void main(String[] args) throws Exception {
        var patches=PatchKt.loadPatchesFromJar(Set.of(new File(args[0])));
        Map<String,Patch<?>> catalog=new TreeMap<>();
        Set<String> categories=new TreeSet<>();
        for(var patch:patches) {
            check(patch.getName()!=null,"Internal patch exposed");
            catalog.put(patch.getName(),patch);
            check(patch.getCategory()!=null && !patch.getCategory().isBlank(),"Missing category: "+patch.getName());
            categories.add(patch.getCategory());
            for(var option:patch.getOptions().values())
                check(option.getTitle()!=null && !option.getTitle().isBlank(),"Missing option label");
        }
        check(catalog.size()==15,"Expected 15 visible patches, got "+catalog.keySet());
        check(categories.size()==6,"Expected six categories: "+categories);
        check(catalog.keySet().containsAll(Set.of("Home sections","Home account cards","Home shortcuts","Header",
            "Bottom navigation","Bundles and Usage","Recharge","Dialogs and drawer","Startup","Launcher icon","Material You theme")),"Missing groups");
        Patch<?> icon=catalog.get("Launcher icon");
        check(!icon.getDefault(),"Original launcher must remain default");
        var variants=icon.getOptions().get("iconVariant");
        check(variants.getValues().equals(Map.of("Light","light","Dark","dark")),"Only Light and Dark icon variants allowed");
        check(!catalog.get("Skip daily reward ad").getDefault(),"Reward bypass remains optional");
        Class<?> settings=Class.forName("app.zonghome.patches.CustomizationSettings");
        Object instance=settings.getField("INSTANCE").get(null);
        var enabled=settings.getMethod("enabled",String.class);
        Set<String> defaultOn=Set.of("hideMatch","hidePrayers","hideFamily","hideStreaks","hidePromotions","hide5g",
            "hideWallet","hideSteps","hideWeather","hideCityOffers","spaceHomeSections","hideOfferCounts","hideSmsCard",
            "hideHomeRecharge","hideMyob","hideBachat","hideZong4u","hideNotifications","hideMenu","hideRefresh",
            "hideSearch","hideGreeting","homeTitle","bundlesShortcut","loanShortcut","iconOnly","hideMore","hideZPlay",
            "bundleControlsToggle","hideBundlePromotions","hideUsageBanner","hideUsagePromotions","hideOnline","hideScratch",
            "hideOnlinePromotions","hideChatbot","hideWhatsAppChannel","hideDrawerExtras","skipIntro","holdStartup","otpPaste");
        Set<String> defaultOff=Set.of("hideTariff","hideLoanButton","hideShortcutCard","leftTitles","freeMbsShortcut",
            "hideNavigation","hideUsage","hideBundles","startOnUsage","skipPersonalDetails");
        int checked=0;
        for(var patch:catalog.values())for(var option:patch.getOptions().values()) {
            if(!defaultOn.contains(option.getKey()) && !defaultOff.contains(option.getKey()))continue;
            check(option.getDescription()!=null && option.getDescription().length()>40 && !option.getDescription().contains("Applied when"),"Generic option description: "+option.getKey());
            boolean expected=defaultOn.contains(option.getKey());
            check(enabled.invoke(instance,option.getKey()).equals(expected),"Default behavior changed: "+option.getKey());
            Option<Boolean> toggle=(Option<Boolean>)option;
            boolean original=toggle.getValue();
            toggle.setValue(!original);
            check(enabled.invoke(instance,option.getKey()).equals(!expected),"Option cannot be reversed: "+option.getKey());
            toggle.setValue(original);checked++;
            check(!option.getTitle().equals(option.getKey()),"Unfriendly option title: "+option.getKey());
        }
        check(checked==defaultOn.size()+defaultOff.size(),"Missing grouped switches");
        System.out.println("PASS: 15 patches, six categories, "+checked+" independently reversible switches, preserved defaults, two icon presets");
    }
}
