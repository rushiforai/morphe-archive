.class public final Le/e/a/CommentMotion;
.super Ljava/lang/Object;
.source "CommentMotion.java"


# static fields
.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentMotionRules;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fps(Ljava/lang/Object;)I
    .registers 5
    .param p0, "view"    # Ljava/lang/Object;

    .line 10
    :try_start_0
    move-object v0, p0

    check-cast v0, Landroid/view/View;

    .local v0, "v":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "comment_fps"

    const-string v3, "60"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .local v1, "fps":I
    const/16 v2, 0x78

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .end local v1    # "fps":I
    .local v2, "fps":I
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "ChormecastSenderService"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3d

    const/16 v1, 0x1e

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3c} :catch_3f

    goto :goto_3e

    :cond_3d
    move v1, v2

    :goto_3e
    return v1

    .end local v0    # "v":Landroid/view/View;
    .end local v2    # "fps":I
    :catch_3f
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const/16 v1, 0x3c

    return v1
.end method

.method public static frame(Ljava/lang/Object;)V
    .registers 7
    .param p0, "view"    # Ljava/lang/Object;

    .line 7
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I

    move-result v3

    invoke-static {p0}, Le/e/a/CommentClock;->rate(Ljava/lang/Object;)F

    move-result v4

    invoke-static {p0}, Le/e/a/CommentClock;->playing(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentMotionRules;->frame(JIFZ)V

    return-void
.end method

.method public static period(Ljava/lang/Object;)J
    .registers 5
    .param p0, "view"    # Ljava/lang/Object;

    .line 11
    invoke-static {p0}, Le/e/a/CommentMotion;->fps(Ljava/lang/Object;)I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x3e80000

    div-long/2addr v2, v0

    return-wide v2
.end method

.method public static position(Ljava/lang/Object;)F
    .registers 2
    .param p0, "view"    # Ljava/lang/Object;

    .line 8
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object v0

    invoke-virtual {v0}, Le/e/a/CommentMotionRules;->position()F

    move-result v0

    return v0
.end method

.method public static start(Ljava/lang/Object;Ljava/lang/Object;F)F
    .registers 4
    .param p0, "view"    # Ljava/lang/Object;
    .param p1, "comment"    # Ljava/lang/Object;
    .param p2, "timestamp"    # F

    .line 9
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Le/e/a/CommentMotionRules;->start(Ljava/lang/Object;F)F

    move-result v0

    return v0
.end method

.method private static declared-synchronized state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;
    .registers 4
    .param p0, "view"    # Ljava/lang/Object;

    const-class v0, Le/e/a/CommentMotion;

    monitor-enter v0

    .line 6
    :try_start_3
    sget-object v1, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentMotionRules;

    .local v1, "s":Le/e/a/CommentMotionRules;
    if-nez v1, :cond_18

    new-instance v2, Le/e/a/CommentMotionRules;

    invoke-direct {v2}, Le/e/a/CommentMotionRules;-><init>()V

    move-object v1, v2

    sget-object v2, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1a

    :cond_18
    monitor-exit v0

    return-object v1

    .line 6
    .end local v1    # "s":Le/e/a/CommentMotionRules;
    .end local p0    # "view":Ljava/lang/Object;
    :catchall_1a
    move-exception p0

    :try_start_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw p0
.end method
