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

    if-eqz v0, :cond_0

    return-void

    :cond_0
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

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    :cond_0
    return-void
.end method

.method static cancelNative(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    .registers 4

    .line 71
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p2

    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    :try_start_0
    invoke-static {p0, p1, p2}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    return-void

    :catchall_0
    move-exception p0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    throw p0
.end method

.method static cancelSingle(Le/e/a/PlayerGestures219$State;)V
    .registers 4

    .line 21
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/PlayerGestures219;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    :cond_1
    return-void
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 2

    .line 73
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    if-eqz v0, :cond_0

    invoke-static {v0}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v0}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    :cond_0
    invoke-static {p0}, Le/e/a/SeekFeedback219;->clear(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/FeedbackHud219;->clear(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    return-void
.end method

.method static findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 81
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_1

    return-object v0

    :cond_1
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_2

    return-object p0

    :cond_2
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_3

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
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

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v0, p0, v1}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    invoke-static {v0, p0, v2}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    :cond_2
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
    invoke-static {p0}, Le/e/a/Dev140;->retireReturnToken(Landroid/app/Activity;)V

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

    if-eqz p2, :cond_0

    const/4 p1, 0x6

    goto :goto_0

    :cond_0
    const/4 p1, 0x7

    :goto_0
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

    if-eqz p0, :cond_0

    iget-boolean p0, p0, Le/e/a/PlayerGestures219$State;->holding:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static interactive(Landroid/view/View;FF)Z
    .registers 7

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_7

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_3

    .line 17
    :cond_1
    instance-of v0, p0, Landroid/widget/Button;

    const/4 v2, 0x1

    if-nez v0, :cond_6

    instance-of v0, p0, Landroid/widget/ImageButton;

    if-nez v0, :cond_6

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_6

    instance-of v0, p0, Landroid/widget/EditText;

    if-nez v0, :cond_6

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 18
    :cond_2
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_0
    if-gez v0, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/PlayerGestures219;->interactive(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_4

    return v2

    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_5
    :goto_1
    return v1

    .line 17
    :cond_6
    :goto_2
    return v2

    .line 16
    :cond_7
    :goto_3
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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
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

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->mini(Landroid/content/SharedPreferences;)Z

    move-result p0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    :goto_0
    return p0
.end method

.method static recycle(Le/e/a/PlayerGestures219$State;)V
    .registers 3

    .line 20
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    :cond_0
    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Le/e/a/PlayerGestures219$State;->up:Landroid/view/MotionEvent;

    :cond_1
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
    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V
    .registers 4

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/PlayerGestures219$State;->replaying:Z

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p2}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v0, p1, Le/e/a/PlayerGestures219$State;->replaying:Z

    return-void

    :catchall_0
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
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/16 v0, 0xa

    :goto_0
    move v6, v0

    const/4 v0, 0x0

    if-gtz v6, :cond_0

    return v0

    :cond_0
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

    if-gtz v5, :cond_1

    return v0

    :cond_1
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

    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "double_tap_seek_seconds"

    const-string v2, "10"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    return v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 12

    .line 74
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v1, "gesture_volume"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-nez v1, :cond_1

    move-object v1, v0

    .line 75
    :cond_1
    const-string v9, "Double taps and hold-to-speed preserve controls; single taps toggle them"

    const-string/jumbo v10, "\u9023\u9ede\u8207\u9577\u6309\u52a0\u901f\u4fdd\u7559\u63a7\u5236\u9805\u72c0\u614b\uff0c\u55ae\u9ede\u958b\u95dc\u63a7\u5236\u9805"

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

    :goto_0
    const/4 v4, 0x4

    if-lt v3, v4, :cond_3

    .line 77
    const-string v0, "gesture_vertical_options"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_2

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

    const-string/jumbo v3, "\u80cc\u666f\u64ad\u653e\u3001\u61f8\u6d6e\u64ad\u653e\u8207\u5207\u63db\u5168\u87a2\u5e55"

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u30fb\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u30fb\u5168\u753b\u9762\u3078\u306e\u5207\u308a\u66ff\u3048"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/PlayerGestures219$2;

    invoke-direct {v0, p0}, Le/e/a/PlayerGestures219$2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 78
    :cond_2
    return-void

    .line 76
    :cond_3
    aget-object v4, v2, v3

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-static {v0, v4}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-virtual {v5, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
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

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->held:Z

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->holding:Z

    invoke-static {p0}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "nicoid-gesture"

    const-string v1, "Cannot track hold gesture"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method static state(Landroid/app/Activity;)Le/e/a/PlayerGestures219$State;
    .registers 3

    .line 14
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    if-nez v0, :cond_0

    new-instance v0, Le/e/a/PlayerGestures219$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/PlayerGestures219$State;-><init>(Le/e/a/PlayerGestures219$State;)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Le/e/a/PlayerGestures219$State;->activity:Ljava/lang/ref/WeakReference;

    sget-object v1, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
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

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/PlayerGestures219$State;->holding:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "nicoid-gesture"

    const-string v1, "Cannot finish hold gesture"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
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

    if-eqz v0, :cond_0

    return v2

    :cond_0
    sget-object v0, Le/e/a/PlayerGestures219;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures219$State;

    const-string v3, "gesture_swipe_exit_fullscreen"

    const-string v4, "gesture_swipe_fullscreen"

    const-string v5, "gesture_quiet_controls"

    const-string v6, "gesture_swipe_popup"

    const/4 v7, 0x0

    if-nez v0, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_1
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-static {v0}, Le/e/a/PlaybackDefaults229;->mini(Landroid/content/SharedPreferences;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v0, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_2
    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->state(Landroid/app/Activity;)Le/e/a/PlayerGestures219$State;

    move-result-object v0

    :cond_3
    move-object v8, v0

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->replaying:Z

    if-eqz v0, :cond_4

    return v7

    .line 23
    :cond_4
    :try_start_0
    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->cancelling(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v7

    :cond_5
    invoke-static/range {p0 .. p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_36

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_6

    move-object/from16 v4, p1

    goto/16 :goto_18

    .line 24
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 25
    const-string v10, "gesture_swipe_background"

    const/4 v11, 0x0

    if-nez v0, :cond_19

    .line 26
    :try_start_1
    const-string v0, "v"

    invoke-static {v1, v0}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    goto :goto_0

    :cond_7
    invoke-static {v0}, Le/e/a/PlayerGestures219;->video(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v11

    :goto_0
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 27
    const-string v14, "x0"

    invoke-static {v0, v14}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_8

    if-eqz v11, :cond_8

    invoke-virtual {v11}, Landroid/view/View;->isShown()Z

    move-result v14

    if-eqz v14, :cond_8

    invoke-virtual {v11, v13}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v14

    if-eqz v14, :cond_8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v14

    float-to-int v14, v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v15

    float-to-int v15, v15

    invoke-virtual {v13, v14, v15}, Landroid/graphics/Rect;->contains(II)Z

    move-result v14

    if-eqz v14, :cond_8

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

    if-eqz v2, :cond_8

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

    if-nez v2, :cond_8

    const/4 v2, 0x1

    goto :goto_1

    :cond_8
    move v2, v7

    .line 28
    :goto_1
    if-nez v2, :cond_9

    invoke-static {v8}, Le/e/a/PlayerGestures219;->flush(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 29
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const-string v9, "B0"

    const/4 v12, 0x1

    if-ne v2, v12, :cond_a

    :try_start_2
    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a

    const/4 v2, 0x1

    goto :goto_2

    :cond_a
    move v2, v7

    .line 30
    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v12

    iget v12, v12, Landroid/content/res/Configuration;->orientation:I

    const/4 v14, 0x2

    if-ne v12, v14, :cond_c

    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_b

    const-string v9, "r0"

    invoke-static {v0, v9}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_c

    :cond_b
    const/4 v9, 0x1

    goto :goto_3

    :cond_c
    move v9, v7

    .line 31
    :goto_3
    if-eqz v2, :cond_d

    invoke-static {v1, v4}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v4, 0x1

    goto :goto_4

    :cond_d
    move v4, v7

    :goto_4
    if-eqz v2, :cond_e

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v12

    if-nez v12, :cond_f

    invoke-static {v1, v10}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_f

    invoke-static {v1, v6}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f

    :cond_e
    if-eqz v9, :cond_10

    invoke-static {v1, v3}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_f

    goto :goto_5

    :cond_f
    const/4 v3, 0x1

    goto :goto_6

    :cond_10
    :goto_5
    move v3, v7

    .line 32
    :goto_6
    invoke-static {v1, v5}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_11

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_11

    const/4 v5, 0x1

    goto :goto_7

    :cond_11
    move v5, v7

    .line 33
    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    invoke-virtual {v13}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v9

    cmpg-float v6, v6, v9

    if-gez v6, :cond_12

    const/4 v6, -0x1

    goto :goto_8

    :cond_12
    const/4 v6, 0x1

    .line 34
    :goto_8
    if-eqz v5, :cond_13

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->seekEnabled(Landroid/app/Activity;)Z

    move-result v9

    if-eqz v9, :cond_13

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    if-eqz v9, :cond_13

    invoke-static {v8, v1}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v9

    if-eqz v9, :cond_13

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v9}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v0, :cond_13

    iget-object v9, v8, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    invoke-static {v9}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v11, :cond_13

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v9

    iget-wide v14, v8, Le/e/a/PlayerGestures219$State;->lastUp:J

    sub-long/2addr v9, v14

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v12

    int-to-long v14, v12

    cmp-long v9, v9, v14

    if-gtz v9, :cond_13

    iget v9, v8, Le/e/a/PlayerGestures219$State;->side:I

    if-ne v9, v6, :cond_13

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

    if-gez v9, :cond_13

    const/4 v9, 0x1

    goto :goto_9

    :cond_13
    move v9, v7

    .line 35
    :goto_9
    if-eqz v9, :cond_14

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
    :cond_14
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

    if-nez v4, :cond_15

    if-eqz v3, :cond_16

    :cond_15
    iget v0, v8, Le/e/a/PlayerGestures219$State;->x:F

    iget v2, v13, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v0, v2}, Le/e/a/GestureRules219;->center(FF)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    goto :goto_a

    :cond_16
    move v0, v7

    :goto_a
    iput-boolean v0, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->held:Z

    iput-boolean v5, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    .line 37
    if-eqz v5, :cond_17

    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    const/4 v0, 0x1

    return v0

    .line 38
    :cond_17
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_18

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    :cond_18
    return v0

    .line 40
    :cond_19
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    iget-wide v4, v8, Le/e/a/PlayerGestures219$State;->time:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1a

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v2, :cond_1a

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 41
    :cond_1a
    const/4 v2, 0x5

    if-eq v0, v2, :cond_33

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_33

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1b

    move-object/from16 v4, p1

    goto/16 :goto_16

    .line 42
    :cond_1b
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

    if-ne v0, v4, :cond_20

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    if-eqz v4, :cond_20

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v4, :cond_20

    const/4 v4, 0x0

    cmpg-float v4, v3, v4

    if-gez v4, :cond_1c

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->upEnabled:Z

    goto :goto_b

    :cond_1c
    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->downEnabled:Z

    .line 44
    :goto_b
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v12, 0x41c00000    # 24.0f

    mul-float/2addr v12, v9

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    cmpl-float v5, v5, v13

    if-gtz v5, :cond_1f

    if-nez v4, :cond_1d

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v12

    if-lez v5, :cond_1d

    move-object/from16 v4, p1

    goto :goto_c

    .line 45
    :cond_1d
    if-eqz v4, :cond_1e

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

    if-lez v4, :cond_1e

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v12, 0x3fcccccd    # 1.6f

    mul-float/2addr v5, v12

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1e

    iget-boolean v4, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-nez v4, :cond_1e

    const/4 v4, 0x1

    iput-boolean v4, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 v4, p1

    :try_start_3
    invoke-static {v1, v8, v4}, Le/e/a/PlayerGestures219;->cancelNative(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    goto :goto_d

    :cond_1e
    move-object/from16 v4, p1

    goto :goto_d

    .line 44
    :cond_1f
    move-object/from16 v4, p1

    :goto_c
    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    goto :goto_d

    .line 43
    :cond_20
    move-object/from16 v4, p1

    .line 47
    :goto_d
    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-eqz v5, :cond_29

    const/4 v5, 0x1

    if-ne v0, v5, :cond_28

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

    if-gez v0, :cond_21

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->upEnabled:Z

    goto :goto_e

    :cond_21
    if-lez v0, :cond_22

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->downEnabled:Z

    if-eqz v2, :cond_22

    const/4 v2, 0x1

    goto :goto_e

    :cond_22
    move v2, v7

    :goto_e
    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    if-eqz v2, :cond_28

    invoke-static {v8, v1}, Le/e/a/PlayerGestures219;->validOwner(Le/e/a/PlayerGestures219$State;Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_28

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->portrait:Z

    if-eqz v2, :cond_26

    if-lez v0, :cond_26

    invoke-static {v1, v10}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-static/range {p0 .. p0}, Le/e/a/MiniSession225;->wasExpanded(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {v1, v6}, Le/e/a/PlayerGestures219;->pref(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    :cond_23
    move v0, v7

    goto :goto_f

    :cond_24
    const/4 v0, 0x1

    :goto_f
    if-eqz v0, :cond_25

    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_28

    :cond_25
    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    goto :goto_11

    :cond_26
    iget-object v2, v8, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    if-gez v0, :cond_27

    const/4 v0, 0x1

    goto :goto_10

    :cond_27
    move v0, v7

    :goto_10
    invoke-static {v1, v2, v0}, Le/e/a/PlayerGestures219;->fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V

    :cond_28
    :goto_11
    const/4 v0, 0x1

    return v0

    .line 48
    :cond_29
    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    if-eqz v5, :cond_32

    .line 49
    const/4 v5, 0x2

    if-ne v0, v5, :cond_2a

    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    if-eqz v5, :cond_2a

    iget-boolean v5, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v5, :cond_2a

    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    const/4 v0, 0x1

    return v0

    .line 50
    :cond_2a
    const/4 v5, 0x2

    if-ne v0, v5, :cond_2d

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

    if-lez v2, :cond_2d

    iget-boolean v2, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v2, :cond_2d

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->holding(Landroid/app/Activity;)Z

    move-result v2

    if-nez v2, :cond_2d

    iget-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    if-nez v0, :cond_2b

    :goto_12
    goto :goto_13

    :cond_2b
    iget-object v0, v8, Le/e/a/PlayerGestures219$State;->down:Landroid/view/MotionEvent;

    invoke-static {v0}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v11

    goto :goto_12

    :goto_13
    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    if-eqz v11, :cond_2c

    invoke-static {v1, v8, v11}, Le/e/a/PlayerGestures219;->replay(Landroid/app/Activity;Le/e/a/PlayerGestures219$State;Landroid/view/MotionEvent;)V

    invoke-virtual {v11}, Landroid/view/MotionEvent;->recycle()V

    :cond_2c
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 51
    :cond_2d
    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->holding(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_2e

    const/4 v2, 0x1

    iput-boolean v2, v8, Le/e/a/PlayerGestures219$State;->held:Z

    .line 52
    :cond_2e
    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    .line 53
    const/4 v2, 0x1

    if-ne v0, v2, :cond_31

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    if-nez v0, :cond_30

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->held:Z

    if-nez v0, :cond_30

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    sub-long/2addr v2, v5

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    int-to-long v5, v0

    cmp-long v0, v2, v5

    if-lez v0, :cond_2f

    goto :goto_14

    .line 54
    :cond_2f
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

    goto :goto_15

    .line 53
    :cond_30
    :goto_14
    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->held:Z

    .line 55
    :cond_31
    :goto_15
    const/4 v0, 0x1

    return v0

    .line 57
    :cond_32
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 41
    :cond_33
    move-object/from16 v4, p1

    :goto_16
    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    if-nez v0, :cond_34

    iget-boolean v0, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    if-nez v0, :cond_34

    move v12, v7

    goto :goto_17

    :cond_34
    const/4 v12, 0x1

    :goto_17
    invoke-static {v8}, Le/e/a/PlayerGestures219;->cancelSingle(Le/e/a/PlayerGestures219$State;)V

    invoke-static {v8}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->quiet:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->candidate:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->claimed:Z

    iput-boolean v7, v8, Le/e/a/PlayerGestures219$State;->doubleTap:Z

    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    if-nez v12, :cond_35

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_35

    return v7

    :cond_35
    const/4 v0, 0x1

    return v0

    .line 23
    :cond_36
    move-object/from16 v4, p1

    :goto_18
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures219;->legacy(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    return v0

    .line 58
    :catch_0
    move-exception v0

    goto :goto_19

    :catch_1
    move-exception v0

    move-object/from16 v4, p1

    :goto_19
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

    :try_start_0
    const-string v1, "v"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iget-object v1, p0, Le/e/a/PlayerGestures219$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {v1}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_0

    const-string v1, "a0"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerGestures219$State;->player:Ljava/lang/ref/WeakReference;

    invoke-static {v2}, Le/e/a/PlayerGestures219;->ref(Ljava/lang/ref/WeakReference;)Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_0

    iget-object p0, p0, Le/e/a/PlayerGestures219$State;->id:Ljava/lang/String;

    const-string v1, "b0"

    invoke-static {p1, v1}, Le/e/a/PlayerGestures219;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0

    :catch_0
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
