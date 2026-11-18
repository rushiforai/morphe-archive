package patches.maps.gearslip;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** The stable Car App Library wire schema; no duplicate AndroidX classes enter Maps. */
final class CarProtocol {
    static final int VERSION_TRANSACTION = 16777215;
    private CarProtocol() {}

    static Bundle object(String type) {
        Bundle bundle = new Bundle();
        bundle.putInt("tag_class_type", 5);
        bundle.putString("tag_class_name", type);
        return bundle;
    }

    static Bundle primitive(Object value) {
        Bundle bundle = new Bundle();
        bundle.putInt("tag_class_type", 0);
        if (value instanceof Integer) bundle.putInt("tag_value", (Integer) value);
        else if (value instanceof String) bundle.putString("tag_value", (String) value);
        else if (value instanceof Boolean) bundle.putBoolean("tag_value", (Boolean) value);
        else if (value instanceof Long) bundle.putLong("tag_value", (Long)value);
        else if (value instanceof Double) bundle.putDouble("tag_value", (Double)value);
        else throw new IllegalArgumentException("Unsupported protocol primitive");
        return bundle;
    }

    static void field(Bundle bundle, String name, Bundle value) {
        bundle.putBundle(bundle.getString("tag_class_name") + name, value);
    }

    static Bundle member(Bundle bundle, String name) {
        if (bundle == null) throw new IllegalArgumentException("Missing protocol object");
        Bundle value = bundle.getBundle(bundle.getString("tag_class_name") + name);
        if (value == null) throw new IllegalArgumentException("Missing protocol field " + name);
        return value;
    }

    static Surface surface(Bundle container) {
        if (container == null) throw new IllegalArgumentException("Missing surface container");
        // Bundleable omits null object fields. Android Auto legitimately sends a
        // SurfaceContainer whose Surface is absent while changing host layouts.
        Bundle value = container.getBundle(container.getString("tag_class_name") + "mSurface");
        return value == null ? null : value.getParcelable("tag_value");
    }

    static Bundle emptyList() {
        return list(Collections.emptyList());
    }

    static Bundle list(List<Bundle> values) {
        Bundle bundle = new Bundle();
        bundle.putInt("tag_class_type", 4);
        bundle.putParcelableArrayList("tag_value", new ArrayList<>(values));
        return bundle;
    }

    static Bundle text(String value) {
        Bundle text = object("androidx.car.app.model.CarText");
        field(text, "mText", primitive(value));
        field(text, "mSpans", emptyList());
        field(text, "mTextVariants", emptyList());
        field(text, "mSpansForVariants", emptyList());
        return text;
    }

    private static Bundle click(IBinder callback) {
        Bundle delegate = object("androidx.car.app.model.OnClickDelegateImpl");
        field(delegate, "mIsParkedOnly", primitive(false));
        field(delegate, "mListener", interfaceBinder("androidx.car.app.model.IOnClickListener$Stub", callback));
        return delegate;
    }

    static Bundle icon(Bitmap bitmap) {
        return icon(bitmap,true);
    }
    static Bundle icon(Bitmap bitmap,boolean tinted){
        Bundle compat = new Bundle();
        compat.putInt("type", 1); // IconCompat.TYPE_BITMAP, serialized by the public Bundler IMAGE type.
        compat.putParcelable("obj", bitmap);
        compat.putInt("int1", 0); compat.putInt("int2", 0);
        Bundle image = new Bundle(); image.putInt("tag_class_type", 6); image.putBundle("tag_value", compat);
        Bundle icon = object("androidx.car.app.model.CarIcon");
        field(icon, "mType", primitive(1));
        field(icon, "mIcon", image);
        if(tinted){
            Bundle tint = object("androidx.car.app.model.CarColor");
            field(tint, "mType", primitive(1)); // Monochrome controls follow host contrast.
            field(icon, "mTint", tint);
        }
        return icon;
    }

