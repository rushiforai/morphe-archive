.class public final Le/e/a/Review181;
.super Ljava/lang/Object;
.source "Review181.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Review181$Heart;,
        Le/e/a/Review181$Taps;
    }
.end annotation


# static fields
.field private static final TAPS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/Review181$Taps;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Review181;->TAPS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;I)Ljava/lang/String;
    .registers 2

    .line 45
    invoke-static {p0, p1}, Le/e/a/Review181;->seekLabel(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V
    .registers 3

    .line 122
    invoke-static {p0, p1, p2}, Le/e/a/Review181;->bindLike(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V

    return-void
.end method

.method private static bindLike(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V
    .registers 14

    .line 122
    :try_start_0
    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v0, "count"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v1, "videoId"

    const-string v2, "id"

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "likeCount"

    if-nez v0, :cond_23

    const-wide/16 v2, 0x0

    goto :goto_29

    :cond_23
    const-string v2, "like"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    :goto_29
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "e.e.a.VideoExtras"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "capture"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Lorg/json/JSONObject;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Landroid/os/Bundle;

    const/4 v8, 0x1

    aput-object v4, v3, v8

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object p1, v3, v5

    aput-object v7, v3, v8

    const/4 p1, 0x0

    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Landroid/widget/Button;

    invoke-direct {p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "nicoid_like"

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/ImageButton;

    invoke-direct {v9, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v5}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    const v1, 0x3f266666    # 0.65f

    invoke-virtual {v9, v1}, Landroid/widget/ImageButton;->setAlpha(F)V

    const/16 v1, 0xa

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v9, v3, v4, v10, v1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x38

    invoke-static {p2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const v10, 0x800055

    invoke-direct {v1, v4, v3, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v3, 0x118

    invoke-static {p2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v3, 0xc

    invoke-static {p2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    invoke-virtual {p0, v9, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v1, "toggle"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/widget/Button;

    aput-object v4, v3, v5

    const-class v4, Landroid/os/Bundle;

    aput-object v4, v3, v8

    const-class v4, Landroid/view/View;

    aput-object v4, v3, v2

    const-class v2, Ljava/lang/String;

    const/4 v4, 0x3

    aput-object v2, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-instance v0, Le/e/a/Review181$$ExternalSyntheticLambda3;

    move-object v1, v0

    move-object v3, p1

    move-object v4, v7

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/Review181$$ExternalSyntheticLambda3;-><init>(Ljava/lang/reflect/Method;Landroid/widget/Button;Landroid/os/Bundle;Landroid/widget/FrameLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    new-instance v0, Le/e/a/Review181$4;

    invoke-direct {v0, v7, v9, p2, p1}, Le/e/a/Review181$4;-><init>(Landroid/os/Bundle;Landroid/widget/ImageButton;Landroid/app/Activity;Landroid/widget/Button;)V

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e7} :catch_e8

    goto :goto_f0

    :catch_e8
    move-exception p0

    const-string p1, "nicoid-like"

    const-string p2, "Unable to prepare like action"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_f0
    return-void
.end method

.method private static compose(Landroid/app/Activity;)V
    .registers 6

    .line 126
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v2, "Enter a comment"

    const-string v3, "\u8f38\u5165\u7559\u8a00"

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u3092\u5165\u529b"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Post comment"

    const-string v3, "\u767c\u9001\u7559\u8a00"

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u6295\u7a3f"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Post"

    const-string v3, "\u767c\u9001"

    const-string v4, "\u6295\u7a3f"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/Review181$$ExternalSyntheticLambda7;

    invoke-direct {v3, p0, v1}, Le/e/a/Review181$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private static control(Landroid/view/View;FFLandroid/view/View;)Z
    .registers 8

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_58

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_58

    :cond_1c
    instance-of v0, p0, Landroid/widget/Button;

    const/4 v2, 0x1

    if-nez v0, :cond_57

    instance-of v0, p0, Landroid/widget/ImageButton;

    if-nez v0, :cond_57

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_57

    instance-of v0, p0, Landroid/widget/EditText;

    if-nez v0, :cond_57

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_3a

    if-eq p0, p3, :cond_3a

    goto :goto_57

    :cond_3a
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_56

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_45
    if-gez v0, :cond_48

    goto :goto_56

    :cond_48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2, p3}, Le/e/a/Review181;->control(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_53

    return v2

    :cond_53
    add-int/lit8 v0, v0, -0x1

    goto :goto_45

    :cond_56
    :goto_56
    return v1

    :cond_57
    :goto_57
    return v2

    :cond_58
    :goto_58
    return v1
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 3

    .line 39
    invoke-static {p0, p1}, Le/e/a/Review181;->seekSlider(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;II)V
    .registers 3

    .line 42
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/widget/SeekBar;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 47
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    invoke-static {p2}, Le/e/a/SeekRules;->seconds(I)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3, p4, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0, p1}, Le/e/a/Review181;->seekSummary(Landroid/content/Context;Landroid/preference/Preference;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/SeekBar;Landroid/view/View;)V
    .registers 2

    .line 47
    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 117
    invoke-static {p0}, Le/e/a/Review181;->compose(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/reflect/Method;Landroid/widget/Button;Landroid/os/Bundle;Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 7

    .line 122
    const/4 p5, 0x4

    :try_start_1
    new-array p5, p5, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p5, v0

    const/4 p1, 0x1

    aput-object p2, p5, p1

    const/4 p1, 0x2

    aput-object p3, p5, p1

    const-string p1, "id"

    invoke-virtual {p4, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, p5, p2

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1a

    goto :goto_22

    :catch_1a
    move-exception p0

    const-string p1, "nicoid-like"

    const-string p2, "Unable to change like"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_22
    return-void
.end method

.method static synthetic lambda$7(Landroid/app/Activity;Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 126
    :try_start_0
    const-string p2, "v"

    invoke-static {p0, p2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "184"

    invoke-static {p0, p1, p2}, Le/e/a/ModernPosting;->comment(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    goto :goto_15

    :catch_14
    move-exception p0

    :goto_15
    return-void
.end method

.method public static language(Ljava/lang/Object;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 6

    .line 50
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "a"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 51
    invoke-virtual {p1}, Landroid/preference/Preference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {p2}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 52
    const-string p1, "0"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2e

    sget-object p1, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    goto :goto_48

    :cond_2e
    const-string p1, "1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    goto :goto_48

    :cond_39
    const-string p1, "2"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_44

    sget-object p1, Ljava/util/Locale;->TAIWAN:Ljava/util/Locale;

    goto :goto_48

    :cond_44
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    .line 53
    :goto_48
    new-instance p2, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    invoke-virtual {p2, p1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 54
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 55
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string v1, "nicoid_settings_position"

    invoke-virtual {p1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2

    const-string v1, "nicoid_settings_offset"

    invoke-virtual {p1}, Landroid/widget/ListView;->getChildCount()I

    move-result v2

    if-nez v2, :cond_83

    const/4 p1, 0x0

    goto :goto_8b

    :cond_83
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    :goto_8b
    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 56
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Le/e/a/Review181$$ExternalSyntheticLambda4;

    invoke-direct {p2, p0}, Le/e/a/Review181$$ExternalSyntheticLambda4;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a1} :catch_a3

    const/4 p0, 0x1

    return p0

    .line 57
    :catch_a3
    move-exception p0

    const-string p1, "nicoid-settings"

    const-string p2, "Unable to update language"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method static latest()Lorg/json/JSONObject;
    .registers 3

    .line 81
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "e.e.a.ModernPlayback"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "latestWatch"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_14

    return-object v1

    :catch_14
    move-exception v1

    return-object v0
.end method

.method static named(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_12

    const/4 p0, 0x0

    goto :goto_16

    :cond_12
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_16
    return-object p0
.end method

.method static overlayButton(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/Button;
    .registers 4

    .line 125
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result p0

    const p1, 0xffffff

    and-int/2addr p0, p1

    const/high16 p1, 0x55000000

    or-int/2addr p0, p1

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinimumWidth(I)V

    return-object v0
.end method

.method static overlayText(Landroid/app/Activity;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 5

    .line 124
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p0, -0x1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const-string p0, "nicoid-media-overlay"

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/high16 p0, 0x3f800000    # 1.0f

    const/high16 p1, -0x1000000

    const/high16 p2, 0x40400000    # 3.0f

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p0, p1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    return-object v0
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 48
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    const/4 p0, 0x0

    return-object p0

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_10

    return-object p0

    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/Review181;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static portraitFullscreen(Ljava/lang/Object;)Z
    .registers 15

    invoke-static {p0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return v0

    .line 83
    :cond_8
    const-string v0, "B0"

    const-string v1, "ss"

    const/4 v2, 0x0

    :try_start_d
    const-string v3, "A1"

    invoke-static {p0, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {}, Le/e/a/Review181;->latest()Lorg/json/JSONObject;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_1e

    move-object v6, v5

    goto :goto_24

    :cond_1e
    const-string v6, "video"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    :goto_24
    const-string v7, "b0"

    invoke-static {p0, v7}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 84
    invoke-static {v3}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_3d

    invoke-static {v3}, Le/e/a/ModernShorts;->normalPlayer(Landroid/app/Activity;)V

    return v9

    .line 85
    :cond_3d
    invoke-virtual {v7, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_41} :catch_134

    .line 86
    const-string v10, "height"

    const-string v11, "width"

    if-nez v8, :cond_6a

    if-eqz v6, :cond_6a

    :try_start_49
    invoke-static {v4, v7}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6a

    const-string v12, "resolution"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    if-eqz v12, :cond_6a

    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v13

    if-le v8, v13, :cond_69

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    if-lez v8, :cond_69

    const/4 v8, 0x1

    goto :goto_6a

    :cond_69
    const/4 v8, 0x0

    .line 87
    :cond_6a
    :goto_6a
    if-nez v8, :cond_bf

    if-eqz v4, :cond_bf

    if-eqz v6, :cond_bf

    invoke-static {v4, v7}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_bf

    const-string v6, "media"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_80

    move-object v4, v5

    goto :goto_86

    :cond_80
    const-string v6, "domand"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    :goto_86
    if-nez v4, :cond_89

    :goto_88
    goto :goto_90

    :cond_89
    const-string v5, "videos"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    goto :goto_88

    :goto_90
    if-eqz v5, :cond_bf

    const/4 v4, 0x0

    :goto_93
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v4, v6, :cond_9a

    goto :goto_bf

    :cond_9a
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_bc

    const-string v12, "isAvailable"

    invoke-virtual {v6, v12, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_bc

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    if-lez v12, :cond_bc

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    if-le v4, v5, :cond_ba

    const/4 v8, 0x1

    goto :goto_bf

    :cond_ba
    const/4 v8, 0x0

    goto :goto_bf

    :cond_bc
    add-int/lit8 v4, v4, 0x1

    goto :goto_93

    .line 88
    :cond_bf
    :goto_bf
    if-nez v8, :cond_c2

    return v2

    .line 89
    :cond_c2
    invoke-static {v3}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v4

    if-nez v4, :cond_e7

    invoke-virtual {v7, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e7

    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_disable_shorts"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_re_shorts"

    invoke-virtual {p0, v0, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v3, v9}, Landroid/app/Activity;->setRequestedOrientation(I)V

    invoke-static {v3}, Le/e/a/ModernShorts;->attach(Landroid/app/Activity;)V

    return v9

    .line 91
    :cond_e7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f7

    const/4 v1, 0x0

    goto :goto_f8

    :cond_f7
    const/4 v1, 0x1

    :goto_f8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "C0"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 92
    invoke-virtual {v3, v9}, Landroid/app/Activity;->setRequestedOrientation(I)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "i"

    new-array v4, v9, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v9, [Ljava/lang/Object;

    if-eqz v1, :cond_129

    const/4 v1, 0x2

    goto :goto_12a

    :cond_129
    const/4 v1, 0x4

    :goto_12a
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v2

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_133} :catch_134

    return v9

    .line 93
    :catch_134
    move-exception p0

    return v2
.end method

.method public static restorePosition(Ljava/lang/Object;)V
    .registers 11

    .line 80
    const-string v0, "nicoid_resume_position"

    :try_start_2
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15

    return-void

    :cond_15
    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getDuration"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    const-wide/16 v6, 0x0

    cmp-long v8, v3, v6

    if-gtz v8, :cond_3b

    return-void

    :cond_3b
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    invoke-virtual {v8, v0, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "k0"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    const-wide/32 v7, 0x7fffffff

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v8, v7

    invoke-virtual {v6, p0, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v6, "seekTo"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, v5

    invoke-virtual {p0, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v6, v5

    invoke-virtual {p0, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_83} :catch_84

    goto :goto_8c

    :catch_84
    move-exception p0

    const-string v0, "nicoid-player"

    const-string v1, "Unable to restore playback position"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_8c
    return-void
.end method

.method private static seekLabel(Landroid/content/Context;I)Ljava/lang/String;
    .registers 5

    .line 45
    if-nez p1, :cond_d

    const-string p1, "Off"

    const-string v0, "\u95dc\u9589"

    const-string v1, "\u7121\u52b9"

    invoke-static {p0, v1, p1, v0}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_28

    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " s"

    const-string v1, " \u79d2"

    const-string v2, "\u79d2"

    invoke-static {p0, v2, p1, v1}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_28
    return-object p0
.end method

.method private static seekSeconds(Landroid/content/Context;)I
    .registers 3

    .line 44
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "double_tap_seek_seconds"

    const-string v1, "10"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    return p0

    :catch_11
    move-exception p0

    const/16 p0, 0xa

    return p0
.end method

.method private static seekSlider(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
    .registers 9

    .line 47
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x18

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v2, ""

    const/16 v3, 0x16

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/SeekBar;

    invoke-direct {v3, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x3c

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setMax(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Le/e/a/Review181$1;

    invoke-direct {v4, v2, v0}, Le/e/a/Review181$1;-><init>(Landroid/widget/TextView;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-static {p0}, Le/e/a/Review181;->seekSeconds(Landroid/content/Context;)I

    move-result v4

    invoke-static {v4}, Le/e/a/SeekRules;->progress(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v4}, Le/e/a/SeekRules;->seconds(I)I

    move-result v4

    invoke-static {v0, v4}, Le/e/a/Review181;->seekLabel(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "OK"

    const-string v4, "\u78ba\u5b9a"

    invoke-static {v0, v2, v2, v4}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Le/e/a/Review181$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0, p1, v3}, Le/e/a/Review181$$ExternalSyntheticLambda5;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/widget/SeekBar;)V

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Cancel"

    const-string v1, "\u53d6\u6d88"

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0, v2, p1, v1}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Reset to default"

    const-string v2, "\u9084\u539f\u9810\u8a2d\u503c"

    const-string v4, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306b\u623b\u3059"

    invoke-static {v0, v4, p1, v2}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p1, -0x3

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Le/e/a/Review181$$ExternalSyntheticLambda6;

    invoke-direct {p1, v3}, Le/e/a/Review181$$ExternalSyntheticLambda6;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private static seekSummary(Landroid/content/Context;Landroid/preference/Preference;)V
    .registers 6

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/Review181;->seekSeconds(Landroid/content/Context;)I

    move-result v1

    invoke-static {p0, v1}, Le/e/a/Review181;->seekLabel(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Right to skip forward, left to rewind"

    const-string v2, "\u53f3\u5074\u5feb\u8f49\uff0c\u5de6\u5074\u5012\u8f49"

    const-string v3, "\u53f3\u5074\u3067\u65e9\u9001\u308a\u3001\u5de6\u5074\u3067\u5dfb\u304d\u623b\u3057"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static seekTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-static {p0, p1}, Le/e/a/PlayerGestures219;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static seekTouchLegacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 19

    .line 60
    move-object/from16 v0, p0

    sget-object v1, Le/e/a/Review181;->TAPS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Review181$Taps;

    if-nez v1, :cond_17

    new-instance v1, Le/e/a/Review181$Taps;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Le/e/a/Review181$Taps;-><init>(Le/e/a/Review181$Taps;)V

    sget-object v2, Le/e/a/Review181;->TAPS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    iget-boolean v2, v1, Le/e/a/Review181$Taps;->cancelling:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1d

    return v3

    .line 61
    :cond_1d
    const-wide/16 v4, 0x0

    :try_start_1f
    const-string v2, "v"

    invoke-static {v0, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v6, "a0"

    invoke-static {v2, v6}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/view/View;

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 62
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v8

    .line 63
    const/4 v9, 0x3

    const/4 v10, 0x1

    if-nez v8, :cond_189

    .line 64
    iput-boolean v3, v1, Le/e/a/Review181$Taps;->valid:Z

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->second:Z

    .line 65
    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v8

    if-eqz v8, :cond_188

    invoke-virtual {v6, v7}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v8

    if-eqz v8, :cond_188

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    float-to-int v8, v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v11

    float-to-int v11, v11

    invoke-virtual {v7, v8, v11}, Landroid/graphics/Rect;->contains(II)Z

    move-result v8

    if-eqz v8, :cond_188

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v12

    invoke-static {v8, v11, v12, v6}, Le/e/a/Review181;->control(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_73

    goto/16 :goto_188

    .line 66
    :cond_73
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v8, "double_tap_seek_seconds"

    const-string v11, "10"

    invoke-interface {v6, v8, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-gtz v6, :cond_86

    return v3

    .line 67
    :cond_86
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v7

    cmpg-float v7, v8, v7

    if-gez v7, :cond_94

    const/4 v7, -0x1

    goto :goto_95

    :cond_94
    const/4 v7, 0x1

    .line 68
    :goto_95
    if-lez v6, :cond_d4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v11

    iget-wide v13, v1, Le/e/a/Review181$Taps;->up:J

    sub-long/2addr v11, v13

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v8

    int-to-long v13, v8

    cmp-long v8, v11, v13

    if-gtz v8, :cond_d4

    iget-wide v11, v1, Le/e/a/Review181$Taps;->up:J

    cmp-long v8, v11, v4

    if-eqz v8, :cond_d4

    iget v8, v1, Le/e/a/Review181$Taps;->side:I

    if-ne v8, v7, :cond_d4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget v11, v1, Le/e/a/Review181$Taps;->x:F

    sub-float/2addr v8, v11

    float-to-double v11, v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget v13, v1, Le/e/a/Review181$Taps;->y:F

    sub-float/2addr v8, v13

    float-to-double v13, v8

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v11

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v8

    int-to-double v13, v8

    cmpg-double v8, v11, v13

    if-gez v8, :cond_d4

    const/4 v8, 0x1

    goto :goto_d5

    :cond_d4
    const/4 v8, 0x0

    :goto_d5
    iput-boolean v8, v1, Le/e/a/Review181$Taps;->second:Z

    .line 69
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iput v8, v1, Le/e/a/Review181$Taps;->x:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iput v8, v1, Le/e/a/Review181$Taps;->y:F

    iput v7, v1, Le/e/a/Review181$Taps;->side:I

    iput-boolean v10, v1, Le/e/a/Review181$Taps;->valid:Z

    .line 70
    iget-boolean v8, v1, Le/e/a/Review181$Taps;->second:Z

    if-eqz v8, :cond_187

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v11, "getCurrentPosition"

    new-array v12, v3, [Ljava/lang/Class;

    invoke-virtual {v8, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v11, v3, [Ljava/lang/Object;

    invoke-virtual {v8, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v13, "getDuration"

    new-array v14, v3, [Ljava/lang/Class;

    invoke-virtual {v8, v13, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v13, v3, [Ljava/lang/Object;

    invoke-virtual {v8, v2, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v13

    cmp-long v8, v13, v4

    if-gtz v8, :cond_124

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->valid:Z

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->second:Z

    return v3

    :cond_124
    move v15, v7

    move/from16 v16, v6

    invoke-static/range {v11 .. v16}, Le/e/a/SeekFeedback219;->target(JJII)J

    move-result-wide v11

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v13, "seekTo"

    new-array v14, v10, [Ljava/lang/Class;

    sget-object v15, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v15, v14, v3

    invoke-virtual {v8, v13, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v13, v10, [Ljava/lang/Object;

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v13, v3

    invoke-virtual {v8, v2, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    if-lez v7, :cond_14d

    const-string v7, "+"

    goto :goto_14f

    :cond_14d
    const-string v7, "\u2212"

    :goto_14f
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " s"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v3}, Le/e/a/SeekFeedback219;->toast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    iput-wide v4, v1, Le/e/a/Review181$Taps;->up:J

    .line 71
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/view/MotionEvent;->setAction(I)V

    iput-boolean v10, v1, Le/e/a/Review181$Taps;->cancelling:Z
    :try_end_176
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_176} :catch_1e5

    :try_start_176
    invoke-virtual {v0, v2}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_179
    .catchall {:try_start_176 .. :try_end_179} :catchall_17f

    :try_start_179
    iput-boolean v3, v1, Le/e/a/Review181$Taps;->cancelling:Z

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    return v10

    :catchall_17f
    move-exception v0

    move-object v6, v0

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->cancelling:Z

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    throw v6

    .line 72
    :cond_187
    return v3

    .line 65
    :cond_188
    :goto_188
    return v3

    .line 74
    :cond_189
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-gt v2, v10, :cond_1b5

    if-eq v8, v9, :cond_1b5

    const/4 v2, 0x2

    if-ne v8, v2, :cond_1b9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v6, v1, Le/e/a/Review181$Taps;->x:F

    sub-float/2addr v2, v6

    float-to-double v6, v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iget v9, v1, Le/e/a/Review181$Taps;->y:F

    sub-float/2addr v2, v9

    float-to-double v11, v2

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-double v11, v0

    cmpl-double v0, v6, v11

    if-lez v0, :cond_1b9

    :cond_1b5
    iput-boolean v3, v1, Le/e/a/Review181$Taps;->valid:Z

    iput-wide v4, v1, Le/e/a/Review181$Taps;->up:J

    .line 75
    :cond_1b9
    iget-boolean v0, v1, Le/e/a/Review181$Taps;->second:Z

    .line 76
    if-ne v8, v10, :cond_1e4

    iget-boolean v2, v1, Le/e/a/Review181$Taps;->valid:Z

    if-eqz v2, :cond_1de

    iget-boolean v2, v1, Le/e/a/Review181$Taps;->second:Z

    if-nez v2, :cond_1de

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v2

    int-to-long v8, v2

    cmp-long v2, v6, v8

    if-gez v2, :cond_1de

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    iput-wide v6, v1, Le/e/a/Review181$Taps;->up:J

    goto :goto_1e0

    :cond_1de
    iput-wide v4, v1, Le/e/a/Review181$Taps;->up:J

    :goto_1e0
    iput-boolean v3, v1, Le/e/a/Review181$Taps;->second:Z

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->valid:Z
    :try_end_1e4
    .catch Ljava/lang/Exception; {:try_start_179 .. :try_end_1e4} :catch_1e5

    .line 77
    :cond_1e4
    return v0

    .line 78
    :catch_1e5
    move-exception v0

    iput-wide v4, v1, Le/e/a/Review181$Taps;->up:J

    iput-boolean v3, v1, Le/e/a/Review181$Taps;->second:Z

    return v3
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 11

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->settings(Landroid/preference/PreferenceActivity;)V

    .line 23
    invoke-static {p0}, Le/e/a/SettingsIntegrity;->ensure(Landroid/preference/PreferenceActivity;)V

    .line 24
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 25
    const-string v1, "comment_fps"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 26
    instance-of v2, v1, Landroid/preference/ListPreference;

    const/4 v3, 0x0

    if-eqz v2, :cond_5b

    .line 27
    check-cast v1, Landroid/preference/ListPreference;

    .line 28
    const/4 v2, 0x5

    new-array v4, v2, [Ljava/lang/CharSequence;

    const-string v5, "25fps"

    aput-object v5, v4, v3

    const-string v5, "30fps"

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-string v5, "60fps"

    const/4 v7, 0x2

    aput-object v5, v4, v7

    const-string v5, "90fps"

    const/4 v8, 0x3

    aput-object v5, v4, v8

    const-string v5, "120fps"

    const/4 v9, 0x4

    aput-object v5, v4, v9

    invoke-virtual {v1, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 29
    new-array v2, v2, [Ljava/lang/CharSequence;

    const-string v4, "25"

    aput-object v4, v2, v3

    const-string v4, "30"

    aput-object v4, v2, v6

    const-string v4, "60"

    aput-object v4, v2, v7

    const-string v4, "90"

    aput-object v4, v2, v8

    const-string v4, "120"

    aput-object v4, v2, v9

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 30
    const-string v2, "Set the comment-rendering frame-rate limit. Actual performance depends on the device and display refresh rate."

    const-string v4, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u5e40\u7387\u4e0a\u9650\u3002\u5be6\u969b\u5e40\u7387\u53d6\u6c7a\u65bc\u88dd\u7f6e\u6548\u80fd\u8207\u87a2\u5e55\u66f4\u65b0\u7387\u3002"

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u63cf\u753b\u306e\u4e0a\u9650\u3092\u9078\u629e\u3057\u307e\u3059\u3002\u5b9f\u969b\u306e\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u306f\u7aef\u672b\u6027\u80fd\u3068\u753b\u9762\u306e\u66f4\u65b0\u983b\u5ea6\u306b\u4f9d\u5b58\u3057\u307e\u3059\u3002"

    invoke-static {p0, v5, v2, v4}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 32
    :cond_5b
    const-string v1, "gesture_volume"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 33
    if-eqz v1, :cond_6a

    invoke-static {v0, v1}, Le/e/a/Review181;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_6a

    move-object v0, v1

    .line 34
    :cond_6a
    const-string v1, "double_tap_seek_seconds"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 35
    if-eqz v2, :cond_7f

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-static {v4, v2}, Le/e/a/Review181;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v4

    if-eqz v4, :cond_7f

    invoke-virtual {v4, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 36
    :cond_7f
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 37
    const-string v1, "Double tap to seek"

    const-string v4, "\u8f15\u89f8\u5169\u6b21\u8df3\u8f49"

    const-string v5, "\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u3067\u30b7\u30fc\u30af"

    invoke-static {p0, v5, v1, v4}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 38
    invoke-static {p0, v2}, Le/e/a/Review181;->seekSummary(Landroid/content/Context;Landroid/preference/Preference;)V

    .line 39
    new-instance v1, Le/e/a/Review181$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v2}, Le/e/a/Review181$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 40
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, -0x1

    const-string v2, "nicoid_settings_position"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v4, "nicoid_settings_offset"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 41
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 42
    if-ltz v0, :cond_cc

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object v2

    new-instance v3, Le/e/a/Review181$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v0, v1}, Le/e/a/Review181$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;II)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 43
    :cond_cc
    return-void
.end method

.method public static shortControls(Landroid/app/Activity;IF)V
    .registers 4

    .line 105
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 106
    if-nez p0, :cond_b

    const/4 p0, 0x0

    goto :goto_11

    :cond_b
    const-string v0, "nicoid_short_metadata"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 107
    :goto_11
    if-nez p0, :cond_14

    return-void

    .line 108
    :cond_14
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_1d

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 109
    :cond_1d
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_28

    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 110
    :cond_28
    return-void
.end method

.method public static shortOverlay(Landroid/app/Activity;)V
    .registers 15

    .line 112
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const-string v1, "nicoid_short_metadata"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_12

    return-void

    .line 113
    :cond_12
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v0, 0x8

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 114
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0xc

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v4, v6, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v4, "nicoid-media-overlay"

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v6, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v7, 0x2

    new-array v8, v7, [I

    const/high16 v9, -0x4d000000

    const/4 v10, 0x1

    aput v9, v8, v10

    invoke-direct {v4, v6, v8}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 115
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v4, 0xe

    const-string v6, ""

    invoke-static {p0, v6, v4}, Le/e/a/Review181;->overlayText(Landroid/app/Activity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, -0x2

    invoke-direct {v4, v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v9, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    invoke-static {p0, v6, v1}, Le/e/a/Review181;->overlayText(Landroid/app/Activity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    const-string v4, "Enter a comment\u2026"

    const-string v6, "\u8f38\u5165\u7559\u8a00\u2026"

    const-string v7, "\u30b3\u30e1\u30f3\u30c8\u3092\u5165\u529b\u2026"

    invoke-static {p0, v7, v4, v6}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0xd

    invoke-static {p0, v4, v6}, Le/e/a/Review181;->overlayText(Landroid/app/Activity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    const/16 v6, 0x12

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v4, v7, v11, v6, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v6, 0x55000000

    const/16 v7, 0x1c

    invoke-static {p0, v6, v7}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-static {p0, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const v10, 0x66ffffff

    invoke-virtual {v6, v7, v10}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v6, Le/e/a/Review181$$ExternalSyntheticLambda2;

    invoke-direct {v6, p0}, Le/e/a/Review181$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-direct {v4, v3, v13, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v3, 0x7c

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v2, v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    new-instance v0, Le/e/a/Review181$2;

    move-object v3, v0

    move-object v4, p0

    move-object v5, v2

    move-object v6, v9

    move-object v7, v1

    invoke-direct/range {v3 .. v8}, Le/e/a/Review181$2;-><init>(Landroid/app/Activity;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 120
    new-instance p0, Le/e/a/Review181$3;

    invoke-direct {p0, v2, v0}, Le/e/a/Review181$3;-><init>(Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V

    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 121
    return-void
.end method

.method public static shortTap(Landroid/app/Activity;Landroid/view/MotionEvent;)V
    .registers 7

    .line 95
    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_a5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v1, :cond_a5

    .line 96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v2

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_27

    goto/16 :goto_a5

    .line 98
    :cond_27
    :try_start_27
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "a0"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/view/View;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 99
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v3

    if-eqz v3, :cond_9b

    invoke-virtual {v1, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v3

    if-eqz v3, :cond_9b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_9b

    .line 100
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    invoke-static {p0, v2, p1, v1}, Le/e/a/Review181;->control(Landroid/view/View;FFLandroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_6e

    goto :goto_9b

    .line 101
    :cond_6e
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string p1, "isPlaying"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_a4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string p1, "start"

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_9a} :catch_9c

    .line 102
    goto :goto_a4

    .line 100
    :cond_9b
    :goto_9b
    return-void

    .line 102
    :catch_9c
    move-exception p0

    const-string p1, "nicoid-player"

    const-string v0, "Unable to resume tapped short"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 103
    :cond_a4
    :goto_a4
    return-void

    .line 96
    :cond_a5
    :goto_a5
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 19
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
