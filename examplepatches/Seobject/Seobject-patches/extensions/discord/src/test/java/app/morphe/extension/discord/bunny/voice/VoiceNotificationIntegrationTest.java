package app.morphe.extension.discord.bunny.voice;

import org.junit.Test;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

public final class VoiceNotificationIntegrationTest {
    enum Type { FILE_UPLOAD, VOICE_CALL }
    enum Priority { DEFAULT }
    enum Icon { DEFAULT }

    public static final class Configuration {
        public static final class Action {
            final String tag;
            final String taskName;
            final String title;
            final Map<String, String> data;
            public Action(String tag, String taskName, String title, Map<String, String> data) {
                this.tag = tag;
                this.taskName = taskName;
                this.title = title;
                this.data = data;
            }
        }
        final String title;
        final String content;
        final Priority priority;
        final Action contentAction;
        final List<Action> auxiliaryActions;
        final Type type;
        final Icon icon;
        final Integer color;
        public Configuration(String title, String content, Priority priority, Action contentAction,
                             List<Action> auxiliaryActions, Type type, Icon icon, Integer color) {
            this.title = title; this.content = content; this.priority = priority;
            this.contentAction = contentAction; this.auxiliaryActions = auxiliaryActions;
            this.type = type; this.icon = icon; this.color = color;
        }
        public String getTitle() { return title; }
        public String getContent() { return content; }
        public Priority getPriority() { return priority; }
        public Action getContentAction() { return contentAction; }
        public List<Action> getAuxiliaryActions() { return auxiliaryActions; }
        public Type getType() { return type; }
        public Icon getIcon() { return icon; }
        public Integer getColor() { return color; }
    }

    @Test public void nonVoiceNotificationIsUntouched() {
        Configuration input = configuration(Type.FILE_UPLOAD);
        assertSame(input, VoiceNotificationIntegration.extendConfiguration(input));
    }

    @Test public void activeVoicePreservesDiscordActionsAndAppendsBunnyControls() {
        Configuration.Action discordAction = new Configuration.Action(
                "discord-existing",
                "DiscordTask",
                "Speaker",
                Collections.emptyMap()
        );
        Configuration output = (Configuration) VoiceNotificationIntegration.extendConfiguration(
                configuration(Type.VOICE_CALL, Collections.singletonList(discordAction))
        );
        assertEquals(4, output.auxiliaryActions.size());
        assertSame(discordAction, output.auxiliaryActions.get(0));
        assertAction(output.auxiliaryActions.get(1), "Mute", "toggle-mute");
        assertAction(output.auxiliaryActions.get(2), "Deafen", "toggle-deafen");
        assertAction(output.auxiliaryActions.get(3), "Disconnect", "disconnect");
    }

    private static Configuration configuration(Type type) {
        return configuration(type, Collections.emptyList());
    }

    private static Configuration configuration(
            Type type,
            List<Configuration.Action> auxiliaryActions
    ) {
        return new Configuration("Call", "Connected", Priority.DEFAULT, null,
                auxiliaryActions, type, Icon.DEFAULT, null);
    }

    private static void assertAction(Configuration.Action action, String title, String operation) {
        assertEquals(title, action.title);
        assertEquals(VoiceNotificationIntegration.HEADLESS_TASK, action.taskName);
        assertEquals(operation, action.data.get(VoiceNotificationIntegration.OPERATION_KEY));
    }
}
