.class public abstract Ll/zwd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final b:Ll/utl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/utl<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:I

.field public final d:I

.field public final e:J

.field public final f:J

.field public g:Ll/yni0;

.field public h:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/utl;JJI)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/utl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/utl<",
            "TT;>;JJI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xni0;->a()Ll/yni0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/zwd0;->g:Ll/yni0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/zwd0;->a:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zwd0;->b:Ll/utl;

    .line 13
    .line 14
    iput-wide p3, p0, Ll/zwd0;->f:J

    .line 15
    .line 16
    iput-wide p5, p0, Ll/zwd0;->e:J

    .line 17
    .line 18
    iput p7, p0, Ll/zwd0;->d:I

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/zwd0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/zwd0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/zwd0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/zwd0;->c:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/zwd0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/zwd0;->c:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/zwd0;->c:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic d(Ll/zwd0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/zwd0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/zwd0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwd0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/zwd0;)Ll/utl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwd0;->b:Ll/utl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/zwd0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/zwd0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic h(Ll/zwd0;)Landroid/os/Handler;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwd0;->j()Landroid/os/Handler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public abstract i()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public final j()Landroid/os/Handler;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zwd0;->h:Landroid/os/Handler;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/zwd0;->h:Landroid/os/Handler;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/zwd0;->h:Landroid/os/Handler;

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-object v0

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/zwd0;->c:I

    .line 3
    .line 4
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zwd0;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zwd0;->j()Landroid/os/Handler;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-wide v1, p0, Ll/zwd0;->f:J

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/zwd0;->j()Landroid/os/Handler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/zwd0;->g:Ll/yni0;

    .line 10
    .line 11
    new-instance v1, Ll/zwd0$b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/zwd0$b;-><init>(Ll/zwd0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zwd0;->g:Ll/yni0;

    .line 2
    .line 3
    new-instance v1, Ll/zwd0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zwd0$a;-><init>(Ll/zwd0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