    static Bundle contentRow(String title,List<String> texts,IBinder callback,boolean enabled){
        Bundle row=object("androidx.car.app.model.Row");
        field(row,"mTitle",text(title));List<Bundle> lines=new ArrayList<>();
        for(String line:texts)if(lines.size()<2)lines.add(text(line));
        field(row,"mTexts",list(lines));field(row,"mIsEnabled",primitive(enabled));field(row,"mIsBrowsable",primitive(callback!=null));
        field(row,"mNumericDecoration",primitive(-1));field(row,"mMetadata",object("androidx.car.app.model.Metadata"));
        if(callback!=null)field(row,"mOnClickDelegate",click(callback));return row;
    }
    static Bundle binder(IBinder value) {
        Bundle bundle = new Bundle();
        bundle.putInt("tag_class_type", 9);
        bundle.putBinder("tag_value", value);
        return bundle;
    }

    static Bundle interfaceBinder(String factoryClass, IBinder value) {
        Bundle bundle = new Bundle();
        bundle.putInt("tag_class_type", 1);
        bundle.putString("tag_class_name", factoryClass);
        bundle.putBinder("tag_value", value);
        return bundle;
    }

    static Bundle appInfo() {
        Bundle info = object("androidx.car.app.AppInfo");
        field(info, "mMinCarAppApiLevel", primitive(5));
        field(info, "mLatestCarAppApiLevel", primitive(7));
        field(info, "mLibraryVersion", primitive("Morphe Maps native car adapter"));
        return info;
    }

    static Bundle trip(NativeGuidance.Snapshot value,long now){
        return CarNavigationModels.trip(value,now,false);
    }

    /**
     * Without a failure, Maps' plain map screen: a NavigationTemplate whose required action strip
     * is empty, with no map actions, pan mode or navigation info, because Maps draws all of those.
     * With a failure, an error message naming the actual cause.
     */
    /**
     * The plain map screen with the standard Pan action in its map strip and a pan-mode listener.
     * Hosts send drags, flings and pinches only to a template that offers Pan; on a touchscreen
     * they do not draw the button (Car App Library), so nothing appears over Maps' own UI.
     */
    static Bundle mapTemplate(IBinder panCallback) {
        Bundle result = template(null);
        Bundle template = member(result, "mTemplate");
        Bundle pan = object("androidx.car.app.model.Action");
        field(pan, "mType", primitive(65540)); // Action.TYPE_PAN
        field(pan, "mIsEnabled", primitive(true));
        Bundle icon = object("androidx.car.app.model.CarIcon");
        field(icon, "mType", primitive(7)); // CarIcon.TYPE_PAN
        field(pan, "mIcon", icon);
        Bundle strip = object("androidx.car.app.model.ActionStrip");
        field(strip, "mActions", list(java.util.Collections.singletonList(pan)));
        field(template, "mMapActionStrip", strip);
        Bundle delegate = object("androidx.car.app.navigation.model.PanModeDelegateImpl");
        field(delegate, "mStub", interfaceBinder("androidx.car.app.navigation.model.IPanModeListener$Stub", panCallback));
        field(template, "mPanModeDelegate", delegate);
        return result;
    }

    static Bundle template(Throwable failure) {
        Bundle template;
        if (failure == null) {
            Bundle strip = object("androidx.car.app.model.ActionStrip");
            field(strip, "mActions", emptyList());
            template = object("androidx.car.app.navigation.model.NavigationTemplate");
            field(template, "mActionStrip", strip);
        } else {
            Throwable cause = failure;
            for (int i = 0; i < 8 && cause.getCause() != null && cause.getCause() != cause; i++) cause = cause.getCause();
            String detail = cause.getMessage();
            if (detail == null || detail.trim().isEmpty()) detail = cause.getClass().getSimpleName();
            Bundle text = object("androidx.car.app.model.CarText");
            field(text, "mText", primitive("Google Maps car UI could not start: " + detail));
            field(text, "mSpans", emptyList());
            field(text, "mTextVariants", emptyList());
            field(text, "mSpansForVariants", emptyList());
            template = object("androidx.car.app.model.MessageTemplate");
            field(template, "mMessage", text);
            field(template, "mActionList", emptyList());
        }
        return wrap(template, failure == null ? "morphe-maps-native" : "morphe-maps-error");
    }

