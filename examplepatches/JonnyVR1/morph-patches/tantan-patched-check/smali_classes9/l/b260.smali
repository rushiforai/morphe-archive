.class public Ll/b260;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/b260;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/qq2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b260;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static c()Ll/b260;
    .locals 2

    .line 1
    sget-object v0, Ll/b260;->b:Ll/b260;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/b260;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/b260;->b:Ll/b260;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/b260;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/b260;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/b260;->b:Ll/b260;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/b260;->b:Ll/b260;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Ll/xzs;Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b260;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/qq2;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance p0, Ll/v060;

    .line 18
    .line 19
    invoke-direct {p0, p2}, Ll/v060;-><init>(Ll/dum;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p1, p3}, Ll/qq2;->d(Ll/l6t;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b260;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ll/dum;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b260;->e(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Ll/dum;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b260;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    new-instance v0, Ll/v060;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/v060;-><init>(Ll/dum;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "turboCard"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method
