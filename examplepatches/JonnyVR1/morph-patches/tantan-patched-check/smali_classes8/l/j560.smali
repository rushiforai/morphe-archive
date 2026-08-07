.class public final Ll/j560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j560$c;,
        Ll/j560$a;,
        Ll/j560$b;,
        Ll/j560$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/c<",
        "TT;>;TT;>;"
    }
.end annotation


# static fields
.field public static final f:Ljava/lang/Object;

.field public static final g:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/util/concurrent/TimeUnit;

.field public final d:Ll/f2e0;

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j560;->f:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/j560;->g:Lrx/internal/operators/NotificationLite;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/j560;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/j560;->b:J

    .line 7
    .line 8
    iput-object p5, p0, Ll/j560;->c:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    iput p6, p0, Ll/j560;->e:I

    .line 11
    .line 12
    iput-object p7, p0, Ll/j560;->d:Ll/f2e0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j560;->d:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Ll/j560;->a:J

    .line 8
    .line 9
    iget-wide v3, p0, Ll/j560;->b:J

    .line 10
    .line 11
    cmp-long v1, v1, v3

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ll/j560$b;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, v0}, Ll/j560$b;-><init>(Ll/j560;Ll/gcg0;Ll/f2e0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ll/j560$b;->m()V

    .line 24
    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_0
    new-instance v1, Ll/j560$c;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, v0}, Ll/j560$c;-><init>(Ll/j560;Ll/gcg0;Ll/f2e0$a;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ll/j560$c;->i()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ll/j560$c;->h()V

    .line 39
    .line 40
    .line 41
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
