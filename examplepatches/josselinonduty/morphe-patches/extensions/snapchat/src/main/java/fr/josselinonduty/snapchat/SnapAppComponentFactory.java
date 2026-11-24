package fr.josselinonduty.snapchat;

import android.app.AppComponentFactory;
import android.app.Application;
import android.app.Activity;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentProvider;
import android.content.Intent;
import android.content.pm.ApplicationInfo;

/** Installs the signature spoof before Snapchat providers or native code initialize. */
public final class SnapAppComponentFactory extends AppComponentFactory {
    private static final String ORIGINAL_FACTORY =
            "com.snap.ms.notification.slimprocess.SlimPushAppComponentFactory";

    static {
        SignatureSpoof.install();
    }

    private final AppComponentFactory delegate;

    public SnapAppComponentFactory() {
        try {
            delegate = (AppComponentFactory) Class.forName(ORIGINAL_FACTORY)
                    .getDeclaredConstructor()
                    .newInstance();
        } catch (ReflectiveOperationException error) {
            throw new ExceptionInInitializerError(error);
        }
    }

    @Override
    public ClassLoader instantiateClassLoader(ClassLoader classLoader, ApplicationInfo info) {
        return delegate.instantiateClassLoader(classLoader, info);
    }

    @Override
    public Application instantiateApplication(ClassLoader classLoader, String className)
            throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        Application app = delegate.instantiateApplication(classLoader, className);
        Disclaimer.register(app);
        return app;
    }

    @Override
    public Activity instantiateActivity(ClassLoader classLoader, String className, Intent intent)
            throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        return delegate.instantiateActivity(classLoader, className, intent);
    }

    @Override
    public BroadcastReceiver instantiateReceiver(
            ClassLoader classLoader, String className, Intent intent)
            throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        return delegate.instantiateReceiver(classLoader, className, intent);
    }

    @Override
    public Service instantiateService(ClassLoader classLoader, String className, Intent intent)
            throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        return delegate.instantiateService(classLoader, className, intent);
    }

    @Override
    public ContentProvider instantiateProvider(ClassLoader classLoader, String className)
            throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        return delegate.instantiateProvider(classLoader, className);
    }
}
