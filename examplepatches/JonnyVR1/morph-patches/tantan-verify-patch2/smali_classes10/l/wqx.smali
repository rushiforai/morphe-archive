.class public Ll/wqx;
.super Ll/q0m;
.source "SourceFile"


# instance fields
.field public final c:Ll/v120;

.field public final d:Z


# direct methods
.method public constructor <init>(Ll/v120;Lrx/c;Ll/g8t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v120;",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;",
            "Ll/g8t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2, p3}, Ll/q0m;-><init>(Lrx/c;Ll/g8t;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wqx;->c:Ll/v120;

    .line 5
    .line 6
    instance-of p1, p1, Ll/msf0;

    .line 7
    .line 8
    iput-boolean p1, p0, Ll/wqx;->d:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g(Ll/wqx;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wqx;->h(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic h(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wqx;->c:Ll/v120;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Ll/v120;->a(Z)V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Ll/wqx;->d:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/wqx;->c:Ll/v120;

    .line 12
    .line 13
    check-cast p0, Ll/msf0;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Ll/msf0;->c(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->mediaCapture()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/q0m;->c(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/vqx;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/vqx;-><init>(Ll/wqx;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
