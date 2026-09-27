.class final Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;
.super Ljava/lang/Object;
.source "CaptionOverlayV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;,
        Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;
    }
.end annotation


# static fields
.field private static final COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

.field private static final MAIN:Landroid/os/Handler;

.field private static final WATCH:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private static activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static anchorRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/FrameLayout;",
            ">;"
        }
    .end annotation
.end field

.field private static currentGuard:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

.field private static dirty:Z

.field private static downAt:J

.field private static downY:F

.field private static dragging:Z

.field private static fallback:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static guardedExpansion:Z

.field private static hostRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/FrameLayout;",
            ">;"
        }
    .end annotation
.end field

.field private static initial:F

.field private static lastLayout:J

.field private static lastNotice:Ljava/lang/String;

.field private static lastScan:J

.field private static volatile layoutBudget:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

.field private static pendingIdentity:Ljava/lang/String;

.field private static pendingStatus:Z

.field private static pendingText:Ljava/lang/String;

.field private static previous:Landroid/graphics/Rect;

.field private static previousShorts:Z

.field private static suppressed:Z

.field private static textRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->MAIN:Landroid/os/Handler;

    .line 22
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->activityRef:Ljava/lang/ref/WeakReference;

    .line 25
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    .line 26
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->textRef:Ljava/lang/ref/WeakReference;

    .line 69
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingIdentity:Ljava/lang/String;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastNotice:Ljava/lang/String;

    .line 74
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    const/4 v0, 0x1

    .line 76
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 80
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda4;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->WATCH:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attach(Landroid/app/Activity;)Z
    .registers 10

    .line 259
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    if-eqz v0, :cond_1a

    .line 260
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1a

    return v1

    .line 261
    :cond_1a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->detach()V

    const v0, 0x1020002

    .line 262
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 263
    instance-of v2, v0, Landroid/widget/FrameLayout;

    const/4 v3, 0x0

    if-nez v2, :cond_2a

    return v3

    .line 264
    :cond_2a
    check-cast v0, Landroid/widget/FrameLayout;

    .line 265
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 266
    const-string v4, "yydarlinker.deepseek.caption.anchor"

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 267
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 268
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    const/high16 v4, 0x41400000    # 12.0f

    .line 269
    invoke-static {p0, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 270
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 271
    const-string v5, "yydarlinker.deepseek.caption.overlay"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/4 v5, -0x1

    .line 272
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v5, 0x11

    .line 273
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 274
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/high16 v5, 0x40c00000    # 6.0f

    .line 275
    invoke-static {p0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v6

    const/high16 v7, 0x40800000    # 4.0f

    invoke-static {p0, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {p0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v4, v6, v8, v5, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v5, 0x3f800000    # 1.0f

    .line 276
    invoke-static {p0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v6

    int-to-float v6, v6

    invoke-static {p0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    const/high16 v5, -0x30000000

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7, p0, v5}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 277
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v4, p0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 278
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 p0, 0x2

    .line 279
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 v5, 0x0

    .line 280
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 281
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setHyphenationFrequency(I)V

    .line 282
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setBreakStrategy(I)V

    .line 283
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda10;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 284
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x31

    const/4 v5, -0x2

    invoke-direct {p0, v5, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 290
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    .line 292
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    .line 293
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->textRef:Ljava/lang/ref/WeakReference;

    .line 294
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->WATCH:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 295
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    return v1
.end method

.method static beginGuardedExpansion()V
    .registers 1

    .line 215
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda9;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda9;-><init>()V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static budget()Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;
    .registers 1

    .line 66
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->layoutBudget:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    return-object v0
.end method

.method static clear()V
    .registers 3

    .line 163
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    .line 164
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda11;

    invoke-direct {v2, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda11;-><init>(J)V

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static compactWidth(Landroid/content/Context;Ljava/lang/String;FI)I
    .registers 10

    .line 416
    invoke-static {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v0

    const/4 v1, 0x1

    move v3, p3

    move v2, v1

    :goto_7
    if-ge v2, v3, :cond_18

    add-int v4, v2, v3

    .line 417
    div-int/lit8 v4, v4, 0x2

    invoke-static {p0, p1, p2, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v5

    if-gt v5, v0, :cond_15

    move v3, v4

    goto :goto_7

    :cond_15
    add-int/lit8 v2, v4, 0x1

    goto :goto_7

    :cond_18
    add-int/2addr v2, v1

    .line 418
    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0
.end method

.method private static detach()V
    .registers 4

    .line 244
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_25

    .line 245
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 246
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->WATCH:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_25
    if-eqz v1, :cond_38

    .line 247
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_38

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 248
    :cond_38
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    .line 249
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    .line 250
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->textRef:Ljava/lang/ref/WeakReference;

    .line 251
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    const-wide/16 v2, -0x1f4

    .line 252
    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastScan:J

    const-wide/16 v2, 0x0

    .line 253
    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastLayout:J

    .line 254
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastNotice:Ljava/lang/String;

    .line 255
    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->layoutBudget:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    return-void
.end method

.method private static dp(Landroid/content/Context;F)I
    .registers 2

    .line 472
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static drag(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10

    .line 436
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-eqz v0, :cond_b3

    .line 437
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-gtz v2, :cond_15

    goto/16 :goto_b3

    .line 438
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_84

    if-eq v2, v3, :cond_81

    const/4 v4, 0x2

    if-eq v2, v4, :cond_25

    const/4 p0, 0x3

    if-eq v2, p0, :cond_81

    return v1

    .line 449
    :cond_25
    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dragging:Z

    if-nez v2, :cond_3b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->downAt:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x15e

    cmp-long v2, v4, v6

    if-ltz v2, :cond_3b

    .line 450
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dragging:Z

    .line 451
    invoke-virtual {p0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 453
    :cond_3b
    sget-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dragging:Z

    if-eqz p0, :cond_80

    .line 454
    sget p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->initial:F

    .line 455
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    sget v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->downY:F

    sub-float/2addr p1, v2

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr p1, v2

    add-float/2addr p0, p1

    const p1, 0x3f6b851f    # 0.92f

    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const p1, 0x3da3d70a    # 0.08f

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    .line 456
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result p1

    if-eqz p1, :cond_69

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveShortsPosition(Landroid/content/Context;F)V

    goto :goto_7b

    .line 457
    :cond_69
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-le p1, v2, :cond_78

    move v1, v3

    :cond_78
    invoke-static {v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveCaptionPosition(Landroid/content/Context;ZF)V

    .line 458
    :goto_7b
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 459
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    :cond_80
    return v3

    .line 464
    :cond_81
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dragging:Z

    return v3

    .line 440
    :cond_84
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p0

    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->downY:F

    .line 441
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->downAt:J

    .line 442
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dragging:Z

    .line 444
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result p0

    if-eqz p0, :cond_9d

    .line 445
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->shortsPosition(Landroid/content/Context;)F

    move-result p0

    goto :goto_b0

    .line 446
    :cond_9d
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    if-le p0, p1, :cond_ac

    move v1, v3

    :cond_ac
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->captionPositionY(Landroid/content/Context;Z)F

    move-result p0

    :goto_b0
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->initial:F

    return v3

    :cond_b3
    :goto_b3
    return v1
.end method

.method static hide()V
    .registers 1

    const/4 v0, 0x0

    .line 146
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hide(Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V

    return-void
.end method

.method static hide(Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V
    .registers 4

    if-eqz p0, :cond_9

    .line 150
    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;->isValid()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 151
    :cond_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    .line 152
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda6;

    invoke-direct {v2, v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda6;-><init>(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static hideView()V
    .registers 2

    .line 239
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_f

    const/16 v1, 0x8

    .line 240
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_f
    return-void
.end method

.method static synthetic lambda$attach$10(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 2

    .line 283
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->drag(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$beginGuardedExpansion$8()V
    .registers 1

    const/4 v0, 0x1

    .line 217
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->guardedExpansion:Z

    .line 218
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hideView()V

    return-void
.end method

.method static synthetic lambda$clear$4(J)V
    .registers 4

    .line 166
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-eqz p0, :cond_b

    return-void

    .line 167
    :cond_b
    const-string p0, ""

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    const/4 p0, 0x0

    .line 168
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingStatus:Z

    const/4 p0, 0x0

    .line 169
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->fallback:Ljava/util/function/Supplier;

    .line 170
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->currentGuard:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    .line 171
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hideView()V

    return-void
.end method

.method static synthetic lambda$hide$3(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V
    .registers 5

    .line 154
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-nez p0, :cond_1f

    if-eqz p2, :cond_13

    invoke-interface {p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;->isValid()Z

    move-result p0

    if-nez p0, :cond_13

    goto :goto_1f

    .line 155
    :cond_13
    const-string p0, ""

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    const/4 p0, 0x0

    .line 156
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->fallback:Ljava/util/function/Supplier;

    .line 157
    sput-object p2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->currentGuard:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    .line 158
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hideView()V

    :cond_1f
    :goto_1f
    return-void
.end method

.method static synthetic lambda$refreshStyle$5()V
    .registers 1

    const/4 v0, 0x1

    .line 178
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 179
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    return-void
.end method

.method static synthetic lambda$refreshSurface$6()V
    .registers 5

    .line 186
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 187
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastScan:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_12

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f4

    cmp-long v0, v0, v2

    if-gez v0, :cond_12

    return-void

    .line 188
    :cond_12
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->refresh()Landroid/view/View;

    .line 189
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastScan:J

    .line 190
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    .line 191
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->suppressed:Z

    .line 192
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->guardedExpansion:Z

    :cond_26
    const/4 v0, 0x1

    .line 194
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 195
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    return-void
.end method

.method static synthetic lambda$restoreAfterGuardedExpansion$9(Ljava/lang/String;)V
    .registers 2

    const/4 v0, 0x0

    .line 225
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->guardedExpansion:Z

    .line 226
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->suppressed:Z

    .line 227
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->refresh()Landroid/view/View;

    const/4 v0, 0x1

    .line 228
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 229
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->setPlayerType(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$setActivity$1(Landroid/app/Activity;)V
    .registers 2

    .line 93
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_b

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->detach()V

    .line 94
    :cond_b
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->activityRef:Ljava/lang/ref/WeakReference;

    .line 95
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->activity(Landroid/app/Activity;)V

    const/4 p0, 0x1

    .line 96
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 97
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    return-void
.end method

.method static synthetic lambda$setPlayerType$7(Ljava/lang/String;)V
    .registers 3

    if-nez p0, :cond_5

    .line 202
    const-string p0, ""

    goto :goto_b

    :cond_5
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 204
    :goto_b
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_34

    const-string v0, "MINIM"

    .line 205
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "HIDDEN"

    .line 206
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "DISMISSED"

    .line 207
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "PICTURE_IN_PICTURE"

    .line 208
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_32
    move p0, v1

    goto :goto_35

    :cond_34
    const/4 p0, 0x0

    :goto_35
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->suppressed:Z

    .line 209
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 210
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    return-void
.end method

.method static synthetic lambda$show$2(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/lang/String;Ljava/lang/String;ZLjava/util/function/Supplier;)V
    .registers 9

    .line 134
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-nez p0, :cond_27

    if-eqz p2, :cond_13

    invoke-interface {p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;->isValid()Z

    move-result p0

    if-nez p0, :cond_13

    goto :goto_27

    :cond_13
    if-nez p3, :cond_17

    .line 135
    const-string p3, ""

    :cond_17
    sput-object p3, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    .line 136
    sput-object p4, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingIdentity:Ljava/lang/String;

    .line 137
    sput-boolean p5, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingStatus:Z

    .line 138
    sput-object p2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->currentGuard:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    .line 139
    sput-object p6, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->fallback:Ljava/util/function/Supplier;

    const/4 p0, 0x1

    .line 140
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 141
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    :cond_27
    :goto_27
    return-void
.end method

.method static synthetic lambda$static$0()Z
    .registers 6

    .line 82
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 83
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastLayout:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x64

    cmp-long v2, v2, v4

    if-ltz v2, :cond_23

    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->guardedExpansion:Z

    if-nez v2, :cond_23

    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->suppressed:Z

    if-nez v2, :cond_23

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_23

    .line 84
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastLayout:J

    .line 85
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->render()V

    :cond_23
    const/4 v0, 0x1

    return v0
.end method

.method static lines(Landroid/content/Context;Ljava/lang/String;FI)I
    .registers 7

    .line 422
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 423
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 426
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v2, 0x2

    .line 425
    invoke-static {v2, p2, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    .line 424
    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 427
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/4 p3, 0x0

    invoke-static {p1, p3, p0, v0, p2}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 428
    invoke-virtual {p0, p3}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 429
    invoke-virtual {p0, v2}, Landroid/text/StaticLayout$Builder;->setBreakStrategy(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 430
    invoke-virtual {p0, p3}, Landroid/text/StaticLayout$Builder;->setHyphenationFrequency(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 431
    invoke-virtual {p0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object p0

    .line 432
    invoke-virtual {p0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result p0

    return p0
.end method

.method private static main(Ljava/lang/Runnable;)V
    .registers 3

    .line 234
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_e

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 235
    :cond_e
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->MAIN:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static refreshStyle(Landroid/content/Context;)V
    .registers 1

    .line 176
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda2;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static refreshSurface()V
    .registers 1

    .line 184
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda3;-><init>()V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static render()V
    .registers 17

    .line 300
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_2e2

    .line 302
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_2e2

    .line 303
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_2e2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    .line 304
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2e2

    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->suppressed:Z

    if-nez v1, :cond_2e2

    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->guardedExpansion:Z

    if-nez v1, :cond_2e2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->currentGuard:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    if-eqz v1, :cond_32

    .line 307
    invoke-interface {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;->isValid()Z

    move-result v1

    if-nez v1, :cond_32

    goto/16 :goto_2e2

    .line 311
    :cond_32
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->attach(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_39

    goto :goto_94

    .line 312
    :cond_39
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hostRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->anchorRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    .line 313
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->textRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 314
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 315
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastScan:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x1f4

    cmp-long v6, v6, v8

    if-ltz v6, :cond_64

    .line 316
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->refresh()Landroid/view/View;

    .line 317
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastScan:J

    .line 319
    :cond_64
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->videoBounds(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    if-eqz v1, :cond_2db

    .line 320
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v4

    const/16 v5, 0x32

    if-lt v4, v5, :cond_2db

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-ge v4, v5, :cond_7a

    goto/16 :goto_2db

    .line 325
    :cond_7a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v4

    .line 326
    sget-boolean v5, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    if-nez v5, :cond_95

    sget-object v5, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    .line 327
    invoke-virtual {v1, v5}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_95

    sget-boolean v5, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previousShorts:Z

    if-ne v4, v5, :cond_95

    .line 329
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v5

    if-nez v5, :cond_95

    :goto_94
    return-void

    .line 330
    :cond_95
    sput-boolean v4, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previousShorts:Z

    const/4 v4, 0x0

    .line 331
    sput-boolean v4, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dirty:Z

    .line 332
    sget-object v5, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->previous:Landroid/graphics/Rect;

    invoke-virtual {v5, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 333
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayStyle(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v5

    .line 334
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v7

    if-eqz v7, :cond_b2

    const v7, 0x3f47ae14    # 0.78f

    goto :goto_b5

    :cond_b2
    const v7, 0x3f6b851f    # 0.92f

    :goto_b5
    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    const/4 v7, 0x1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 335
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v8

    sub-int v8, v6, v8

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 336
    new-instance v9, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    .line 340
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    const/4 v11, 0x2

    const/high16 v12, 0x41400000    # 12.0f

    .line 339
    invoke-static {v11, v12, v10}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v10

    iget v13, v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->captionTextSize:I

    .line 341
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    iget v15, v15, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v14, v15

    invoke-static {v13, v14}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->scaledSp(IF)F

    move-result v13

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    invoke-static {v11, v13, v14}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v13

    invoke-direct {v9, v8, v10, v13}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;-><init>(IFF)V

    sput-object v9, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->layoutBudget:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    .line 342
    iget v9, v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->captionTextSize:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v13

    iget v13, v13, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v10, v13

    invoke-static {v9, v10}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->scaledSp(IF)F

    move-result v9

    .line 343
    sget-object v10, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    .line 344
    sget-boolean v13, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingStatus:Z

    if-eqz v13, :cond_125

    const-string v13, "status"

    goto :goto_127

    :cond_125
    const-string v13, "caption"

    :goto_127
    cmpl-float v14, v9, v12

    if-lez v14, :cond_139

    .line 346
    invoke-static {v0, v10, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v14

    if-le v14, v11, :cond_139

    const/high16 v14, 0x3f000000    # 0.5f

    sub-float/2addr v9, v14

    invoke-static {v12, v9}, Ljava/lang/Math;->max(FF)F

    move-result v9

    goto :goto_127

    .line 347
    :cond_139
    invoke-static {v0, v10, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v12

    const-string v14, "overflow_status"

    const-string v15, "original_fallback"

    if-le v12, v11, :cond_170

    .line 349
    sget-object v10, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->fallback:Ljava/util/function/Supplier;

    if-nez v10, :cond_14a

    const-string v10, ""

    goto :goto_150

    :cond_14a
    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Supplier;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    :goto_150
    if-eqz v10, :cond_161

    .line 350
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_161

    invoke-static {v0, v10, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v12

    if-le v12, v11, :cond_15f

    goto :goto_161

    :cond_15f
    move-object v13, v15

    goto :goto_168

    .line 352
    :cond_161
    :goto_161
    const-string v10, "caption_overflow"

    invoke-static {v0, v10}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v13, v14

    .line 354
    :goto_168
    invoke-static {v0, v10, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v12

    if-le v12, v11, :cond_170

    const-string v10, "\u2026"

    .line 356
    :cond_170
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingIdentity:Ljava/lang/String;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "|"

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v11, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 357
    sget-object v11, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastNotice:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_216

    .line 358
    sput-object v7, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lastNotice:Ljava/lang/String;

    .line 359
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v11, "id="

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingIdentity:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ";mode="

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ";width="

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ";sp="

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v11, ";lines="

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v11, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingText:Ljava/lang/String;

    .line 369
    invoke-static {v0, v11, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lines(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 370
    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1e6

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1eb

    .line 371
    :cond_1e6
    const-string v11, "REBUILD_LAYOUT_FALLBACK"

    invoke-static {v0, v11, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    :cond_1eb
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_216

    .line 373
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ";text="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v7

    iget-object v7, v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 v12, 0x190

    invoke-static {v10, v7, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 373
    const-string v11, "REBUILD_PRESENTED"

    invoke-static {v0, v11, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    :cond_216
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v7, 0x2

    .line 382
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 383
    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/widget/TextView;I)V

    .line 384
    invoke-virtual {v3, v7, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 385
    sget-boolean v7, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->pendingStatus:Z

    if-eqz v7, :cond_22e

    const v7, -0x19000001

    goto :goto_22f

    :cond_22e
    const/4 v7, -0x1

    :goto_22f
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 386
    invoke-static {v0, v10, v9, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->compactWidth(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result v7

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    .line 387
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 388
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    iput v7, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 389
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 390
    iget v5, v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->backgroundOpacity:I

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->alpha(I)I

    move-result v5

    shl-int/lit8 v5, v5, 0x18

    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x40800000    # 4.0f

    .line 391
    invoke-static {v0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->dp(Landroid/content/Context;F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 392
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v5, 0x40000000    # 2.0f

    .line 394
    invoke-static {v7, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 395
    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 393
    invoke-virtual {v3, v5, v7}, Landroid/widget/TextView;->measure(II)V

    .line 396
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    .line 397
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v7

    if-le v5, v7, :cond_283

    const/4 v7, 0x1

    goto :goto_284

    :cond_283
    move v7, v4

    .line 399
    :goto_284
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v5

    if-eqz v5, :cond_28f

    .line 400
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->shortsPosition(Landroid/content/Context;)F

    move-result v0

    goto :goto_293

    .line 401
    :cond_28f
    invoke-static {v0, v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->captionPositionY(Landroid/content/Context;Z)F

    move-result v0

    .line 402
    :goto_293
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 403
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 404
    iput v3, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const v7, 0x800033

    .line 405
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 406
    iget v7, v1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v8

    sub-int/2addr v8, v6

    const/16 v16, 0x2

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v7, v8

    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 407
    iget v6, v1, Landroid/graphics/Rect;->top:I

    iget v7, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v3

    iget v8, v1, Landroid/graphics/Rect;->top:I

    .line 409
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v8, v0

    const/16 v16, 0x2

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v8, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 408
    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 410
    invoke-virtual {v2, v5}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 412
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->bringToFront()V

    return-void

    :cond_2db
    :goto_2db
    const/4 v0, 0x0

    .line 321
    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->layoutBudget:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    .line 322
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hideView()V

    return-void

    .line 308
    :cond_2e2
    :goto_2e2
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hideView()V

    return-void
.end method

.method static restoreAfterGuardedExpansion(Ljava/lang/String;)V
    .registers 2

    .line 223
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda7;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static setActivity(Landroid/app/Activity;)V
    .registers 2

    .line 91
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static setPlayerType(Ljava/lang/String;)V
    .registers 2

    .line 200
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 126
    const-string v0, ""

    invoke-static {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;Ljava/lang/String;)V

    return-void
.end method

.method private static show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;Ljava/lang/String;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_9

    .line 130
    invoke-interface {p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;->isValid()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 131
    :cond_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->COMMAND:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v2

    .line 132
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;

    move-object v5, p0

    move v7, p1

    move-object v4, p2

    move-object v8, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v8}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;-><init>(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/lang/String;Ljava/lang/String;ZLjava/util/function/Supplier;)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->main(Ljava/lang/Runnable;)V

    return-void
.end method

.method static showCaption(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 102
    invoke-static {p0, v0, v1, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V

    return-void
.end method

.method static showCaption(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 106
    invoke-static {p0, v0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V

    return-void
.end method

.method static showCaption(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 110
    invoke-static {p0, v0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V

    return-void
.end method

.method static showEvent(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 122
    invoke-static {p0, v0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;Ljava/lang/String;)V

    return-void
.end method

.method static showStatus(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 114
    invoke-static {p0, v0, v1, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V

    return-void
.end method

.method static showStatus(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 118
    invoke-static {p0, v0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->show(Ljava/lang/String;ZLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;)V

    return-void
.end method
