/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.shared.utils;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.lang.reflect.Field;

public class ResourceContextTest {
    private static final int STRING_ID = 0x7f140001;

    private static final class AppResources extends Resources {
        AppResources() {
            super(null, null, null);
        }

        @Override
        public int getIdentifier(String name, String type, String packageName) {
            assertEquals("early_string", name);
            assertEquals("string", type);
            assertEquals("anddea.youtube", packageName);
            return STRING_ID;
        }

        @Override
        public String getString(int id) {
            assertEquals(STRING_ID, id);
            return "Application resources";
        }
    }

    private static final class AppContext extends ContextWrapper {
        private final Resources resources = new AppResources();

        AppContext() {
            super(null);
        }

        @Override
        public String getPackageName() {
            return "anddea.youtube";
        }

        @Override
        public Resources getResources() {
            return resources;
        }
    }

    private static final class StartupActivity extends Activity {
        private Context base;

        @Override
        public Context getBaseContext() {
            return base;
        }

        @Override
        public String getPackageName() {
            if (base == null) throw new NullPointerException("Activity.attach has not run");
            return base.getPackageName();
        }

        @Override
        public Resources getResources() {
            if (base == null) throw new NullPointerException("Activity.attach has not run");
            return base.getResources();
        }
    }

    private Context previousContext;
    private Activity previousActivity;
    private boolean previousActivityPreference;
    private Resources previousStringResources;
    private Field stringResources;
    private AppContext application;
    private StartupActivity activity;

    @Before
    public void publishUnattachedActivityAfterApplication() throws Exception {
        previousContext = Utils.context;
        previousActivity = Utils.getActivity();
        previousActivityPreference = ResourceUtils.useActivityContextIfAvailable;
        stringResources = StringRef.class.getDeclaredField("resources");
        stringResources.setAccessible(true);
        previousStringResources = (Resources) stringResources.get(null);
        stringResources.set(null, null);
        application = new AppContext();
        activity = new StartupActivity();
        Utils.context = application;
        Utils.setActivity(activity);
        ResourceUtils.useActivityContextIfAvailable = true;
    }

    @After
    public void restorePublishedContexts() throws Exception {
        Utils.context = previousContext;
        Utils.setActivity(previousActivity);
        ResourceUtils.useActivityContextIfAvailable = previousActivityPreference;
        stringResources.set(null, previousStringResources);
    }

    @Test
    public void unattachedActivityFallsBackForIdentifiersAndStrings() {
        assertSame(application, ResourceUtils.getActivityOrContext());
        assertEquals(STRING_ID, ResourceUtils.getStringIdentifier("early_string"));
        assertEquals(STRING_ID, StringRef.dstr("early_string"));
        assertEquals("Application resources", StringRef.sf("early_string").toString());
    }

    @Test
    public void attachedActivityIsStillPreferred() {
        activity.base = application;
        assertSame(activity, ResourceUtils.getActivityOrContext());
        assertEquals(STRING_ID, StringRef.dstr("early_string"));
    }

    @Test
    public void missingActivityUsesTheApplication() {
        Utils.setActivity(null);
        assertSame(application, ResourceUtils.getActivityOrContext());
    }

    @Test
    public void disabledActivityPreferenceIsPreserved() {
        activity.base = application;
        ResourceUtils.useActivityContextIfAvailable = false;
        assertSame(application, ResourceUtils.getActivityOrContext());
    }
}
