package com.android.launcher3;

import ab.h0;
import ah.h;
import ai.i2;
import android.animation.LayoutTransition;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.animation.DecelerateInterpolator;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.view.b;
import androidx.appcompat.widget.Toolbar;
import b.u4;
import c10.a;
import cl.l0;
import com.google.android.gms.internal.consent_sdk.e0;
import e10.b1;
import h6.c1;
import hb.c;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import mc0.d;
import mk.w;
import o9.e3;
import o9.i3;
import o9.j3;
import o9.k3;
import o9.l3;
import o9.m3;
import o9.n2;
import o9.n3;
import o9.o3;
import o9.p3;
import o9.q3;
import o9.r3;
import o9.s3;
import o9.t3;
import o9.u3;
import o9.v3;
import o9.w3;
import o9.x3;
import o9.y2;
import o9.y3;
import o9.z2;
import o9.z3;

/* loaded from: classes2.dex */
public class LauncherWallpaperPickerActivity extends WallpaperCropActivity {
    public static final /* synthetic */ int H = 0;
    public z2 B;
    public WallpaperInfo C;
    public WallpaperInfo E;
    public Uri G;

    /* renamed from: s, reason: collision with root package name */
    public View f20974s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f20975t;

    /* renamed from: u, reason: collision with root package name */
    public n3 f20976u;

    /* renamed from: v, reason: collision with root package name */
    public LinearLayout f20977v;

    /* renamed from: w, reason: collision with root package name */
    public View f20978w;

    /* renamed from: x, reason: collision with root package name */
    public k3 f20979x;

    /* renamed from: y, reason: collision with root package name */
    public b f20980y;

    /* renamed from: z, reason: collision with root package name */
    public o3 f20981z;
    public final ArrayList A = new ArrayList();
    public int D = -1;
    public final ArrayList F = new ArrayList();

    public static void j0(ArrayList arrayList, Resources resources, String str, int i5, boolean z11) throws Resources.NotFoundException {
        for (String str2 : resources.getStringArray(i5)) {
            int identifier = resources.getIdentifier(str2, "drawable", str);
            if (identifier != 0) {
                int identifier2 = resources.getIdentifier(str2 + "_small", "drawable", str);
                if (identifier2 != 0) {
                    arrayList.add(new w3(resources, identifier, resources.getDrawable(identifier2), z11));
                }
            } else {
                mc0.b bVar = d.f76206a;
                bVar.r("Nova.WallpaperPicker");
                bVar.d("Couldn't find wallpaper %s %s", str, str2);
            }
        }
    }

    public static View k0(LayoutInflater layoutInflater, View view, ViewGroup viewGroup, Drawable drawable) {
        if (view == null) {
            view = layoutInflater.inflate(2131624453, viewGroup, false);
        }
        q0((FrameLayout) view);
        ImageView imageView = (ImageView) view.findViewById(2131429173);
        if (drawable != null) {
            imageView.setImageDrawable(drawable);
            drawable.setDither(true);
        }
        return view;
    }

    public static Bitmap l0(Point point, LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, Uri uri, byte[] bArr, int i5, boolean z11) {
        int i11;
        i3 i3Var;
        int i12 = point.x;
        int i13 = point.y;
        if (uri != null) {
            i11 = i5;
            i3Var = new i3(launcherWallpaperPickerActivity, uri, null, i11, i12, i13, false, true, null, 0);
        } else {
            i11 = i5;
            if (bArr != null) {
                i3Var = new i3(i11, i12, i13, bArr);
            } else {
                i3Var = new i3(launcherWallpaperPickerActivity, null, 0, null, i5, i12, i13, false, true, null, 0);
                i11 = i5;
                i12 = i12;
                i13 = i13;
            }
        }
        Point pointB = i3Var.b();
        if (pointB == null || pointB.x == 0 || pointB.y == 0) {
            return null;
        }
        Matrix matrix = new Matrix();
        matrix.setRotate(i11);
        float[] fArr = {pointB.x, pointB.y};
        matrix.mapPoints(fArr);
        fArr[0] = Math.abs(fArr[0]);
        float fAbs = Math.abs(fArr[1]);
        fArr[1] = fAbs;
        i3Var.f79890e = WallpaperCropActivity.b0((int) fArr[0], (int) fAbs, i12, i13, z11);
        if (i3Var.a()) {
            return i3Var.f79897l;
        }
        return null;
    }

