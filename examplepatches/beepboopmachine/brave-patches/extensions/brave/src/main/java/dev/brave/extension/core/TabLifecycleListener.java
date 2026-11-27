package dev.brave.extension.core;

import org.chromium.chrome.browser.tab.Tab;
import org.chromium.content_public.browser.NavigationHandle;

public interface TabLifecycleListener {
    void onActiveTabChanged(Tab tab);
    void onNavigationStarted(Tab tab, NavigationHandle handle);
    void onNavigationFinished(Tab tab, NavigationHandle handle);
    void onTabDestroyed(Tab tab);
}
