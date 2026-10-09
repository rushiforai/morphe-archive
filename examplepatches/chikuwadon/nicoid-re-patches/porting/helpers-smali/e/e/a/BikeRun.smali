.class public final Le/e/a/BikeRun;
.super Ljava/lang/Object;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BikeRun$Track;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;II)I
    .registers 4
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 21
    invoke-static {p0, p1, p2}, Le/e/a/BikeRun;->color(Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "attr"    # I
    .param p2, "fallback"    # I

    .line 42
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 43
    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-nez v1, :cond_11

    return p2

    .line 44
    :cond_11
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v1, :cond_25

    :try_start_15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_23} :catch_24

    return v1

    :catch_24
    move-exception v1

    .line 45
    :cond_25
    iget v1, v0, Landroid/util/TypedValue;->data:I

    return v1
.end method

.method static synthetic lambda$open$0(Landroid/app/Dialog;Landroid/view/View;)V
    .registers 2
    .param p0, "dialog"    # Landroid/app/Dialog;
    .param p1, "v"    # Landroid/view/View;

    .line 33
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$open$1(Le/e/a/BikeRun$Track;Landroid/content/DialogInterface;)V
    .registers 3
    .param p0, "track"    # Le/e/a/BikeRun$Track;
    .param p1, "d"    # Landroid/content/DialogInterface;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->active:Z

    return-void
.end method

.method public static open(Landroid/app/Activity;)V
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;

    .line 24
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_16

    return-void

    .line 26
    :cond_16
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 27
    .local v0, "dialog":Landroid/app/Dialog;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 28
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 29
    .local v1, "root":Landroid/widget/FrameLayout;
    new-instance v2, Le/e/a/BikeRun$Track;

    invoke-direct {v2, p0}, Le/e/a/BikeRun$Track;-><init>(Landroid/content/Context;)V

    .line 30
    .local v2, "track":Le/e/a/BikeRun$Track;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v3, "close":Landroid/widget/TextView;
    const-string v5, "\u00d7"

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41e00000    # 28.0f

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 32
    const/16 v5, 0x11

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setGravity(I)V

    iget v5, v2, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    const-string v5, "\u30df\u30cb\u30b2\u30fc\u30e0\u3092\u9589\u3058\u308b"

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v5, Le/e/a/BikeRun$0;

    invoke-direct {v5, v0}, Le/e/a/BikeRun$0;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x42600000    # 56.0f

    mul-float v5, v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 35
    .local v5, "size":I
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const v7, 0x800035

    invoke-direct {v6, v5, v5, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v3, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    new-instance v6, Le/e/a/BikeRun$1;

    invoke-direct {v6, v2}, Le/e/a/BikeRun$1;-><init>(Le/e/a/BikeRun$Track;)V

    invoke-virtual {v0, v6}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 37
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 38
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    .line 39
    .local v6, "window":Landroid/view/Window;
    if-eqz v6, :cond_97

    invoke-virtual {v6, v4, v4}, Landroid/view/Window;->setLayout(II)V

    const v4, 0x106000d

    invoke-virtual {v6, v4}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    const/16 v4, 0x80

    invoke-virtual {v6, v4}, Landroid/view/Window;->addFlags(I)V

    .line 40
    :cond_97
    return-void
.end method
