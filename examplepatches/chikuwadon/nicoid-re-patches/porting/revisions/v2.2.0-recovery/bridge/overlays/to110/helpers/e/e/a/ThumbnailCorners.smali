.class public final Le/e/a/ThumbnailCorners;
.super Ljava/lang/Object;
.source "ThumbnailCorners.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ThumbnailCorners$OriginalOutline;
    }
.end annotation


# static fields
.field private static final ENABLED:Ljava/lang/String; = "thumbnail_rounded_corners"

.field private static final NATIVE_THUMBNAIL:I = 0x7f0801b2

.field private static final ORIGINALS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Le/e/a/ThumbnailCorners$OriginalOutline;",
            ">;"
        }
    .end annotation
.end field

.field private static final OUTLINE:Landroid/view/ViewOutlineProvider;

.field private static final ROW_THUMBNAIL:I = 0x7f0800cd


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ThumbnailCorners;->ORIGINALS:Ljava/util/WeakHashMap;

    .line 29
    new-instance v0, Le/e/a/ThumbnailCorners$1;

    invoke-direct {v0}, Le/e/a/ThumbnailCorners$1;-><init>()V

    sput-object v0, Le/e/a/ThumbnailCorners;->OUTLINE:Landroid/view/ViewOutlineProvider;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/view/View;)V
    .registers 4

    if-eqz p0, :cond_1

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThumbnailCorners;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    sget-object v0, Le/e/a/ThumbnailCorners;->ORIGINALS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ThumbnailCorners$OriginalOutline;

    if-eqz v0, :cond_1

    .line 78
    iget-object v1, v0, Le/e/a/ThumbnailCorners$OriginalOutline;->provider:Landroid/view/ViewOutlineProvider;

    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 79
    iget-boolean v0, v0, Le/e/a/ThumbnailCorners$OriginalOutline;->clip:Z

    invoke-virtual {p0, v0}, Landroid/view/View;->setClipToOutline(Z)V

    return-void

    .line 83
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object v0

    sget-object v1, Le/e/a/ThumbnailCorners;->OUTLINE:Landroid/view/ViewOutlineProvider;

    if-ne v0, v1, :cond_2

    :cond_1
    return-void

    .line 84
    :cond_2
    sget-object v0, Le/e/a/ThumbnailCorners;->ORIGINALS:Ljava/util/WeakHashMap;

    new-instance v2, Le/e/a/ThumbnailCorners$OriginalOutline;

    invoke-direct {v2, p0}, Le/e/a/ThumbnailCorners$OriginalOutline;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 v0, 0x1

    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->setClipToOutline(Z)V

    return-void
.end method

.method public static applyDetails(Landroid/view/View;)V
    .registers 2

    if-nez p0, :cond_0

    return-void

    .line 142
    :cond_0
    new-instance v0, Le/e/a/ThumbnailCorners$0;

    invoke-direct {v0, p0}, Le/e/a/ThumbnailCorners$0;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static applyFrame(Landroid/view/View;)V
    .registers 3

    if-eqz p0, :cond_1

    .line 92
    invoke-static {p0}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 94
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v1, :cond_1

    .line 95
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThumbnailCorners;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr p0, v1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 95
    :goto_0
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    :cond_1
    return-void
.end method

.method public static applyNative(Landroid/view/View;)V
    .registers 3

    if-eqz p0, :cond_3

    const v0, 0x7f0800cd

    .line 123
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 124
    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_1

    .line 125
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p0, :cond_0

    invoke-static {v0}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V

    goto :goto_0

    .line 126
    :cond_0
    invoke-static {v0}, Le/e/a/ThumbnailCorners;->applyWithParent(Landroid/view/View;)V

    :cond_1
    :goto_0
    const v0, 0x7f0801b2

    .line 128
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 129
    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_3

    .line 130
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p0, :cond_2

    invoke-static {v0}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V

    return-void

    .line 131
    :cond_2
    invoke-static {v0}, Le/e/a/ThumbnailCorners;->applyWithParent(Landroid/view/View;)V

    :cond_3
    return-void
.end method

