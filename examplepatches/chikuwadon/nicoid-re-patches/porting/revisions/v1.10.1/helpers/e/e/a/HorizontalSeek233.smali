.class public final Le/e/a/HorizontalSeek233;
.super Ljava/lang/Object;
.source "HorizontalSeek233.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/HorizontalSeek233$State;
    }
.end annotation


# static fields
.field static final KEY:Ljava/lang/String; = "gesture_horizontal_seek"

.field static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/HorizontalSeek233$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 6
    const-string v0, "gesture_horizontal_seek"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const-string v1, "player"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_14

    return-void

    :cond_14
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v0, "Swipe horizontally to seek"

    const-string v3, "\u5de6\u53f3\u6ed1\u52d5\u8df3\u8f49"

    const-string v4, "\u5de6\u53f3\u30b9\u30ef\u30a4\u30d7\u3067\u30b7\u30fc\u30af"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Seek by dragging on the video; seek bar and double tap remain independent"

    const-string v3, "\u5728\u5f71\u7247\u4e0a\u5de6\u53f3\u62d6\u66f3\u8df3\u8f49\uff0c\u9032\u5ea6\u689d\u8207\u8f15\u89f8\u5169\u6b21\u7368\u7acb\u904b\u4f5c"

    const-string v4, "\u52d5\u753b\u4e0a\u306e\u5de6\u53f3\u30b9\u30ef\u30a4\u30d7\u3067\u518d\u751f\u4f4d\u7f6e\u3092\u5909\u66f4\u3057\u307e\u3059\u3002\u30b7\u30fc\u30af\u30d0\u30fc\u3068\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u306f\u500b\u5225\u306b\u64cd\u4f5c\u3067\u304d\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 12

    .line 7
    sget-object v0, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/HorizontalSeek233$State;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_7f

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "gesture_horizontal_seek"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_79

    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_23

    goto :goto_79

    :cond_23
    new-instance v0, Le/e/a/HorizontalSeek233$State;

    invoke-direct {v0}, Le/e/a/HorizontalSeek233$State;-><init>()V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iput v1, v0, Le/e/a/HorizontalSeek233$State;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, v0, Le/e/a/HorizontalSeek233$State;->y:F

    :try_start_34
    const-string p1, "v"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "a0"

    invoke-static {p1, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    if-eqz p1, :cond_6e

    invoke-virtual {p1, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_6e

    iget p1, v0, Le/e/a/HorizontalSeek233$State;->x:F

    float-to-int p1, p1

    iget v4, v0, Le/e/a/HorizontalSeek233$State;->y:F

    float-to-int v4, v4

    invoke-virtual {v1, p1, v4}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    if-eqz p1, :cond_6e

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget v1, v0, Le/e/a/HorizontalSeek233$State;->x:F

    iget v4, v0, Le/e/a/HorizontalSeek233$State;->y:F

    invoke-static {p1, v1, v4}, Le/e/a/PlayerGestures219;->interactive(Landroid/view/View;FF)Z

    move-result p1

    if-nez p1, :cond_6e

    goto :goto_6f

    :cond_6e
    move v2, v3

    :goto_6f
    iput-boolean v2, v0, Le/e/a/HorizontalSeek233$State;->candidate:Z
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_71} :catch_72

    goto :goto_73

    :catch_72
    move-exception p1

    :goto_73
    sget-object p1, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    :cond_79
    :goto_79
    sget-object p1, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    :cond_7f
    if-nez v0, :cond_82

    return v3

    :cond_82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-gt v4, v2, :cond_10d

    const/4 v4, 0x3

    if-ne v1, v4, :cond_8d

    goto/16 :goto_10d

    :cond_8d
    iget-boolean v5, v0, Le/e/a/HorizontalSeek233$State;->claimed:Z

    if-nez v5, :cond_9d

    invoke-static {p0}, Le/e/a/PlayerGestures219;->holding(Landroid/app/Activity;)Z

    move-result v5

    if-eqz v5, :cond_9d

    sget-object p1, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    :cond_9d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iget v6, v0, Le/e/a/HorizontalSeek233$State;->x:F

    sub-float/2addr v5, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    iget v7, v0, Le/e/a/HorizontalSeek233$State;->y:F

    sub-float/2addr v6, v7

    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v7

    const/4 v8, 0x2

    if-ne v1, v8, :cond_103

    iget-boolean v8, v0, Le/e/a/HorizontalSeek233$State;->candidate:Z

    if-eqz v8, :cond_103

    iget-boolean v8, v0, Le/e/a/HorizontalSeek233$State;->claimed:Z

    if-nez v8, :cond_103

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v8

    int-to-float v7, v7

    cmpl-float v8, v8, v7

    if-lez v8, :cond_d6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_d6

    iput-boolean v3, v0, Le/e/a/HorizontalSeek233$State;->candidate:Z

    goto :goto_103

    :cond_d6
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v7

    if-lez v3, :cond_103

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v6, 0x3fc00000    # 1.5f

    mul-float/2addr v5, v6

    cmpl-float v3, v3, v5

    if-lez v3, :cond_103

    iput-boolean v2, v0, Le/e/a/HorizontalSeek233$State;->claimed:Z

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/view/Window;->superDispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    :cond_103
    :goto_103
    iget-boolean p1, v0, Le/e/a/HorizontalSeek233$State;->claimed:Z

    if-ne v1, v2, :cond_10c

    sget-object v0, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10c
    return p1

    :cond_10d
    :goto_10d
    iget-boolean p1, v0, Le/e/a/HorizontalSeek233$State;->claimed:Z

    sget-object v0, Le/e/a/HorizontalSeek233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return p1
.end method
