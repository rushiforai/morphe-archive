.class public Lcom/opera/android/browser/chromium/TabCrashView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static final synthetic h:I


# instance fields
.field public a:Lcy3;

.field public b:F

.field public c:F

.field public final d:Z

.field public e:Z

.field public f:I

.field public final g:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/browser/chromium/TabCrashView;->d:Z

    iput-object p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->g:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->f:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d00c8

    invoke-virtual {p1, v0, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->f:I

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, p1, :cond_1b

    iput p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->f:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->g:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d00c8

    const/4 v1, 0x1

    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    :cond_1b
    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/opera/android/browser/chromium/TabCrashView;->d:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_58

    if-eq v0, v3, :cond_3e

    const/4 v5, 0x2

    if-eq v0, v5, :cond_19

    iget-object p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcy3;->release(I)V

    iput-boolean v4, p0, Lcom/opera/android/browser/chromium/TabCrashView;->e:Z

    return v3

    :cond_19
    if-eqz v2, :cond_26

    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->e:Z

    if-nez v0, :cond_26

    iget-object v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    invoke-virtual {v0, v4, v4}, Lcy3;->start(II)Z

    iput-boolean v3, p0, Lcom/opera/android/browser/chromium/TabCrashView;->e:Z

    :cond_26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v2, p0, Lcom/opera/android/browser/chromium/TabCrashView;->b:F

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    invoke-virtual {v2, v1, v0}, Lcy3;->pull(FF)V

    iget v1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->c:F

    add-float/2addr v1, v0

    iput v1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->c:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->b:F

    return v3

    :cond_3e
    iget-object p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    iget v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->c:F

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_51

    move v0, v3

    goto :goto_52

    :cond_51
    move v0, v4

    :goto_52
    invoke-virtual {p1, v0}, Lcy3;->release(I)V

    iput-boolean v4, p0, Lcom/opera/android/browser/chromium/TabCrashView;->e:Z

    return v3

    :cond_58
    if-eqz v2, :cond_61

    iget-object v0, p0, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    invoke-virtual {v0, v4, v4}, Lcy3;->start(II)Z

    iput-boolean v3, p0, Lcom/opera/android/browser/chromium/TabCrashView;->e:Z

    :cond_61
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->b:F

    iput v1, p0, Lcom/opera/android/browser/chromium/TabCrashView;->c:F

    return v3
.end method