    static Bundle searchTemplate(String query, String hint, IBinder callback) {
        return searchTemplate(query,hint,callback,Collections.emptyList());
    }
    static Bundle searchTemplate(String query,String hint,IBinder callback,List<Bundle> rows){
        Bundle delegate = object("androidx.car.app.model.SearchCallbackDelegateImpl");
        field(delegate, "mStubCallback", interfaceBinder("androidx.car.app.model.ISearchCallback$Stub", callback));
        Bundle back = object("androidx.car.app.model.Action");
        field(back, "mType", primitive(65539));
        Bundle items = object("androidx.car.app.model.ItemList");
        field(items, "mItems", list(rows));
        Bundle search = object("androidx.car.app.model.SearchTemplate");
        field(search, "mInitialSearchText", primitive(query));
        field(search, "mSearchHint", primitive(hint));
        field(search, "mSearchCallbackDelegate", delegate);
        field(search, "mShowKeyboardByDefault", primitive(true));
        field(search, "mHeaderAction", back);
        field(search, "mItemList", items);
        return wrap(search, "morphe-maps-input");
    }

    private static Bundle wrap(Bundle template, String id) {
        Bundle wrapper = object("androidx.car.app.model.TemplateWrapper");
        field(wrapper, "mTemplate", template);
        field(wrapper, "mId", primitive(id));
        screenStack(wrapper);
        return wrapper;
    }

    /** Public CAL screen metadata is top first, matching the local Back path: input sits on Maps' map screen. */
    static void screenStack(Bundle wrapper) {
        String id=member(wrapper,"mId").getString("tag_value");
        String type=member(wrapper,"mTemplate").getString("tag_class_name");
        List<Bundle> stack=new ArrayList<>();
        stack.add(templateInfo(type,id));
        if("morphe-maps-input".equals(id))
            stack.add(templateInfo("androidx.car.app.navigation.model.NavigationTemplate","morphe-maps-native"));
        field(wrapper,"mTemplateInfoForScreenStack",list(stack));
    }

    static Bundle templateInfo(String type,String id){
        Bundle info=object("androidx.car.app.model.TemplateInfo");
        Bundle clazz=new Bundle();clazz.putInt("tag_class_type",8);clazz.putString("tag_value",type);
        field(info,"mTemplateClass",clazz);field(info,"mTemplateId",primitive(id));
        return info;
    }

    static Bundle failure(Throwable failure) {
        Bundle response = object("androidx.car.app.FailureResponse");
        int kind = failure instanceof SecurityException ? 4 : failure instanceof IllegalArgumentException ? 3 : 5;
        field(response, "mErrorType", primitive(kind));
        field(response, "mStackTrace", primitive(Log.getStackTraceString(failure)));
        return response;
    }

    static Bundle readBundleable(Parcel data) {
        return data.readInt() == 0 ? null : data.readBundle(CarProtocol.class.getClassLoader());
    }

    static <T> T nullable(Parcel data, Parcelable.Creator<T> creator) {
        return data.readInt() == 0 ? null : creator.createFromParcel(data);
    }

    static boolean basic(String descriptor, int code, Parcel data, Parcel reply) {
        if (code == IBinder.INTERFACE_TRANSACTION) {
            if (reply != null) reply.writeString(descriptor);
            return true;
        }
        data.enforceInterface(descriptor);
        if (code == VERSION_TRANSACTION) {
            if (reply != null) { reply.writeNoException(); reply.writeInt(1); }
            return true;
        }
        return false;
    }

    interface Writer { void write(Parcel parcel); }

    /** Newer hosts use synchronous replies; older Gearslip stubs leave the reply empty. */
    static void send(IBinder target, String descriptor, int transaction, Writer writer) throws RemoteException {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(descriptor);
            writer.write(data);
            if (!target.transact(transaction, data, reply, 0)) throw new RemoteException("Unsupported " + descriptor + " transaction " + transaction);
            if (reply.dataSize() > 0) reply.readException();
        } finally { reply.recycle(); data.recycle(); }
    }

    static void complete(IBinder callback, Bundle value, Throwable error) {
        if (callback == null) return;
        Bundle response = error == null ? value : failure(error);
        try {
            send(callback, "androidx.car.app.IOnDoneCallback", error == null ? 2 : 3, data -> {
                data.writeInt(response == null ? 0 : 1);
                if (response != null) data.writeBundle(response);
            });
        } catch (RemoteException | RuntimeException failure) {
            Log.w("MapsNativeCar", "Car host callback disconnected", failure);
        }
    }
}
