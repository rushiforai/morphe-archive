.class public final Le/e/a/BikeRun;
.super Ljava/lang/Object;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BikeRun$RecordRow;,
        Le/e/a/BikeRun$RecordsPane;,
        Le/e/a/BikeRun$SwipeScroll;,
        Le/e/a/BikeRun$Track;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;II)I
    .registers 3

    .line 115
    invoke-static {p0, p1, p2}, Le/e/a/BikeRun;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 116
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 117
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 120
    :cond_11
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_24

    .line 122
    :try_start_15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_23} :catch_24

    return p0

    .line 126
    :catch_24
    :cond_24
    iget p0, v0, Landroid/util/TypedValue;->data:I

    return p0
.end method

.method static synthetic lambda$0(Landroid/app/Dialog;Landroid/view/View;)V
    .registers 2

    .line 76
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/BikeRun$Track;Landroid/view/View;)V
    .registers 2

    .line 96
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->showRecords()V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/BikeRun$Track;Landroid/content/DialogInterface;)V
    .registers 2

    const/4 p1, 0x0

    .line 104
    iput-boolean p1, p0, Le/e/a/BikeRun$Track;->active:Z

    return-void
.end method

.method public static open(Landroid/app/Activity;)V
    .registers 12

    .line 61
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_16

    return-void

    .line 65
    :cond_16
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 67
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 68
    new-instance v3, Le/e/a/BikeRun$Track;

    invoke-direct {v3, p0}, Le/e/a/BikeRun$Track;-><init>(Landroid/content/Context;)V

    .line 69
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 71
    const-string v6, "\u00d7"

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41e00000    # 28.0f

    .line 72
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v6, 0x11

    .line 73
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 74
    iget v6, v3, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    const-string v6, "\u30df\u30cb\u30b2\u30fc\u30e0\u3092\u9589\u3058\u308b"

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 76
    new-instance v6, Le/e/a/BikeRun$$ExternalSyntheticLambda2;

    invoke-direct {v6, v0}, Le/e/a/BikeRun$$ExternalSyntheticLambda2;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x42600000    # 56.0f

    mul-float v6, v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 78
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const v8, 0x800035

    invoke-direct {v7, v6, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    new-instance v4, Le/e/a/BikeRun$1;

    invoke-direct {v4, p0, v3}, Le/e/a/BikeRun$1;-><init>(Landroid/content/Context;Le/e/a/BikeRun$Track;)V

    .line 94
    const-string v7, "Run records"

    const-string v9, "\u9a91\u884c\u8bb0\u5f55"

    const-string v10, "\u8d70\u884c\u8a18\u9332"

    invoke-virtual {v3, v10, v7, v9}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 95
    invoke-virtual {v4, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 96
    new-instance v1, Le/e/a/BikeRun$$ExternalSyntheticLambda3;

    invoke-direct {v1, v3}, Le/e/a/BikeRun$$ExternalSyntheticLambda3;-><init>(Le/e/a/BikeRun$Track;)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x42400000    # 48.0f

    mul-float v1, v1, v7

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 98
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v1, v1, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 99
    iput v6, v7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 100
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x40800000    # 4.0f

    mul-float p0, p0, v1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    iput p0, v7, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 101
    invoke-virtual {v2, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 103
    new-instance p0, Le/e/a/BikeRun$$ExternalSyntheticLambda4;

    invoke-direct {p0, v3}, Le/e/a/BikeRun$$ExternalSyntheticLambda4;-><init>(Le/e/a/BikeRun$Track;)V

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 106
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 107
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_e4

    .line 109
    invoke-virtual {p0, v5, v5}, Landroid/view/Window;->setLayout(II)V

    const v0, 0x106000d

    .line 110
    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    const/16 v0, 0x80

    .line 111
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_e4
    return-void
.end method