.method public static applyWithParent(Landroid/view/View;)V
    .registers 5

    if-eqz p0, :cond_2

    .line 107
    invoke-static {p0}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 109
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 110
    check-cast v0, Landroid/view/ViewGroup;

    .line 111
    instance-of v1, v0, Landroid/widget/FrameLayout;

    if-nez v1, :cond_0

    instance-of v1, v0, Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_2

    .line 112
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    if-lez v1, :cond_1

    .line 113
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x41000000    # 8.0f

    mul-float/2addr v2, v3

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_2

    .line 115
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    if-nez p0, :cond_3

    instance-of p0, v0, Landroid/widget/RelativeLayout;

    if-eqz p0, :cond_3

    if-eqz v1, :cond_2

    .line 117
    iget p0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x1

    if-eq p0, v1, :cond_3

    :cond_2
    return-void

    .line 118
    :cond_3
    invoke-static {v0}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V

    return-void
.end method

.method public static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 46
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "thumbnail_rounded_corners"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static findLargeArtwork(Landroid/view/View;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 9

    .line 149
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 150
    move-object v0, p0

    check-cast v0, Landroid/widget/ImageView;

    .line 151
    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v2

    .line 152
    invoke-virtual {v0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x42c00000    # 96.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    if-lt v1, v3, :cond_1

    if-lez v2, :cond_1

    int-to-float v3, v1

    int-to-float v4, v2

    const v5, 0x3faccccd    # 1.35f

    mul-float/2addr v5, v4

    cmpl-float v5, v3, v5

    if-ltz v5, :cond_1

    const v5, 0x40133333    # 2.3f

    mul-float/2addr v4, v5

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_1

    if-eqz p1, :cond_0

    int-to-long v3, v1

    int-to-long v1, v2

    mul-long/2addr v3, v1

    .line 156
    invoke-virtual {p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    int-to-long v5, v5

    mul-long/2addr v1, v5

    cmp-long v1, v3, v1

    if-lez v1, :cond_1

    :cond_0
    move-object p1, v0

    .line 159
    :cond_1
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    .line 160
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 161
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_2

    return-object p1

    .line 162
    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Le/e/a/ThumbnailCorners;->findLargeArtwork(Landroid/view/View;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    move-result-object p1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-object p1
.end method

.method static synthetic lambda$0(Landroid/view/View;)V
    .registers 2

    const/4 v0, 0x0

    .line 143
    invoke-static {p0, v0}, Le/e/a/ThumbnailCorners;->findLargeArtwork(Landroid/view/View;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 144
    invoke-static {p0}, Le/e/a/ThumbnailCorners;->applyWithParent(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public static load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 3

    .line 168
    invoke-static {p1}, Le/e/a/ThumbnailCorners;->applyWithParent(Landroid/view/View;)V

    .line 169
    invoke-static {p0, p1, p2}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 9

    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    .line 50
    const-string v0, "thumbnail_rounded_corners"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_5

    .line 51
    const-string v1, "show_nicolive_menu"

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_0

    .line 52
    const-string v1, "show_shorts_menu"

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    :cond_0
    if-nez v1, :cond_1

    .line 53
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 54
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    .line 55
    :goto_1
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 59
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 60
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 61
    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 62
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 63
    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    .line 65
    const-string v0, "Rounded thumbnails"

    const-string/jumbo v1, "\u7e2e\u5716\u5713\u89d2\u986f\u793a"

    .line 64
    const-string v3, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306e\u89d2\u4e38\u8868\u793a"

    invoke-static {p0, v3, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 68
    const-string v0, "Turn off for square corners. Changes take effect after restarting the app."

    .line 69
    const-string/jumbo v1, "\u95dc\u9589\u5f8c\u986f\u793a\u76f4\u89d2\u7e2e\u5716\u3002\u8b8a\u66f4\u5c07\u5728\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u5f8c\u751f\u6548"

    .line 66
    const-string v3, "OFF\u306b\u3059\u308b\u3068\u89d2\u4e38\u306a\u3057\u3067\u8868\u793a\u3057\u307e\u3059\u3002\u5909\u66f4\u306f\u30a2\u30d7\u30ea\u306e\u518d\u8d77\u52d5\u5f8c\u306b\u53cd\u6620\u3055\u308c\u307e\u3059"

    invoke-static {p0, v3, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 70
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    .line 59
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/preference/Preference;

    invoke-virtual {v2}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOrder(I)V

    goto :goto_2

    .line 56
    :cond_3
    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    .line 57
    invoke-virtual {v4}, Landroid/preference/Preference;->getOrder()I

    move-result v5

    if-lt v5, v1, :cond_4

    invoke-virtual {v4}, Landroid/preference/Preference;->getOrder()I

    move-result v5

    const v6, 0x7fffffff

    if-ge v5, v6, :cond_4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method
