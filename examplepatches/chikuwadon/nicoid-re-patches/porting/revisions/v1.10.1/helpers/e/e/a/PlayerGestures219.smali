.class public final Le/e/a/PlayerGestures219;
.super Ljava/lang/Object;
.source "PlayerGestures219.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerGestures219$State;
    }
.end annotation


# static fields
.field public static final EXIT:Ljava/lang/String; = "gesture_swipe_exit_fullscreen"

.field public static final FULL:Ljava/lang/String; = "gesture_swipe_fullscreen"

.field private static final MAIN:Landroid/os/Handler;

.field public static final MINI:Ljava/lang/String; = "gesture_swipe_background"

.field public static final POPUP:Ljava/lang/String; = "gesture_swipe_popup"

.field public static final QUIET:Ljava/lang/String; = "gesture_quiet_controls"

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/PlayerGestures219$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 6
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    .line 80
    invoke-virtual {p0, p2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/preference/CheckBoxPreference;

    invoke-direct {v0, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    invoke-static {p0, p3, p4, p5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0, p6, p7, p8}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static cancelCallback(Le/e/a/PlayerGestures219$State;)V
    .registers 3

    .line 66
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    if-eqz v0, :cond_e

    sget-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    :cond_e
    return-void
.end method

.method static cancelNative(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    .registers 4

    .line 71
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p2

    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    :try_start_8
    invoke-static {p0, p1, p2}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_f

    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    return-void

    :catchall_f
    move-exception p0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    throw p0
.end method

.method static cancelSingle(Le/e/a/PlayerGestures219$State;)V
    .registers 4

    .line 21
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    sget-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    :cond_e
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    if-eqz v0, :cond_19

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    :cond_19
    return-void
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 2

    .line 73
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    if-eqz v0, :cond_10

    invoke-static {v0}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v0}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    :cond_10
    invoke-static {p0}, Le/e/a/SeekFeedback219;->clear(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/FeedbackHud219;->clear(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    return-void
.end method

.method static findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 81
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_c

    return-object v0

    :cond_c
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_13

    return-object p0

    :cond_13
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_20

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_20

    return-object v2

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method static flag(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 3

    .line 13
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, p1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    return p0

    :catch_b
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method static flush(Le/e/a/PlayerGestures219$State;)V
    .registers 5

    .line 67
    invoke-static {p0}, Le/e/a/PlayerGestures219;->cancelCallback(Le/e/a/PlayerGestures219$State;)V

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    iget-object v2, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    const/4 v3, 0x0

    iput-object v3, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    iput-object v3, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    const/4 v3, 0x0

    iput-boolean v3, p0, Le/e/a/PlayerGestures219$State;->quiet:Z

    if-eqz v0, :cond_2f

    if-eqz v1, :cond_2f

    if-eqz v2, :cond_2f

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_2f

    invoke-static {v0, p0, v1}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    invoke-static {v0, p0, v2}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    :cond_2f
    if-eqz v1, :cond_34

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_34
    if-eqz v2, :cond_39

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    :cond_39
    return-void
.end method

.method public static fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "B0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "C0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    if-eqz p2, :cond_1e

    const/4 p1, 0x6

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x7

    :goto_1f
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static holding(Landroid/app/Activity;)Z
    .registers 2

    .line 62
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerGestures219$State;

    if-eqz p0, :cond_10

    iget-boolean p0, p0, Le/e/a/PlayerGestures219$State;->holding:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method static interactive(Landroid/view/View;FF)Z
    .registers 7

    .line 16
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

    if-eqz v2, :cond_56

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_56

    .line 17
    :cond_1c
    instance-of v0, p0, Landroid/widget/Button;

    const/4 v2, 0x1

    if-nez v0, :cond_55

    instance-of v0, p0, Landroid/widget/ImageButton;

    if-nez v0, :cond_55

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_55

    instance-of v0, p0, Landroid/widget/EditText;

    if-nez v0, :cond_55

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_38

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_38

    goto :goto_55

    .line 18
    :cond_38
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_54

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_43
    if-gez v0, :cond_46

    goto :goto_54

    :cond_46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/PlayerGestures219;->interactive(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_51

    return v2

    :cond_51
    add-int/lit8 v0, v0, -0x1

    goto :goto_43

    :cond_54
    :goto_54
    return v1

    .line 17
    :cond_55
    :goto_55
    return v2

    .line 16
    :cond_56
    :goto_56
    return v1
.end method

.method static legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 2

    .line 65
    invoke-static {p0, p1}, Le/e/a/Review181;->seekTouchLegacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method static owner(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 2

    .line 69
    :try_start_0
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    return-object p0

    :catch_7
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static pref(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 3

    .line 15
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "gesture_swipe_background"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->mini(Landroid/content/SharedPreferences;)Z

    move-result p0

    goto :goto_16

    :cond_11
    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    :goto_16
    return p0
.end method

.method static recycle(Le/e/a/PlayerGestures219$State;)V
    .registers 3

    .line 20
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    :cond_c
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    if-eqz v0, :cond_17

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    :cond_17
    return-void
.end method

.method static ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 10
    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_8

    :cond_4
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    :goto_8
    return-object p0
.end method

.method static replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    .registers 4

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/PlayerGestures219$State;->replaying:Z

    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {p0, p2}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_a

    iput-boolean v0, p1, Le/e/a/PlayerGestures219$State;->replaying:Z

    return-void

    :catchall_a
    move-exception p0

    iput-boolean v0, p1, Le/e/a/PlayerGestures219$State;->replaying:Z

    throw p0
.end method

.method static seek(Landroid/app/Activity;Ljava/lang/Object;I)Z
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "double_tap_seek_seconds"

    const-string v2, "10"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_10
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_10} :catch_11

    goto :goto_14

    :catch_11
    move-exception v0

    const/16 v0, 0xa

    :goto_14
    move v6, v0

    const/4 v0, 0x0

    if-gtz v6, :cond_19

    return v0

    :cond_19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getCurrentPosition"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getDuration"

    new-array v5, v0, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v0, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    const-wide/16 v7, 0x0

    cmp-long v5, v3, v7

    if-gtz v5, :cond_50

    return v0

    :cond_50
    move v5, p2

    invoke-static/range {v1 .. v6}, Le/e/a/SeekFeedback219;->target(JJII)J

    move-result-wide v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "seekTo"

    invoke-virtual {p2, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, ""

    invoke-static {p0, p1, v0}, Le/e/a/SeekFeedback219;->toast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    const/4 p0, 0x1

    return p0
.end method

.method static seekEnabled(Landroid/app/Activity;)Z
    .registers 4

    .line 63
    const/4 v0, 0x1

    :try_start_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "double_tap_seek_seconds"

    const-string v2, "10"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_16

    if-lez p0, :cond_14

    return v0

    :cond_14
    const/4 p0, 0x0

    return p0

    :catch_16
    move-exception p0

    return v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 12

    .line 74
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v1, "gesture_volume"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-nez v1, :cond_14

    move-object v1, v0

    .line 75
    :cond_14
    const-string v9, "Double taps and hold-to-speed preserve controls; single taps toggle them"

    const-string v10, "\u9023\u9ede\u8207\u9577\u6309\u52a0\u901f\u4fdd\u7559\u63a7\u5236\u9805\u72c0\u614b\uff0c\u55ae\u9ede\u958b\u95dc\u63a7\u5236\u9805"

    const-string v4, "gesture_quiet_controls"

    const-string v5, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u4e2d\u306b\u64cd\u4f5c\u90e8\u3092\u8868\u793a\u3057\u306a\u3044"

    const-string v6, "Keep controls hidden during gestures"

    const-string v7, "\u624b\u52e2\u64cd\u4f5c\u6642\u4e0d\u986f\u793a\u63a7\u5236\u9805"

    const-string v8, "\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u3068\u9577\u62bc\u3057\u500d\u901f\u3067\u306f\u64cd\u4f5c\u90e8\u3092\u958b\u304b\u305a\u3001\u5358\u30bf\u30c3\u30d7\u3067\u958b\u9589\u3057\u307e\u3059"

    move-object v2, p0

    move-object v3, v1

    invoke-static/range {v2 .. v10}, Le/e/a/PlayerGestures219;->add(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string v2, "gesture_swipe_fullscreen"

    const-string v3, "gesture_swipe_exit_fullscreen"

    const-string v4, "gesture_swipe_mini"

    const-string v5, "gesture_swipe_popup"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    :goto_34
    const/4 v4, 0x4

    if-lt v3, v4, :cond_6d

    .line 77
    const-string v0, "gesture_vertical_options"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_6c

    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "Vertical swipes"

    const-string v3, "\u4e0a\u4e0b\u6ed1\u52d5"

    const-string v4, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Background playback, popup playback and fullscreen"

    const-string v3, "\u80cc\u666f\u64ad\u653e\u3001\u61f8\u6d6e\u64ad\u653e\u8207\u5207\u63db\u5168\u87a2\u5e55"

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u30fb\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u30fb\u5168\u753b\u9762\u3078\u306e\u5207\u308a\u66ff\u3048"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/PlayerGestures219$2;

    invoke-direct {v0, p0}, Le/e/a/PlayerGestures219$2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 78
    :cond_6c
    return-void

    .line 76
    :cond_6d
    aget-object v4, v2, v3

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-static {v0, v4}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v5

    if-eqz v5, :cond_7c

    invoke-virtual {v5, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_7c
    add-int/lit8 v3, v3, 0x1

    goto :goto_34
.end method

.method public static startedHold(Ljava/lang/Object;)V
    .registers 3

    .line 60
    :try_start_0
    const-string v0, "activity"

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerGestures219$State;

    if-eqz p0, :cond_29

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->held:Z

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->holding:Z

    invoke-static {p0}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_20} :catch_21

    goto :goto_29

    :catch_21
    move-exception p0

    const-string v0, "nicoid-gesture"

    const-string v1, "Cannot track hold gesture"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_29
    :goto_29
    return-void
.end method

.method static state(Landroid/app/Activity;)Le/e/a/PlayerGestures219$State;
    .registers 3

    .line 14
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    if-nez v0, :cond_1c

    new-instance v0, Le/e/a/PlayerGestures219$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/PlayerGestures219$State;-><init>(Le/e/a/PlayerGestures219$State;)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Le/e/a/PlayerGestures219$State;->activity:Ljava/lang/ref/WeakReference;

    sget-object v1, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    return-object v0
.end method

.method public static stoppedHold(Ljava/lang/Object;)V
    .registers 3

    .line 61
    :try_start_0
    const-string v0, "activity"

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerGestures219$State;

    if-eqz p0, :cond_24

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->holding:Z
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    goto :goto_24

    :catch_1c
    move-exception p0

    const-string v0, "nicoid-gesture"

    const-string v1, "Cannot finish hold gesture"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_24
    :goto_24
    return-void
.end method

.method static swipeOptions(Landroid/preference/PreferenceActivity;)V
    .registers 1

    .line 79
    invoke-static {p0}, Le/e/a/VerticalSwipe226;->show(Landroid/preference/PreferenceActivity;)Landroid/app/AlertDialog;

    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 18

    .line 22
    move-object/from16 v1, p0

    invoke-static/range {p0 .. p1}, Le/e/a/HorizontalSeek233;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_a

    return v2

    :cond_a
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    const-string v3, "gesture_swipe_exit_fullscreen"

    const-string v4, "gesture_swipe_fullscreen"

    const-string v5, "gesture_quiet_controls"

    const-string v6, "gesture_swipe_popup"

    const/4 v7, 0x0

    if-nez v0, :cond_59

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_28

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_28
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v8

    if-nez v8, :cond_55

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_55

    invoke-static {v0}, Le/e/a/PlaybackDefaults229;->mini(Landroid/content/SharedPreferences;)Z

    move-result v8

    if-nez v8, :cond_55

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_55

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_55

    invoke-interface {v0, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_55

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_55
    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->state(Landroid/app/Activity;)Le/e/a/PlayerGestures219$State;

    move-result-object v0

    :cond_59
    move-object v8, v0

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->replaying:Z

    if-eqz v0, :cond_5f

    return v7

    .line 23
    :cond_5f
    :try_start_5f
    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->cancelling(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_66

    return v7

    :cond_66
    invoke-static/range {p0 .. p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_483

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_76

    move-object/from16 v4, p1

    goto/16 :goto_485

    .line 24
    :cond_76
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_84} :catch_48c

    .line 25
    const-string v10, "gesture_swipe_background"

    const/4 v11, 0x0

    if-nez v0, :cond_273

    .line 26
    :try_start_89
    const-string v0, "v"

    invoke-static {v1, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_92

    goto :goto_96

    :cond_92
    invoke-static {v0}, Le/e/a/PlayerGestures219;->video(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v11

    :goto_96
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 27
    const-string v14, "x0"

    invoke-static {v0, v14}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_f9

    if-eqz v11, :cond_f9

    invoke-virtual {v11}, Landroid/view/View;->isShown()Z

    move-result v14

    if-eqz v14, :cond_f9

    invoke-virtual {v11, v13}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v14

    if-eqz v14, :cond_f9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v14

    float-to-int v14, v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v15

    float-to-int v15, v15

    invoke-virtual {v13, v14, v15}, Landroid/graphics/Rect;->contains(II)Z

    move-result v14

    if-eqz v14, :cond_f9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v14

    iget v15, v13, Landroid/graphics/Rect;->left:I

    int-to-float v15, v15

    sub-float/2addr v14, v15

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v15

    iget v12, v13, Landroid/graphics/Rect;->top:I

    int-to-float v12, v12

    sub-float/2addr v15, v12

    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v14, v15, v12, v2, v9}, Le/e/a/GestureRules219;->start(FFFFF)Z

    move-result v2

    if-eqz v2, :cond_f9

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v12

    invoke-static {v2, v9, v12}, Le/e/a/PlayerGestures219;->interactive(Landroid/view/View;FF)Z

    move-result v2

    if-nez v2, :cond_f9

    const/4 v2, 0x1

    goto :goto_fa

    :cond_f9
    move v2, v7

    .line 28
    :goto_fa
    if-nez v2, :cond_108

    invoke-static {v8}, Le/e/a/PlayerGestures219;->flush(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 29
    :cond_108
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I
    :try_end_112
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_112} :catch_48c

    const-string v9, "B0"

    const/4 v12, 0x1

    if-ne v2, v12, :cond_11f

    :try_start_117
    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11f

    const/4 v2, 0x1

    goto :goto_120

    :cond_11f
    move v2, v7

    .line 30
    :goto_120
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v12

    iget v12, v12, Landroid/content/res/Configuration;->orientation:I

    const/4 v14, 0x2

    if-ne v12, v14, :cond_13d

    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_13b

    const-string v9, "r0"

    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_13d

    :cond_13b
    const/4 v9, 0x1

    goto :goto_13e

    :cond_13d
    move v9, v7

    .line 31
    :goto_13e
    if-eqz v2, :cond_148

    invoke-static {v1, v4}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_148

    const/4 v4, 0x1

    goto :goto_149

    :cond_148
    move v4, v7

    :goto_149
    if-eqz v2, :cond_15d

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v12

    if-nez v12, :cond_166

    invoke-static {v1, v10}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_166

    invoke-static {v1, v6}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_166

    :cond_15d
    if-eqz v9, :cond_168

    invoke-static {v1, v3}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_166

    goto :goto_168

    :cond_166
    const/4 v3, 0x1

    goto :goto_169

    :cond_168
    :goto_168
    move v3, v7

    .line 32
    :goto_169
    invoke-static {v1, v5}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_177

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_177

    const/4 v5, 0x1

    goto :goto_178

    :cond_177
    move v5, v7

    .line 33
    :goto_178
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    invoke-virtual {v13}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v9

    cmpg-float v6, v6, v9

    if-gez v6, :cond_186

    const/4 v6, -0x1

    goto :goto_187

    :cond_186
    const/4 v6, 0x1

    .line 34
    :goto_187
    if-eqz v5, :cond_1e0

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->seekEnabled(Landroid/app/Activity;)Z

    move-result v9

    if-eqz v9, :cond_1e0

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    if-eqz v9, :cond_1e0

    invoke-static {v8, v1}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v9

    if-eqz v9, :cond_1e0

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v9}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v0, :cond_1e0

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    invoke-static {v9}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v11, :cond_1e0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v9

    iget-wide v14, v8, Le/e/a/PlayerGestures219$State;->lastUp:J

    sub-long/2addr v9, v14

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v12

    int-to-long v14, v12

    cmp-long v9, v9, v14

    if-gtz v9, :cond_1e0

    iget v9, v8, Le/e/a/PlayerGestures219$State;->side:I

    if-ne v9, v6, :cond_1e0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    iget v10, v8, Le/e/a/PlayerGestures219$State;->x:F

    sub-float/2addr v9, v10

    float-to-double v9, v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v12

    iget v14, v8, Le/e/a/PlayerGestures219$State;->y:F

    sub-float/2addr v12, v14

    float-to-double v14, v12

    invoke-static {v9, v10, v14, v15}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v9

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v12

    int-to-double v14, v12

    cmpg-double v9, v9, v14

    if-gez v9, :cond_1e0

    const/4 v9, 0x1

    goto :goto_1e1

    :cond_1e0
    move v9, v7

    .line 35
    :goto_1e1
    if-eqz v9, :cond_201

    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v1, v11, v6}, Le/e/a/PlayerGestures219;->seek(Landroid/app/Activity;Ljava/lang/Object;I)Z

    move-result v0

    iput-boolean v0, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    iput-wide v2, v8, Le/e/a/PlayerGestures219$State;->time:J

    const/4 v0, 0x1

    iput-boolean v0, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->held:Z

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    const/4 v0, 0x1

    return v0

    .line 36
    :cond_201
    invoke-static {v8}, Le/e/a/PlayerGestures219;->flush(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    new-instance v9, Ljava/lang/ref/WeakReference;

    invoke-direct {v9, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v9, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    new-instance v9, Ljava/lang/ref/WeakReference;

    invoke-direct {v9, v11}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v9, v8, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    const-string v9, "b0"

    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Le/e/a/PlayerGestures219$State;->id:Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, v8, Le/e/a/PlayerGestures219$State;->x:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, v8, Le/e/a/PlayerGestures219$State;->y:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v9

    iput-wide v9, v8, Le/e/a/PlayerGestures219$State;->time:J

    iput v6, v8, Le/e/a/PlayerGestures219$State;->side:I

    iput-boolean v2, v8, Le/e/a/PlayerGestures219$State;->portrait:Z

    iput-boolean v4, v8, Le/e/a/PlayerGestures219$State;->upEnabled:Z

    iput-boolean v3, v8, Le/e/a/PlayerGestures219$State;->downEnabled:Z

    if-nez v4, :cond_23f

    if-eqz v3, :cond_252

    :cond_23f
    iget v0, v8, Le/e/a/PlayerGestures219$State;->x:F

    iget v2, v13, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v0, v2}, Le/e/a/GestureRules219;->center(FF)Z

    move-result v0

    if-eqz v0, :cond_252

    const/4 v0, 0x1

    goto :goto_253

    :cond_252
    move v0, v7

    :goto_253
    iput-boolean v0, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->held:Z

    iput-boolean v5, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    .line 37
    if-eqz v5, :cond_26a

    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    const/4 v0, 0x1

    return v0

    .line 38
    :cond_26a
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_272

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    :cond_272
    return v0

    .line 40
    :cond_273
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    iget-wide v4, v8, Le/e/a/PlayerGestures219$State;->time:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_286

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v2, :cond_286

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 41
    :cond_286
    const/4 v2, 0x5

    if-eq v0, v2, :cond_45a

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_45a

    const/4 v2, 0x3

    if-ne v0, v2, :cond_297

    move-object/from16 v4, p1

    goto/16 :goto_45c

    .line 42
    :cond_297
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v3, v8, Le/e/a/PlayerGestures219$State;->x:F

    sub-float/2addr v2, v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v4, v8, Le/e/a/PlayerGestures219$State;->y:F

    sub-float/2addr v3, v4

    .line 43
    const/4 v4, 0x2

    if-ne v0, v4, :cond_322

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    if-eqz v4, :cond_322

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v4, :cond_322

    const/4 v4, 0x0

    cmpg-float v4, v3, v4

    if-gez v4, :cond_2b8

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->upEnabled:Z

    goto :goto_2ba

    :cond_2b8
    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->downEnabled:Z

    .line 44
    :goto_2ba
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v12, 0x41c00000    # 24.0f

    mul-float/2addr v12, v9

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    cmpl-float v5, v5, v13

    if-gtz v5, :cond_31d

    if-nez v4, :cond_2da

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v12

    if-lez v5, :cond_2da

    move-object/from16 v4, p1

    goto :goto_31f

    .line 45
    :cond_2da
    if-eqz v4, :cond_31a

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/high16 v5, 0x41400000    # 12.0f

    mul-float/2addr v5, v9

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x40000000    # 2.0f

    mul-float/2addr v12, v13

    invoke-static {v5, v12}, Ljava/lang/Math;->max(FF)F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_31a

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v12, 0x3fcccccd    # 1.6f

    mul-float/2addr v5, v12

    cmpl-float v4, v4, v5

    if-lez v4, :cond_31a

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-nez v4, :cond_31a

    const/4 v4, 0x1

    iput-boolean v4, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V
    :try_end_314
    .catch Ljava/lang/Exception; {:try_start_117 .. :try_end_314} :catch_48c

    move-object/from16 v4, p1

    :try_start_316
    invoke-static {v1, v8, v4}, Le/e/a/PlayerGestures219;->cancelNative(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    goto :goto_324

    :cond_31a
    move-object/from16 v4, p1

    goto :goto_324

    .line 44
    :cond_31d
    move-object/from16 v4, p1

    :goto_31f
    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    goto :goto_324

    .line 43
    :cond_322
    move-object/from16 v4, p1

    .line 47
    :goto_324
    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-eqz v5, :cond_3a3

    const/4 v5, 0x1

    if-ne v0, v5, :cond_3a1

    iget-object v0, v8, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    invoke-static {v0}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    const/4 v5, 0x1

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    invoke-static {v2, v3, v0, v9}, Le/e/a/GestureRules219;->direction(FFFF)I

    move-result v0

    if-gez v0, :cond_346

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->upEnabled:Z

    goto :goto_34f

    :cond_346
    if-lez v0, :cond_34e

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->downEnabled:Z

    if-eqz v2, :cond_34e

    const/4 v2, 0x1

    goto :goto_34f

    :cond_34e
    move v2, v7

    :goto_34f
    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    if-eqz v2, :cond_3a1

    invoke-static {v8, v1}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_3a1

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->portrait:Z

    if-eqz v2, :cond_393

    if-lez v0, :cond_393

    invoke-static {v1, v10}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_37a

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_378

    invoke-static {v1, v6}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37a

    :cond_378
    move v0, v7

    goto :goto_37b

    :cond_37a
    const/4 v0, 0x1

    :goto_37b
    if-eqz v0, :cond_389

    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3a1

    :cond_389
    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    goto :goto_3a1

    :cond_393
    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    if-gez v0, :cond_39d

    const/4 v0, 0x1

    goto :goto_39e

    :cond_39d
    move v0, v7

    :goto_39e
    invoke-static {v1, v2, v0}, Le/e/a/PlayerGestures219;->fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V

    :cond_3a1
    :goto_3a1
    const/4 v0, 0x1

    return v0

    .line 48
    :cond_3a3
    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    if-eqz v5, :cond_455

    .line 49
    const/4 v5, 0x2

    if-ne v0, v5, :cond_3b7

    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    if-eqz v5, :cond_3b7

    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v5, :cond_3b7

    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    const/4 v0, 0x1

    return v0

    .line 50
    :cond_3b7
    const/4 v5, 0x2

    if-ne v0, v5, :cond_3fd

    float-to-double v5, v2

    float-to-double v2, v3

    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v5

    int-to-double v5, v5

    cmpl-double v2, v2, v5

    if-lez v2, :cond_3fd

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v2, :cond_3fd

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->holding(Landroid/app/Activity;)Z

    move-result v2

    if-nez v2, :cond_3fd

    iget-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    if-nez v0, :cond_3dc

    :goto_3db
    goto :goto_3e3

    :cond_3dc
    iget-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-static {v0}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v11

    goto :goto_3db

    :goto_3e3
    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    if-eqz v11, :cond_3f8

    invoke-static {v1, v8, v11}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    invoke-virtual {v11}, Landroid/view/MotionEvent;->recycle()V

    :cond_3f8
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 51
    :cond_3fd
    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->holding(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_406

    const/4 v2, 0x1

    iput-boolean v2, v8, Le/e/a/PlayerGestures219$State;->held:Z

    .line 52
    :cond_406
    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    .line 53
    const/4 v2, 0x1

    if-ne v0, v2, :cond_453

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v0, :cond_44a

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v0, :cond_44a

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    sub-long/2addr v2, v5

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    int-to-long v5, v0

    cmp-long v0, v2, v5

    if-lez v0, :cond_427

    goto :goto_44a

    .line 54
    :cond_427
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, v8, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, v8, Le/e/a/PlayerGestures219$State;->lastUp:J

    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelCallback(Le/e/a/PlayerGestures219$State;)V

    new-instance v0, Le/e/a/PlayerGestures219$1;

    invoke-direct {v0, v8}, Le/e/a/PlayerGestures219$1;-><init>(Le/e/a/PlayerGestures219$State;)V

    iput-object v0, v8, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    sget-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v3

    int-to-long v5, v3

    invoke-virtual {v0, v2, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_453

    .line 53
    :cond_44a
    :goto_44a
    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->held:Z

    .line 55
    :cond_453
    :goto_453
    const/4 v0, 0x1

    return v0

    .line 57
    :cond_455
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 41
    :cond_45a
    move-object/from16 v4, p1

    :goto_45c
    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    if-nez v0, :cond_466

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-nez v0, :cond_466

    move v12, v7

    goto :goto_467

    :cond_466
    const/4 v12, 0x1

    :goto_467
    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    if-nez v12, :cond_481

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_481

    return v7

    :cond_481
    const/4 v0, 0x1

    return v0

    .line 23
    :cond_483
    move-object/from16 v4, p1

    :goto_485
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0
    :try_end_489
    .catch Ljava/lang/Exception; {:try_start_316 .. :try_end_489} :catch_48a

    return v0

    .line 58
    :catch_48a
    move-exception v0

    goto :goto_48f

    :catch_48c
    move-exception v0

    move-object/from16 v4, p1

    :goto_48f
    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    const-string v2, "nicoid-gesture"

    const-string v3, "Player gesture failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method static validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z
    .registers 5

    .line 68
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "v"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iget-object v1, p0, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v1}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_31

    const-string v1, "a0"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_31

    iget-object p0, p0, Le/e/a/PlayerGestures219$State;->id:Ljava/lang/String;

    const-string v1, "b0"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2d} :catch_32

    if-eqz p0, :cond_31

    const/4 p0, 0x1

    return p0

    :cond_31
    return v0

    :catch_32
    move-exception p0

    return v0
.end method

.method static video(Ljava/lang/Object;)Landroid/view/View;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method
