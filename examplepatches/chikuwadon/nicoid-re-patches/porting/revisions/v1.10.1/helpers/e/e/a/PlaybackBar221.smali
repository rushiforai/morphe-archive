.class public final Le/e/a/PlaybackBar221;
.super Ljava/lang/Object;
.source "PlaybackBar221.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackBar221$Binding;
    }
.end annotation


# static fields
.field private static final CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private static application:Landroid/app/Application;

.field private static foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static mediaField:Ljava/lang/reflect/Field;

.field private static shown:Le/e/a/PlaybackBar221$Binding;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackBar221;->foreground:Ljava/lang/ref/WeakReference;

    .line 18
    new-instance v0, Le/e/a/PlaybackBar221$1;

    invoke-direct {v0}, Le/e/a/PlaybackBar221$1;-><init>()V

    sput-object v0, Le/e/a/PlaybackBar221;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/ref/WeakReference;)V
    .registers 1

    .line 16
    sput-object p0, Le/e/a/PlaybackBar221;->foreground:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$1()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 16
    sget-object v0, Le/e/a/PlaybackBar221;->foreground:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2()Le/e/a/PlaybackBar221$Binding;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    return-object v0
.end method

.method static background(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x0

    .line 31
    :try_start_1
    instance-of v1, p0, Landroid/app/Service;

    if-eqz v1, :cond_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "p0"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_18

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :catch_18
    :cond_18
    return v0
.end method

.method static button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;
    .registers 7

    .line 44
    new-instance v0, Landroid/widget/Button;

    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 p1, 0x41900000    # 18.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    sget-object p2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setElevation(F)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    const v2, 0xffffff

    and-int/2addr p0, v2

    const/high16 v2, 0x33000000

    or-int/2addr p0, v2

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-direct {v1, p0, v2, p2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static media()Ljava/lang/Object;
    .registers 3

    const/4 v0, 0x0

    .line 33
    :try_start_1
    sget-object v1, Le/e/a/PlaybackBar221;->mediaField:Ljava/lang/reflect/Field;

    if-nez v1, :cond_17

    const-string v1, "e.e.a.MediaControls"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "active"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Le/e/a/PlaybackBar221;->mediaField:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_17
    sget-object v1, Le/e/a/PlaybackBar221;->mediaField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1d} :catch_1d

    :catch_1d
    return-object v0
.end method

.method static player(Landroid/app/Activity;)Z
    .registers 3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    :goto_4
    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_4
.end method

.method public static refresh()V
    .registers 10

    invoke-static {}, Le/e/a/DirectBackground235;->refresh()V

    invoke-static {}, Le/e/a/TabRoutes228;->settingsForeground()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    return-void

    :cond_d
    invoke-static {}, Le/e/a/MiniSession225;->showing()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    return-void

    .line 36
    :cond_17
    const-string v0, "null"

    :try_start_19
    sget-object v1, Le/e/a/PlaybackBar221;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/InfoPlayback223;->clean(Landroid/app/Activity;)V

    invoke-static {}, Le/e/a/PlaybackBar221;->media()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_2d

    move-object v4, v3

    goto :goto_33

    :cond_2d
    const-string v4, "owner"

    invoke-static {v2, v4}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    :goto_33
    if-eqz v1, :cond_10a

    .line 37
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_10a

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v5

    if-nez v5, :cond_10a

    invoke-static {v1}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v5

    if-nez v5, :cond_10a

    invoke-static {v4}, Le/e/a/PlaybackBar221;->background(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4f

    goto/16 :goto_10a

    .line 38
    :cond_4f
    const-string v5, "f"

    invoke-static {v4, v5}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "e"

    invoke-static {v4, v6}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_106

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_69

    goto/16 :goto_106

    .line 39
    :cond_69
    sget-object v7, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    if-eqz v7, :cond_77

    iget-object v7, v7, Le/e/a/PlaybackBar221$Binding;->activity:Landroid/app/Activity;

    if-ne v7, v1, :cond_77

    sget-object v7, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    iget-object v7, v7, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    if-eq v7, v4, :cond_81

    :cond_77
    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    new-instance v7, Le/e/a/PlaybackBar221$Binding;

    invoke-direct {v7, v1, v4}, Le/e/a/PlaybackBar221$Binding;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    sput-object v7, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    .line 40
    :cond_81
    sget-object v4, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    const-string v7, "title"

    invoke-static {v2, v7}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_9b

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9a

    goto :goto_9b

    :cond_9a
    move-object v5, v7

    :cond_9b
    :goto_9b
    iget-object v0, v4, Le/e/a/PlaybackBar221$Binding;->title:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v7, "isPlaying"

    const/4 v8, 0x0

    new-array v9, v8, [Ljava/lang/Class;

    invoke-virtual {v5, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v5, v4, Le/e/a/PlaybackBar221$Binding;->play:Landroid/widget/Button;

    if-eqz v0, :cond_c0

    const-string v6, "\u2161"

    goto :goto_c2

    :cond_c0
    const-string v6, "\u25b6"

    :goto_c2
    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, v4, Le/e/a/PlaybackBar221$Binding;->play:Landroid/widget/Button;

    if-eqz v0, :cond_cc

    const-string v6, "\u4e00\u6642\u505c\u6b62"

    goto :goto_ce

    :cond_cc
    const-string v6, "\u518d\u751f"

    :goto_ce
    if-eqz v0, :cond_d3

    const-string v7, "Pause"

    goto :goto_d5

    :cond_d3
    const-string v7, "Play"

    :goto_d5
    if-eqz v0, :cond_da

    const-string v0, "\u66ab\u505c"

    goto :goto_dc

    :cond_da
    const-string v0, "\u64ad\u653e"

    :goto_dc
    invoke-static {v1, v6, v7, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 42
    const-string v0, "notification"

    invoke-static {v2, v0}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/app/Notification;

    if-eqz v1, :cond_f1

    check-cast v0, Landroid/app/Notification;

    iget-object v3, v0, Landroid/app/Notification;->largeIcon:Landroid/graphics/Bitmap;

    :cond_f1
    if-eqz v3, :cond_fe

    iget-object v0, v4, Le/e/a/PlaybackBar221$Binding;->thumbnail:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, v4, Le/e/a/PlaybackBar221$Binding;->thumbnail:Landroid/widget/ImageView;

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_119

    :cond_fe
    iget-object v0, v4, Le/e/a/PlaybackBar221$Binding;->thumbnail:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_119

    .line 38
    :cond_106
    :goto_106
    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    return-void

    .line 37
    :cond_10a
    :goto_10a
    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V
    :try_end_10d
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_10d} :catch_10e

    return-void

    :catch_10e
    move-exception v0

    .line 43
    const-string v1, "nicoid-bar"

    const-string v2, "Cannot refresh playback controls"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    :goto_119
    return-void
.end method

.method static remove()V
    .registers 1

    .line 60
    sget-object v0, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Le/e/a/PlaybackBar221$Binding;->dispose()V

    const/4 v0, 0x0

    sput-object v0, Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;

    :cond_a
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 11

    .line 58
    const-string v0, "back_playback"

    const-string v1, "app_switch_playback"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_a
    const/4 v3, 0x2

    if-lt v2, v3, :cond_e

    return-void

    :cond_e
    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    instance-of v4, v3, Landroid/preference/ListPreference;

    if-nez v4, :cond_19

    goto :goto_53

    :cond_19
    check-cast v3, Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v4, :cond_53

    if-eqz v5, :cond_53

    array-length v6, v4

    array-length v7, v5

    if-eq v6, v7, :cond_2c

    goto :goto_53

    :cond_2c
    invoke-virtual {v5}, [Ljava/lang/CharSequence;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/CharSequence;

    const/4 v6, 0x0

    :goto_33
    array-length v7, v4

    if-lt v6, v7, :cond_3a

    invoke-virtual {v3, v5}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    goto :goto_53

    :cond_3a
    const-string v7, "background"

    aget-object v8, v4, v6

    invoke-virtual {v7, v8}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_50

    const-string v7, "Background playback"

    const-string v8, "\u80cc\u666f\u64ad\u653e"

    const-string v9, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static {p0, v9, v7, v8}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    :cond_50
    add-int/lit8 v6, v6, 0x1

    goto :goto_33

    :cond_53
    :goto_53
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method static toggle(Ljava/lang/Object;)V
    .registers 6

    .line 59
    :try_start_0
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "isPlaying"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz v0, :cond_28

    const-string v0, "pause"

    goto :goto_2a

    :cond_28
    const-string v0, "start"

    :goto_2a
    new-array v2, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_38} :catch_39

    goto :goto_41

    :catch_39
    move-exception p0

    const-string v0, "nicoid-bar"

    const-string v1, "Cannot toggle playback"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_41
    return-void
.end method

.method public static track(Landroid/app/Activity;)V
    .registers 3

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->initialize(Landroid/content/Context;)V

    if-eqz p0, :cond_8

    invoke-static {p0}, Le/e/a/MultiTabs227;->track(Landroid/app/Activity;)V

    :cond_8
    if-eqz p0, :cond_d

    invoke-static {p0}, Le/e/a/MiniSession225;->track(Landroid/app/Activity;)V

    :cond_d
    if-eqz p0, :cond_2d

    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    if-nez v0, :cond_16

    goto :goto_2d

    :cond_16
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    sget-object v0, Le/e/a/PlaybackBar221;->application:Landroid/app/Application;

    if-ne v0, p0, :cond_1f

    return-void

    :cond_1f
    if-eqz v0, :cond_26

    sget-object v1, Le/e/a/PlaybackBar221;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_26
    sput-object p0, Le/e/a/PlaybackBar221;->application:Landroid/app/Application;

    sget-object v0, Le/e/a/PlaybackBar221;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_2d
    :goto_2d
    return-void
.end method
