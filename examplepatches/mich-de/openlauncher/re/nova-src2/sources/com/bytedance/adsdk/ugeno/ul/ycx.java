package com.bytedance.adsdk.ugeno.ul;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.Scroller;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.adsdk.ugeno.jw.sya;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public abstract class ycx<T> extends FrameLayout implements sya.dj {

    /* renamed from: av, reason: collision with root package name */
    private static final Interpolator f22503av = new Interpolator() { // from class: com.bytedance.adsdk.ugeno.ul.ycx.1
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float f11) {
            float f12 = f11 - 1.0f;
            return (f12 * f12 * f12 * f12 * f12) + 1.0f;
        }
    };
    private final Runnable aeu;
    private boolean bhi;

    /* renamed from: dj, reason: collision with root package name */
    private int f22504dj;

    /* renamed from: dv, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.ul.ycx.ycx f22505dv;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f22506dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f22507ea;
    private int fby;

    /* renamed from: hf, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.ul.sya f22508hf;
    private int htf;

    /* renamed from: jc, reason: collision with root package name */
    private int f22509jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22510jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f22511lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private float f22512ok;
    private C0020ycx oty;
    private boolean pmi;
    private final Runnable rmf;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f22513ry;
    protected Context sya;
    private boolean syc;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private FrameLayout f22514tn;
    private Scroller tru;

    /* renamed from: uh, reason: collision with root package name */
    private int f22515uh;

    /* renamed from: ul, reason: collision with root package name */
    private int f22516ul;
    private boolean wie;
    private int wwx;
    private boolean xkz;
    protected List<T> ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.jw.sya f22517zb;

    public class sya extends com.bytedance.adsdk.ugeno.jw.sya {
        public sya(Context context) {
            super(context);
        }

        private MotionEvent ycx(MotionEvent motionEvent) {
            float width = getWidth();
            float height = getHeight();
            motionEvent.setLocation((motionEvent.getY() / height) * width, (motionEvent.getX() / width) * height);
            return motionEvent;
        }

        @Override // com.bytedance.adsdk.ugeno.jw.sya, android.view.ViewGroup
        public boolean onInterceptTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
            if (!ycx.this.f22506dy) {
                return false;
            }
            try {
                if (ycx.this.wwx != 1) {
                    return super.onInterceptTouchEvent(motionEvent);
                }
                boolean zOnInterceptTouchEvent = super.onInterceptTouchEvent(ycx(motionEvent));
                ycx(motionEvent);
                return zOnInterceptTouchEvent;
            } catch (IllegalArgumentException unused) {
                return false;
            }
        }

        @Override // com.bytedance.adsdk.ugeno.jw.sya, android.view.View
        public boolean onTouchEvent(MotionEvent motionEvent) {
            if (!ycx.this.f22506dy) {
                return false;
            }
            try {
                return ycx.this.wwx == 1 ? super.onTouchEvent(ycx(motionEvent)) : super.onTouchEvent(motionEvent);
            } catch (IllegalArgumentException unused) {
                return false;
            }
        }
    }

    /* renamed from: com.bytedance.adsdk.ugeno.ul.ycx$ycx, reason: collision with other inner class name */
    public class C0020ycx extends com.bytedance.adsdk.ugeno.jw.zb {
        public C0020ycx() {
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public int ycx(Object obj) {
            return -2;
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public boolean ycx(View view, Object obj) {
            return view == obj;
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public int ycx() {
            if (ycx.this.syc) {
                return 1024;
            }
            return ycx.this.ycx.size();
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public Object ycx(ViewGroup viewGroup, int i5) {
            View viewYcx = ycx.this.ycx(i5, dj.ycx(ycx.this.syc, i5, ycx.this.ycx.size()));
            viewGroup.addView(viewYcx);
            return viewYcx;
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public void ycx(ViewGroup viewGroup, int i5, Object obj) {
            viewGroup.removeView((View) obj);
        }

        @Override // com.bytedance.adsdk.ugeno.jw.zb
        public float ycx(int i5) {
            if (ycx.this.f22512ok <= 0.0f) {
                return 1.0f;
            }
            return 1.0f / ycx.this.f22512ok;
        }
    }

    public class zb extends Scroller {
        public zb(Context context, Interpolator interpolator) {
            super(context, interpolator);
        }

        @Override // android.widget.Scroller
        public void startScroll(int i5, int i11, int i12, int i13, int i14) {
            super.startScroll(i5, i11, i12, i13, ycx.this.f22516ul);
        }

        @Override // android.widget.Scroller
        public void startScroll(int i5, int i11, int i12, int i13) {
            super.startScroll(i5, i11, i12, i13, ycx.this.f22516ul);
        }
    }

    public ycx(Context context) {
        super(context);
        this.ycx = new CopyOnWriteArrayList();
        this.f22504dj = -1;
        this.lud = 2000;
        this.f22511lt = 500;
        this.f22516ul = 500;
        this.fby = 0;
        this.f22510jw = -1;
        this.f22509jc = -1;
        this.f22507ea = "normal";
        this.f22512ok = 1.0f;
        this.f22513ry = true;
        this.xkz = true;
        this.syc = true;
        this.f22506dy = true;
        this.f22515uh = 0;
        this.htf = 0;
        this.thx = 0;
        this.wwx = 0;
        this.bhi = true;
        this.rmf = new Runnable() { // from class: com.bytedance.adsdk.ugeno.ul.ycx.2
            @Override // java.lang.Runnable
            public void run() throws Resources.NotFoundException {
                int currentItem = ycx.this.f22517zb.getCurrentItem() + 1;
                if (ycx.this.syc) {
                    if (currentItem >= 1024) {
                        ycx.this.f22517zb.ycx(EventBridgeChannel.QUEUE_CAPACITY, false);
                        return;
                    } else {
                        ycx.this.f22517zb.ycx(currentItem, true);
                        return;
                    }
                }
                com.bytedance.adsdk.ugeno.jw.zb adapter = ycx.this.f22517zb.getAdapter();
                if (adapter != null) {
                    if (currentItem >= adapter.ycx()) {
                        ycx.this.f22517zb.ycx(0, false);
                    } else {
                        ycx.this.f22517zb.ycx(currentItem, true);
                    }
                }
            }
        };
        this.aeu = new Runnable() { // from class: com.bytedance.adsdk.ugeno.ul.ycx.3
            @Override // java.lang.Runnable
            public void run() throws Resources.NotFoundException {
                if (ycx.this.xkz) {
                    ycx.this.bhi = false;
                    int currentItem = ycx.this.f22517zb.getCurrentItem() + 1;
                    if (ycx.this.syc) {
                        if (currentItem >= 1024) {
                            ycx.this.f22517zb.ycx(EventBridgeChannel.QUEUE_CAPACITY, false);
                        } else {
                            ycx.this.f22517zb.ycx(currentItem, true);
                        }
                        ycx ycxVar = ycx.this;
                        ycxVar.postDelayed(ycxVar.aeu, ycx.this.lud);
                        return;
                    }
                    com.bytedance.adsdk.ugeno.jw.zb adapter = ycx.this.f22517zb.getAdapter();
                    if (adapter != null) {
                        if (currentItem >= adapter.ycx()) {
                            ycx.this.f22517zb.ycx(0, false);
                            ycx ycxVar2 = ycx.this;
                            ycxVar2.postDelayed(ycxVar2.aeu, ycx.this.lud);
                        } else {
                            ycx.this.f22517zb.ycx(currentItem, true);
                            ycx ycxVar3 = ycx.this;
                            ycxVar3.postDelayed(ycxVar3.aeu, ycx.this.lud);
                        }
                    }
                }
            }
        };
        this.sya = context;
        this.f22514tn = new FrameLayout(context);
        this.f22517zb = ycx();
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        this.f22514tn.addView(this.f22517zb, layoutParams);
        addView(this.f22514tn);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (this.xkz) {
            int action = motionEvent.getAction();
            if (action == 1 || action == 3 || action == 4) {
                if (!this.wie) {
                    lud();
                }
            } else if (action == 0) {
                lt();
            }
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    public abstract View ea(int i5);

    public com.bytedance.adsdk.ugeno.jw.zb getAdapter() {
        return this.f22517zb.getAdapter();
    }

    public int getCurrentItem() {
        return this.f22517zb.getCurrentItem();
    }

    public com.bytedance.adsdk.ugeno.jw.sya getViewPager() {
        return this.f22517zb;
    }

    public ycx jc(int i5) throws Resources.NotFoundException {
        this.f22509jc = i5;
        ycx(this.f22507ea, this.fby, this.f22510jw, i5, true);
        return this;
    }

    public ycx<T> jw(int i5) throws Resources.NotFoundException {
        this.f22510jw = i5;
        ycx(this.f22507ea, this.fby, i5, this.f22509jc, true);
        return this;
    }

    @Override // com.bytedance.adsdk.ugeno.jw.sya.dj
    public void ok(int i5) {
        int i11;
        if (this.f22508hf != null) {
            int iYcx = dj.ycx(this.syc, i5, this.ycx.size());
            i11 = i5;
            this.f22508hf.ycx(this.syc, iYcx, i11, iYcx == 0, iYcx == this.ycx.size() - 1);
        } else {
            i11 = i5;
        }
        if (this.f22513ry) {
            this.f22505dv.ycx(i11);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.jw.sya.dj
    public void ry(int i5) {
        if (i5 == 1 && this.wie) {
            lt();
        }
        com.bytedance.adsdk.ugeno.ul.sya syaVar = this.f22508hf;
        if (syaVar != null) {
            syaVar.ycx(this.syc, i5);
        }
    }

    public void setOnPageChangeListener(com.bytedance.adsdk.ugeno.ul.sya syaVar) {
        this.f22508hf = syaVar;
    }

    public void setTwoItems(boolean z11) {
        this.pmi = z11;
    }

    public void xkz(int i5) throws Resources.NotFoundException {
        ycx(this.f22507ea, this.fby, this.f22510jw, this.f22509jc, true);
        if (this.oty == null) {
            this.oty = new C0020ycx();
            this.f22517zb.ycx((sya.dj) this);
            this.f22517zb.setAdapter(this.oty);
        }
        if (this.syc) {
            if (i5 >= 1024) {
                this.f22517zb.ycx(EventBridgeChannel.QUEUE_CAPACITY, false);
                return;
            } else {
                this.f22517zb.ycx(i5, true);
                return;
            }
        }
        if (i5 < 0 || i5 >= this.ycx.size()) {
            return;
        }
        this.f22517zb.ycx(i5, true);
    }

    public ycx dj(float f11) {
        this.f22505dv.setIndicatorY(f11);
        return this;
    }

    public ycx fby(int i5) throws Resources.NotFoundException {
        this.fby = i5;
        ycx(this.f22507ea, i5, this.f22510jw, this.f22509jc, true);
        return this;
    }

    public ycx lt(int i5) {
        this.f22505dv.setSelectedColor(i5);
        return this;
    }

    public ycx lud(int i5) {
        if (i5 < 0) {
            i5 = this.lud;
        }
        this.f22504dj = i5;
        lud();
        return this;
    }

    public ycx sya(float f11) {
        this.f22505dv.setIndicatorX(f11);
        return this;
    }

    public ycx ul(int i5) {
        this.f22505dv.setUnSelectedColor(i5);
        return this;
    }

    public ycx zb(float f11) {
        this.f22505dv.setIndicatorHeight((int) f11);
        return this;
    }

    private boolean ul() {
        return this.ycx.size() <= 2 && this.syc;
    }

    public ycx dj(int i5) {
        this.lud = i5;
        lud();
        return this;
    }

    public void lt() {
        removeCallbacks(this.aeu);
    }

    public ycx sya(int i5) {
        this.f22516ul = i5;
        if (this.tru == null) {
            this.tru = new zb(this.sya, f22503av);
        }
        this.f22517zb.setScroller(this.tru);
        return this;
    }

    public com.bytedance.adsdk.ugeno.jw.sya ycx() {
        return new sya(getContext());
    }

    public ycx zb() {
        this.f22505dv.ycx();
        return this;
    }

    public ycx ycx(String str) {
        if (TextUtils.equals(str, "rectangle")) {
            this.f22505dv = new com.bytedance.adsdk.ugeno.ul.ycx.sya(this.sya);
        } else {
            this.f22505dv = new com.bytedance.adsdk.ugeno.ul.ycx.zb(this.sya);
        }
        addView(this.f22505dv, new FrameLayout.LayoutParams(-2, -2));
        return this;
    }

    public ycx zb(String str) {
        this.f22505dv.setIndicatorDirection(str);
        return this;
    }

    public ycx dj(boolean z11) throws Resources.NotFoundException {
        this.f22505dv.setLoop(z11);
        if (this.syc != z11) {
            int iYcx = dj.ycx(z11, this.f22517zb.getCurrentItem(), this.ycx.size());
            this.syc = z11;
            C0020ycx c0020ycx = this.oty;
            if (c0020ycx != null) {
                c0020ycx.sya();
                this.f22517zb.setCurrentItem(iYcx);
            }
        }
        return this;
    }

    public ycx lud(float f11) {
        this.f22512ok = f11;
        return this;
    }

    public ycx zb(int i5) {
        this.f22511lt = i5;
        return this;
    }

    public ycx lud(boolean z11) {
        this.wie = z11;
        return this;
    }

    public ycx zb(boolean z11) {
        this.f22506dy = z11;
        return this;
    }

    public void lud() {
        int i5;
        removeCallbacks(this.aeu);
        int i11 = this.lud;
        if (this.bhi && (i5 = this.f22504dj) > 0) {
            i11 = i5;
        }
        postDelayed(this.aeu, i11);
    }

    public ycx sya(boolean z11) {
        this.f22513ry = z11;
        return this;
    }

    public ycx sya(String str) throws Resources.NotFoundException {
        this.f22507ea = str;
        ycx(str, this.fby, this.f22510jw, this.f22509jc, true);
        return this;
    }

    public ycx ycx(float f11) {
        this.f22505dv.setIndicatorWidth((int) f11);
        return this;
    }

    public ycx ycx(int i5) {
        this.wwx = i5;
        return this;
    }

    public void sya() throws Resources.NotFoundException {
        int i5;
        ycx(this.f22507ea, this.fby, this.f22510jw, this.f22509jc, true);
        if (this.oty == null) {
            this.oty = new C0020ycx();
            this.f22517zb.ycx((sya.dj) this);
            this.f22517zb.setAdapter(this.oty);
        }
        int i11 = this.f22515uh;
        if (i11 < 0 || i11 >= this.ycx.size()) {
            this.f22515uh = 0;
        }
        if (this.syc) {
            i5 = this.f22515uh + EventBridgeChannel.QUEUE_CAPACITY;
        } else {
            i5 = this.f22515uh;
        }
        this.f22517zb.ycx(i5, true);
        if (!this.syc) {
            ok(i5);
        }
        if (this.xkz) {
            lud();
        }
    }

    public ycx ycx(boolean z11) {
        this.xkz = z11;
        lud();
        return this;
    }

    public void dj() throws Resources.NotFoundException {
        lt();
        if (this.oty != null) {
            this.f22517zb.zb((sya.dj) this);
            this.f22517zb.setAdapter(null);
            this.oty = null;
            this.f22517zb.removeAllViews();
            this.ycx.clear();
            this.f22505dv.sya();
        }
    }

    public void ycx(String str, int i5, int i11, int i12, boolean z11) throws Resources.NotFoundException {
        C0020ycx c0020ycx = this.oty;
        if (c0020ycx != null) {
            c0020ycx.sya();
        }
        this.f22517zb.setPageMargin(i5);
        if (i11 > 0 || i12 > 0) {
            if (this.wwx == 1) {
                this.f22517zb.setPadding(0, i11 + i5, 0, i12 + i5);
            } else {
                this.f22517zb.setPadding(i11 + i5, 0, i12 + i5, 0);
            }
            this.f22514tn.setClipChildren(false);
            this.f22517zb.setClipChildren(false);
            this.f22517zb.setClipToPadding(false);
        }
        if (this.wwx == 1) {
            com.bytedance.adsdk.ugeno.ul.zb.dj djVar = new com.bytedance.adsdk.ugeno.ul.zb.dj();
            djVar.ycx(str);
            this.f22517zb.ycx(true, (sya.lud) djVar);
            this.f22517zb.setOverScrollMode(2);
        } else if (TextUtils.equals(str, "linear")) {
            this.f22517zb.ycx(false, (sya.lud) new com.bytedance.adsdk.ugeno.ul.zb.sya());
        } else if (TextUtils.equals(str, "cube")) {
            this.f22517zb.ycx(false, (sya.lud) new com.bytedance.adsdk.ugeno.ul.zb.ycx());
        } else if (TextUtils.equals(str, "fade")) {
            this.f22517zb.ycx(false, (sya.lud) new com.bytedance.adsdk.ugeno.ul.zb.zb());
        } else {
            this.f22517zb.ycx(false, (sya.lud) null);
        }
        this.f22517zb.setOffscreenPageLimit((int) this.f22512ok);
    }

    public View ycx(int i5, int i11) {
        if (this.ycx.size() == 0) {
            return new View(getContext());
        }
        View viewEa = ea(i11);
        FrameLayout frameLayout = new FrameLayout(getContext());
        if (viewEa instanceof ViewGroup) {
            frameLayout.setClipChildren(true);
        }
        if (ul()) {
            viewEa.setTag("two_items_tag");
        }
        if (viewEa.getParent() instanceof ViewGroup) {
            ((ViewGroup) viewEa.getParent()).removeView(viewEa);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        frameLayout.addView(viewEa, layoutParams);
        frameLayout.addView(new View(getContext()), new FrameLayout.LayoutParams(-1, -1));
        if (ul()) {
            frameLayout.setTag(Integer.valueOf(i5));
        }
        return frameLayout;
    }

    public ycx<T> ycx(T t6) {
        if (t6 != null) {
            this.ycx.add(t6);
            if (this.f22513ry) {
                this.f22505dv.zb();
            }
        }
        C0020ycx c0020ycx = this.oty;
        if (c0020ycx != null) {
            c0020ycx.sya();
            this.f22505dv.ycx(this.f22515uh, this.f22517zb.getCurrentItem());
        }
        return this;
    }

    @Override // com.bytedance.adsdk.ugeno.jw.sya.dj
    public void ycx(int i5, float f11, int i11) {
        com.bytedance.adsdk.ugeno.ul.sya syaVar = this.f22508hf;
        if (syaVar != null) {
            boolean z11 = this.syc;
            syaVar.ycx(z11, dj.ycx(z11, i5, this.ycx.size()), f11, i11);
        }
        if (ul()) {
            ycx(i5, findViewWithTag(Integer.valueOf(i5)));
            if (f11 > 0.0f) {
                int i12 = i5 + 1;
                ycx(i12, findViewWithTag(Integer.valueOf(i12)));
            }
        }
    }

    private void ycx(int i5, View view) {
        View viewFindViewWithTag;
        if ((view instanceof ViewGroup) && (viewFindViewWithTag = view.findViewWithTag("two_items_tag")) == null) {
            T t6 = this.ycx.get(dj.ycx(true, i5, this.ycx.size()));
            if (t6 == null) {
                return;
            }
            if (t6 instanceof com.bytedance.adsdk.ugeno.zb.sya) {
                viewFindViewWithTag = ((com.bytedance.adsdk.ugeno.zb.sya) t6).ea();
            } else if (t6 instanceof View) {
                viewFindViewWithTag = (View) t6;
            }
            if (viewFindViewWithTag == null) {
                return;
            }
            if (viewFindViewWithTag.getParent() instanceof ViewGroup) {
                ((ViewGroup) viewFindViewWithTag.getParent()).removeView(viewFindViewWithTag);
            }
            ((ViewGroup) view).addView(viewFindViewWithTag);
        }
    }
}