    public static void q0(FrameLayout frameLayout) {
        frameLayout.setPadding(0, 0, 0, 0);
        Drawable foreground = frameLayout.getForeground();
        z3 z3Var = new z3();
        z3Var.addLevel(0, 0, foreground);
        z3Var.setLevel(0);
        frameLayout.setForeground(z3Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x01ab  */
    @Override // com.android.launcher3.WallpaperCropActivity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d0() throws Throwable {
        Throwable th2;
        SQLiteDatabase readableDatabase;
        Bitmap thumbnail;
        File[] fileArr;
        int i5;
        int i11;
        String str;
        String str2;
        e0.d0(getWindow(), true, false);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | 1792);
        setContentView(2131624450);
        CropView cropView = (CropView) findViewById(2131427783);
        this.o = cropView;
        cropView.setVisibility(4);
        this.f20978w = findViewById(2131429183);
        this.o.f20943w = new a(this);
        this.f20976u = new n3(this, 0);
        this.f20981z = new o3(this);
        ArrayList arrayList = new ArrayList(24);
        j0(arrayList, getResources(), getPackageName(), 2130903116, false);
        this.f20977v = (LinearLayout) findViewById(2131429175);
        n0(this.f20977v, new b1(this, arrayList), false);
        z2 z2Var = new z2(this);
        this.B = z2Var;
        File file = z2Var.f80290c;
        z2Var.f80289b = new ArrayList();
        Cursor cursor = null;
        try {
            readableDatabase = z2Var.f80288a.getReadableDatabase();
            try {
                Cursor cursorQuery = readableDatabase.query("saved_wallpaper_images", new String[]{"id", "image_thumbnail", "image"}, null, null, null, null, "id DESC", null);
                while (cursorQuery.moveToNext()) {
                    try {
                        Bitmap bitmapDecodeFile = BitmapFactory.decodeFile(new File(file, cursorQuery.getString(1)).getAbsolutePath());
                        if (bitmapDecodeFile != null) {
                            ArrayList arrayList2 = z2Var.f80289b;
                            int i12 = cursorQuery.getInt(0);
                            y2 y2Var = new y2(new File(file, cursorQuery.getString(2)), new BitmapDrawable(bitmapDecodeFile));
                            y2Var.f80262d = i12;
                            arrayList2.add(y2Var);
                        }
                    } catch (Throwable th3) {
                        th2 = th3;
                        cursor = cursorQuery;
                        if (cursor != null) {
                            try {
                                cursor.close();
                            } catch (Exception e3) {
                                e3.printStackTrace();
                            }
                        }
                        if (readableDatabase == null) {
                            throw th2;
                        }
                        try {
                            readableDatabase.close();
                            throw th2;
                        } catch (Exception e11) {
                            e11.printStackTrace();
                            throw th2;
                        }
                    }
                }
                try {
                    cursorQuery.close();
                } catch (Exception e12) {
                    e12.printStackTrace();
                }
                try {
                    readableDatabase.close();
                } catch (Exception e13) {
                    e13.printStackTrace();
                }
                n0(this.f20977v, this.B, true);
                LinearLayout linearLayout = (LinearLayout) findViewById(2131428282);
                n2 n2Var = new n2(this);
                m0(linearLayout, new j3(n2Var, 0));
                n2Var.registerDataSetObserver(new p3(this, linearLayout, n2Var));
                ViewGroup viewGroup = (LinearLayout) findViewById(2131429027);
                n0(viewGroup, new e3(this), false);
                m0(viewGroup, null);
                int color = getResources().getColor(2131101256);
                ViewGroup viewGroup2 = (LinearLayout) findViewById(2131428315);
                FrameLayout frameLayout = (FrameLayout) getLayoutInflater().inflate(2131624452, viewGroup2, false);
                q0(frameLayout);
                viewGroup2.addView(frameLayout, 0);
                int iA = o4.a.a(this, "android.permission.READ_EXTERNAL_STORAGE");
                String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (iA == 0) {
                    Cursor cursorQuery2 = MediaStore.Images.Media.query(getContentResolver(), MediaStore.Images.Media.EXTERNAL_CONTENT_URI, new String[]{"_id", "datetaken"}, null, null, "datetaken DESC".concat(Build.VERSION.SDK_INT >= 30 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : " LIMIT 1"));
                    if (cursorQuery2 != null) {
                        thumbnail = cursorQuery2.moveToNext() ? MediaStore.Images.Thumbnails.getThumbnail(getContentResolver(), cursorQuery2.getInt(0), 1, null) : null;
                        cursorQuery2.close();
                    } else {
                        thumbnail = null;
                    }
                }
                if (thumbnail != null) {
                    ImageView imageView = (ImageView) frameLayout.findViewById(2131429173);
                    imageView.setImageBitmap(thumbnail);
                    imageView.setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
                }
                u3 u3Var = new u3(1);
                frameLayout.setTag(u3Var);
                u3Var.f80263a = frameLayout;
                frameLayout.setOnClickListener(this.f20976u);
                frameLayout.setOnLongClickListener(new q3(this, u3Var));
                ViewGroup viewGroup3 = (LinearLayout) findViewById(2131428315);
                View viewFindViewById = findViewById(2131429177);
                a aVarO = a.o(getApplicationContext().getPackageManager());
                if (aVarO != null) {
                    String str4 = (String) aVarO.f19148b;
                    Resources resources = (Resources) aVarO.f19149c;
                    ViewGroup viewGroup4 = (LinearLayout) findViewById(2131428524);
                    ArrayList arrayList3 = new ArrayList(24);
                    a aVarO2 = a.o(getApplicationContext().getPackageManager());
                    if (aVarO2 != null) {
                        String str5 = (String) aVarO2.f19148b;
                        Resources resources2 = (Resources) aVarO2.f19149c;
                        int identifier = resources2.getIdentifier("partner_wallpapers", "array", str5);
                        if (identifier != 0) {
                            j0(arrayList3, resources2, str5, identifier, true);
                        }
                        int identifier2 = resources2.getIdentifier("system_wallpaper_directory", "string", str5);
                        File file2 = identifier2 != 0 ? new File(resources2.getString(identifier2)) : null;
                        if (file2 != null && file2.isDirectory()) {
                            File[] fileArrListFiles = file2.listFiles();
                            int length = fileArrListFiles.length;
                            int i13 = 0;
                            while (i13 < length) {
                                File file3 = fileArrListFiles[i13];
                                if (file3.isFile()) {
                                    fileArr = fileArrListFiles;
                                    String name = file3.getName();
                                    i5 = length;
                                    int iLastIndexOf = name.lastIndexOf(46);
                                    i11 = i13;
                                    if (iLastIndexOf >= -1) {
                                        String strSubstring = name.substring(iLastIndexOf);
                                        name = name.substring(0, iLastIndexOf);
                                        str = strSubstring;
                                    } else {
                                        str = str3;
                                    }
                                    if (!name.endsWith("_small")) {
                                        str2 = str3;
                                        Bitmap bitmapDecodeFile2 = BitmapFactory.decodeFile(new File(file2, u4.m(name, "_small", str)).getAbsolutePath());
                                        if (bitmapDecodeFile2 != null) {
                                            arrayList3.add(new t3(file3, new BitmapDrawable(bitmapDecodeFile2)));
                                        }
                                    }
                                    i13 = i11 + 1;
                                    fileArrListFiles = fileArr;
                                    length = i5;
                                    str3 = str2;
                                } else {
                                    fileArr = fileArrListFiles;
                                    i5 = length;
                                    i11 = i13;
                                }
                                str2 = str3;
                                i13 = i11 + 1;
                                fileArrListFiles = fileArr;
                                length = i5;
                                str3 = str2;
                            }
                        }
                    }
                    n0(viewGroup4, new b1(this, arrayList3), false);
                    m0(viewGroup4, null);
                    if (arrayList3.size() > 0) {
                        FrameLayout frameLayout2 = (FrameLayout) getLayoutInflater().inflate(2131624456, viewGroup3, false);
                        q0(frameLayout2);
                        viewGroup3.addView(frameLayout2, 1);
                        TextView textView = (TextView) frameLayout2.findViewById(2131429174);
                        int identifier3 = resources.getIdentifier("partner_wallpaper_tile_label", "string", str4);
                        textView.setText(identifier3 != 0 ? resources.getString(identifier3) : null);
                        int identifier4 = resources.getIdentifier("partner_wallpaper_tile_icon", "drawable", str4);
                        textView.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, identifier4 != 0 ? resources.getDrawable(identifier4) : null, (Drawable) null, (Drawable) null);
                        s3 s3Var = new s3(viewFindViewById, findViewById(2131429180));
                        frameLayout2.setTag(s3Var);
                        s3Var.f80263a = frameLayout2;
                        frameLayout2.setOnClickListener(this.f20976u);
                        ImageView imageView2 = (ImageView) frameLayout2.findViewById(2131429173);
                        int identifier5 = resources.getIdentifier("partner_wallpaper_tile_background", "drawable", str4);
                        if (identifier5 == 0) {
                            identifier5 = resources.getIdentifier("partner_wallpaper_tile_background", "color", str4);
                        }
                        Drawable drawable = identifier5 != 0 ? resources.getDrawable(identifier5) : null;
                        imageView2.setImageDrawable(drawable);
                        if (!(drawable instanceof ColorDrawable)) {
                            imageView2.setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
                        }
                    }
                }
                ViewGroup viewGroup5 = (LinearLayout) findViewById(2131428991);
                FrameLayout frameLayout3 = (FrameLayout) getLayoutInflater().inflate(2131624455, viewGroup5, false);
                q0(frameLayout3);
                viewGroup5.addView(frameLayout3, 0);
                v3 v3Var = new v3(viewFindViewById, findViewById(2131429179), n2Var);
                frameLayout3.setTag(v3Var);
                v3Var.f80263a = frameLayout3;
                frameLayout3.setOnClickListener(this.f20976u);
                ((ImageView) frameLayout3.findViewById(2131429173)).setImageDrawable(new ColorDrawable(-8563007));
                FrameLayout frameLayout4 = (FrameLayout) getLayoutInflater().inflate(2131624457, viewGroup5, false);
                q0(frameLayout4);
                viewGroup5.addView(frameLayout4, 0);
                s3 s3Var2 = new s3(viewFindViewById, findViewById(2131429178));
                frameLayout4.setTag(s3Var2);
                s3Var2.f80263a = frameLayout4;
                frameLayout4.setOnClickListener(this.f20976u);
                ((ImageView) frameLayout4.findViewById(2131429173)).setImageDrawable(new ColorDrawable(-24832));
                this.F.add(viewFindViewById);
                this.o.addOnLayoutChangeListener(new h0(this, 3));
                s0();
                HorizontalScrollView horizontalScrollView = (HorizontalScrollView) findViewById(2131429177);
                if (horizontalScrollView.getLayoutDirection() == 1) {
                    horizontalScrollView.getViewTreeObserver().addOnGlobalLayoutListener(new l3(this, horizontalScrollView));
                }
                LayoutTransition layoutTransition = new LayoutTransition();
                layoutTransition.setDuration(200L);
                layoutTransition.setStartDelay(1, 0L);
                layoutTransition.setAnimator(3, null);
                this.f20977v.setLayoutTransition(layoutTransition);
                setSupportActionBar((Toolbar) findViewById(2131429059));
                getSupportActionBar().n();
                getSupportActionBar().r(16);
                getSupportActionBar().w(2132020330);
                View viewFindViewById2 = findViewById(2131428813);
                this.f20988p = viewFindViewById2;
                viewFindViewById2.setOnClickListener(new n3(this, 1));
                this.f20979x = new k3(this);
            } catch (Throwable th4) {
                th2 = th4;
            }
        } catch (Throwable th5) {
            th2 = th5;
            readableDatabase = null;
        }
    }

    @Override // com.android.launcher3.WallpaperCropActivity
    public final void g0(c cVar, boolean z11, boolean z12, Runnable runnable) {
        super.g0(cVar, z11, z12, new w((Object) this, (Object) runnable, false, 10));
    }

    public final void i0(boolean z11, Uri uri) throws Resources.NotFoundException {
        this.A.add(uri);
        FrameLayout frameLayout = (FrameLayout) getLayoutInflater().inflate(2131624453, (ViewGroup) this.f20977v, false);
        frameLayout.setVisibility(8);
        q0(frameLayout);
        this.f20977v.addView(frameLayout, 0);
        ImageView imageView = (ImageView) frameLayout.findViewById(2131429173);
        Resources resources = getResources();
        new m3(this, this, uri, new Point(resources.getDimensionPixelSize(2131166540), resources.getDimensionPixelSize(2131166539)), imageView, frameLayout).execute(new Void[0]);
        x3 x3Var = new x3();
        x3Var.f80248d = true;
        x3Var.f80247c = uri;
        frameLayout.setTag(x3Var);
        x3Var.f80263a = frameLayout;
        frameLayout.setOnLongClickListener(this.f20981z);
        s0();
        frameLayout.setOnClickListener(this.f20976u);
        if (z11) {
            return;
        }
        this.f20976u.onClick(frameLayout);
    }

    public final void m0(ViewGroup viewGroup, Runnable runnable) {
        FrameLayout frameLayout = (FrameLayout) getLayoutInflater().inflate(2131624451, viewGroup, false);
        q0(frameLayout);
        viewGroup.addView(frameLayout, 0);
        u3 u3Var = new u3(0);
        frameLayout.setTag(u3Var);
        u3Var.f80263a = frameLayout;
        if (runnable != null) {
            frameLayout.setOnClickListener(new h(this, runnable, 2));
        } else {
            frameLayout.setOnClickListener(this.f20976u);
        }
    }

    public final void n0(ViewGroup viewGroup, BaseAdapter baseAdapter, boolean z11) {
        for (int i5 = 0; i5 < baseAdapter.getCount(); i5++) {
            View view = (FrameLayout) baseAdapter.getView(i5, null, viewGroup);
            viewGroup.addView(view, i5);
            y3 y3Var = (y3) baseAdapter.getItem(i5);
            view.setTag(y3Var);
            y3Var.f80263a = view;
            if (z11) {
                view.setOnLongClickListener(this.f20981z);
            }
            view.setOnClickListener(this.f20976u);
        }
    }

    public final void o0(View view) {
        View view2 = this.f20974s;
        if (view2 != null) {
            view2.setSelected(false);
            this.f20974s = null;
        }
        this.f20974s = view;
        view.setSelected(true);
        this.D = this.f20977v.indexOfChild(view);
        view.announceForAccessibility(getString(2132017472, view.getContentDescription()));
    }

    @Override // androidx.fragment.app.m0, g.o, android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) throws Resources.NotFoundException {
        super.onActivityResult(i5, i11, intent);
        if (i5 == 5 && i11 == -1) {
            if (intent == null || intent.getData() == null) {
                return;
            }
            Uri data = intent.getData();
            if (!l0.J(data) || o4.a.a(this, "android.permission.READ_EXTERNAL_STORAGE") == 0) {
                i0(false, data);
                return;
            } else {
                this.G = data;
                requestPermissions(new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, 0);
                return;
            }
        }
        if (i5 == 6) {
            setResult(-1);
            finish();
            return;
        }
        if (i5 == 7) {
            WallpaperManager wallpaperManager = WallpaperManager.getInstance(this);
            WallpaperInfo wallpaperInfo = this.C;
            WallpaperInfo wallpaperInfo2 = this.E;
            WallpaperInfo wallpaperInfo3 = wallpaperManager.getWallpaperInfo();
            if (wallpaperInfo3 != null) {
                if (wallpaperInfo == null || !wallpaperInfo.getComponent().equals(wallpaperInfo3.getComponent()) || wallpaperInfo2.getComponent().equals(wallpaperInfo.getComponent())) {
                    setResult(-1);
                    finish();
                }
            }
        }
    }

    @Override // g.o, android.app.Activity
    public final void onBackPressed() {
        ArrayList arrayList = this.F;
        if (arrayList.size() <= 1) {
            super.onBackPressed();
            return;
        }
        View view = (View) c1.l(arrayList, 2);
        View view2 = (View) c1.l(arrayList, 1);
        r3 r3Var = new r3(view);
        view.setAlpha(0.0f);
        ViewPropertyAnimator duration = view.animate().alpha(1.0f).setDuration(300L);
        DecelerateInterpolator decelerateInterpolator = zx.d.f98808d;
        duration.setInterpolator(decelerateInterpolator).setListener(r3Var).start();
        r3 r3Var2 = new r3(view2);
        view2.setAlpha(1.0f);
        view2.animate().alpha(0.0f).setDuration(300L).setInterpolator(decelerateInterpolator).setListener(r3Var2).start();
        arrayList.remove(arrayList.size() - 1);
    }

    @Override // com.android.launcher3.WallpaperCropActivity, androidx.fragment.app.m0, g.o, android.app.Activity
    public final void onRequestPermissionsResult(int i5, String[] strArr, int[] iArr) throws Resources.NotFoundException {
        mc0.b bVar = d.f76206a;
        bVar.r("Nova.WallpaperPicker");
        bVar.m("onRequestPermissionResult %d %s %s", Integer.valueOf(i5), Arrays.toString(strArr), Arrays.toString(iArr));
        if (i5 != 0) {
            super.onRequestPermissionsResult(i5, strArr, iArr);
            return;
        }
        if (iArr[0] != 0) {
            Toast.makeText(this, "Permission denied", 0).show();
            return;
        }
        Uri uri = this.G;
        if (uri != null) {
            i0(false, uri);
        }
    }

    @Override // android.app.Activity
    public final void onRestoreInstanceState(Bundle bundle) throws Resources.NotFoundException {
        Iterator it = bundle.getParcelableArrayList("TEMP_WALLPAPER_TILES").iterator();
        while (it.hasNext()) {
            i0(true, (Uri) it.next());
        }
        this.D = bundle.getInt("SELECTED_INDEX", -1);
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelableArrayList("TEMP_WALLPAPER_TILES", this.A);
        bundle.putInt("SELECTED_INDEX", this.D);
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        super.onStop();
        View viewFindViewById = findViewById(2131429183);
        this.f20978w = viewFindViewById;
        if (viewFindViewById.getAlpha() < 1.0f) {
            this.f20978w.setAlpha(1.0f);
            this.f20978w.setVisibility(0);
        }
    }

    public final void p0(boolean z11) {
        if (z11) {
            int i5 = z11 ? 1048576 : 0;
            if (i5 != (getWindow().getAttributes().flags & 1048576)) {
                getWindow().setFlags(i5, 1048576);
            }
        } else {
            this.o.setVisibility(0);
        }
        this.o.postDelayed(new i2(this, z11), 200L);
    }

    public final void r0(int i5, Intent intent) {
        try {
            startActivityForResult(intent, i5);
        } catch (ActivityNotFoundException unused) {
            Toast.makeText(this, 2132017222, 0).show();
        } catch (SecurityException e3) {
            Toast.makeText(this, 2132017222, 0).show();
            mc0.b bVar = d.f76206a;
            bVar.r("Nova.WallpaperPicker");
            bVar.p(e3, "Launcher does not have the permission to launch. Make sure to create a MAIN intent-filter for the corresponding activity or use the exported attribute for this activity; intent='%s'", intent);
        } catch (Exception e11) {
            Toast.makeText(this, 2132017222, 0).show();
            e11.printStackTrace();
        }
    }

    public final void s0() throws Resources.NotFoundException {
        LinearLayout linearLayout;
        int childCount;
        int i5;
        LinearLayout linearLayout2 = (LinearLayout) findViewById(2131428315);
        int childCount2 = linearLayout2.getChildCount();
        Resources resources = getResources();
        int i11 = 0;
        for (int i12 = 0; i12 < 2; i12++) {
            int i13 = 0;
            for (int i14 = 0; i14 < childCount2; i14++) {
                View childAt = linearLayout2.getChildAt(i14);
                if (childAt.getTag() instanceof y3) {
                    i5 = i14;
                    childCount = i14 + 1;
                    linearLayout = linearLayout2;
                } else {
                    linearLayout = (LinearLayout) childAt;
                    childCount = linearLayout.getChildCount();
                    i5 = 0;
                }
                while (i5 < childCount) {
                    y3 y3Var = (y3) linearLayout.getChildAt(i5).getTag();
                    if (y3Var.a()) {
                        if (i12 == 0) {
                            i11++;
                        } else {
                            i13++;
                            String string = resources.getString(2132020326, Integer.valueOf(i13), Integer.valueOf(i11));
                            if (y3Var.a()) {
                                y3Var.f80263a.setContentDescription(string);
                            }
                        }
                    }
                    i5++;
                }
            }
        }
    }
}
