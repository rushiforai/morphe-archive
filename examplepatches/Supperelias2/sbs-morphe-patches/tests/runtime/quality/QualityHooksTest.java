import dev.supperelias2.sbs.morphe.MorpheSettings;
import dev.supperelias2.sbs.morphe.features.QualityHooks;
import java.util.Arrays;
import java.util.List;

public class QualityHooksTest {
    public static class Flow<T> {
        T value;
        Flow(T value) { this.value = value; }
        public T getValue() { return value; }
    }
    public static class Track {
        String label;
        int bitrate;
        public Track(String label, int id, Object group, int index, String language, int bitrate) {
            this.label = label; this.bitrate = bitrate;
        }
        public String getTrack() { return label; }
        public int getBitrate() { return bitrate; }
    }
    public static class BaseParameters { }
    public static class Parameters extends BaseParameters {
        public int maxVideoBitrate = Integer.MAX_VALUE;
        public boolean forceHighestSupportedBitrate;
        public boolean overridesCleared;
        public Builder buildUpon() { return new Builder(this); }
    }
    public static class Builder {
        Parameters result = new Parameters();
        Builder(Parameters previous) {
            result.maxVideoBitrate = previous.maxVideoBitrate;
            result.forceHighestSupportedBitrate = previous.forceHighestSupportedBitrate;
            result.overridesCleared = previous.overridesCleared;
        }
        public Builder setMaxVideoBitrate(int value) { result.maxVideoBitrate = value; return this; }
        public Builder setForceHighestSupportedBitrate(boolean value) { result.forceHighestSupportedBitrate = value; return this; }
        public Builder clearOverridesOfType(int type) { check(type == 2, "video override type"); result.overridesCleared = true; return this; }
        public Parameters build() { return result; }
    }
    public static class Selector {
        Parameters parameters = new Parameters();
        Controller owner;
        int updates;
        public Parameters getParameters() { return parameters; }
        public void setParameters(BaseParameters ignored) { throw new AssertionError("Wrong overload"); }
        public void setParameters(Parameters parameters) {
            this.parameters = parameters;
            check(++updates < 100, "no callback loop");
            QualityHooks.restore(owner);
        }
    }
    public static class Player {
        Selector selector = new Selector();
        Object item = new Object();
        public Selector getTrackSelector() { return selector; }
        public Object getCurrentMediaItem() { return item; }
    }
    public static class ViewModel {
        Player player = new Player();
        String content = "episode-one";
        public Player getPlayer() { return player; }
        public String getContentId$player_googleStoreMobileRelease() { return content; }
    }
    public static class Controller {
        private ViewModel parentViewModel = new ViewModel();
        Flow<List<Track>> tracks = new Flow<>(Arrays.asList(track("3M", 3000000), track("1M", 1000000), track("0.5M", 500000)));
        Flow<Track> selected = new Flow<>(track("Auto", 0));
        int selections;
        Controller() { parentViewModel.player.selector.owner = this; }
        public Flow<List<Track>> getVideoQualityList() { return tracks; }
        public Flow<Track> getSelectedVideoQuality() { return selected; }
        public void videoQualitySelected(Track track) {
            QualityHooks.record(this, track);
            selections++;
            selected.value = track;
            Selector selector = parentViewModel.player.selector;
            selector.setParameters(selector.getParameters().buildUpon().setMaxVideoBitrate(track.bitrate == 0 ? Integer.MAX_VALUE : track.bitrate).build());
        }
    }
    static Track track(String label, int bitrate) { return new Track(label, 0, null, 0, null, bitrate); }
    static void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    public static void main(String[] ignored) {
        Controller controller = new Controller();
        Selector selector = controller.parentViewModel.player.selector;
        QualityHooks.restore(controller);
        check(selector.updates == 0, "default off");
        MorpheSettings.VALUES.put("remember_quality", true);
        MorpheSettings.saveInt("quality_last_bitrate", 1500000);
        QualityHooks.restore(controller);
        check(selector.parameters.maxVideoBitrate == 1500000, "semantic ceiling survives differing renditions");
        check(controller.selected.value.bitrate == 1000000, "current menu rendition matches ceiling");
        check(selector.updates == 2 && controller.selections == 1, "synchronous callback does not recurse");
        QualityHooks.restore(controller);
        check(selector.updates == 2, "same content is applied once");
        controller.videoQualitySelected(track("manual", 500000));
        check(MorpheSettings.getInt("quality_last_bitrate", -1) == 500000, "manual selection remembered");
        check(controller.selections == 2 && selector.parameters.maxVideoBitrate == 500000, "restore cannot overwrite manual selection");
        controller.parentViewModel.content = "episode-two";
        QualityHooks.restore(controller);
        check(controller.selections == 3 && selector.parameters.maxVideoBitrate == 500000, "new content restores remembered bitrate");
        MorpheSettings.saveInt("quality_mode", 2);
        QualityHooks.restore(controller);
        check(selector.parameters.forceHighestSupportedBitrate && selector.parameters.maxVideoBitrate == Integer.MAX_VALUE, "highest uses actual Media3 policy");
        check(selector.parameters.overridesCleared, "highest clears video overrides");
        MorpheSettings.saveInt("quality_mode", 1);
        QualityHooks.restore(controller);
        check(!selector.parameters.forceHighestSupportedBitrate && selector.parameters.maxVideoBitrate == 500000, "leaving highest resets policy");
        controller.videoQualitySelected(track("Auto", 0));
        check(MorpheSettings.getInt("quality_last_bitrate", -1) == 0, "Auto stores zero");
        MorpheSettings.VALUES.put("remember_quality", false);
        QualityHooks.restore(controller);
        check(!selector.parameters.forceHighestSupportedBitrate && selector.parameters.maxVideoBitrate == Integer.MAX_VALUE, "disable restores baseline");
        MorpheSettings.VALUES.put("remember_quality", true);
        MorpheSettings.saveInt("quality_last_bitrate", 2000000);
        controller.parentViewModel.player = new Player();
        controller.parentViewModel.player.selector.owner = controller;
        QualityHooks.restore(controller);
        check(controller.parentViewModel.player.selector.parameters.maxVideoBitrate == 2000000, "replacement player reconfigured");
        System.out.println("PASS quality: default off, semantic bitrate, Auto, manual selection, new content/player, overloads, recursion, highest/reset, disable baseline");
    }
}
