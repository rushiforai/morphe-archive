.class public final Le/e/a/CommentJump;
.super Ljava/lang/Object;
.source "CommentJump.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentJump$Tap;
    }
.end annotation


# static fields
.field private static final taps:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentJump$Tap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentJump;->taps:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static tap(Ljava/lang/Object;I)V
    .registers 14

    .line 12
    :try_start_0
    const-string v0, "f0"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int/2addr p1, v1

    .line 13
    const-string v1, "e0"

    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-ltz p1, :cond_eb

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1f

    goto/16 :goto_eb

    .line 14
    :cond_1f
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sget-object v4, Le/e/a/CommentJump;->taps:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/CommentJump$Tap;

    .line 15
    if-eqz v4, :cond_da

    iget v5, v4, Le/e/a/CommentJump$Tap;->index:I

    if-ne v5, p1, :cond_da

    iget-wide v4, v4, Le/e/a/CommentJump$Tap;->time:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x190

    cmp-long v8, v4, v6

    if-gtz v8, :cond_da

    .line 16
    sget-object v2, Le/e/a/CommentJump;->taps:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "b0"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 17
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "d"

    invoke-static {p1, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0xa

    mul-long v1, v1, v3

    .line 18
    const-string p1, "getDuration"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {p0, p1, v4, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 19
    const-string p1, "seekTo"

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v3

    new-array v8, v6, [Ljava/lang/Object;

    const-wide/16 v9, 0x0

    cmp-long v11, v4, v9

    if-lez v11, :cond_87

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    goto :goto_88

    :cond_87
    move-wide v4, v1

    :goto_88
    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v8, v3

    invoke-static {p0, p1, v7, v8}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u306e\u6642\u9593\u306b\u79fb\u52d5"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v4, " %d:%02d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const-wide/32 v7, 0xea60

    div-long v7, v1, v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v3

    const-wide/16 v7, 0x3e8

    div-long/2addr v1, v7

    const-wide/16 v7, 0x3c

    rem-long/2addr v1, v7

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_e9

    .line 21
    :cond_da
    new-instance v0, Le/e/a/CommentJump$Tap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/CommentJump$Tap;-><init>(Le/e/a/CommentJump$1;)V

    iput p1, v0, Le/e/a/CommentJump$Tap;->index:I

    iput-wide v2, v0, Le/e/a/CommentJump$Tap;->time:J

    sget-object p1, Le/e/a/CommentJump;->taps:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e9} :catch_ec

    :goto_e9
    nop

    .line 22
    goto :goto_f0

    .line 13
    :cond_eb
    :goto_eb
    return-void

    .line 22
    :catch_ec
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 23
    :goto_f0
    return-void
.end method
