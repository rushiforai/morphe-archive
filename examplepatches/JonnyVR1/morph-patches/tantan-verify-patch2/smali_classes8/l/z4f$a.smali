.class public final Ll/z4f$a;
.super Ll/f2e0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z4f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/ocg0;

.field public final b:Ll/ft5;

.field public final c:Ll/ocg0;

.field public final d:Ll/z4f$c;


# direct methods
.method public constructor <init>(Ll/z4f$c;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ocg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ocg0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/z4f$a;->a:Ll/ocg0;

    .line 10
    .line 11
    new-instance v1, Ll/ft5;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/ft5;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/z4f$a;->b:Ll/ft5;

    .line 17
    .line 18
    new-instance v2, Ll/ocg0;

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    new-array v3, v3, [Ll/kcg0;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    aput-object v0, v3, v4

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    aput-object v1, v3, v0

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ll/ocg0;-><init>([Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Ll/z4f$a;->c:Ll/ocg0;

    .line 33
    .line 34
    iput-object p1, p0, Ll/z4f$a;->d:Ll/z4f$c;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/z4f$a;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/z4f$a;->d:Ll/z4f$c;

    .line 13
    .line 14
    new-instance v1, Ll/z4f$a$a;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/z4f$a$a;-><init>(Ll/z4f$a;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    iget-object v5, p0, Ll/z4f$a;->a:Ll/ocg0;

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    invoke-virtual/range {v0 .. v5}, Ll/lj40;->k(Ll/x20;JLjava/util/concurrent/TimeUnit;Ll/ocg0;)Lrx/internal/schedulers/ScheduledAction;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/z4f$a;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/z4f$a;->d:Ll/z4f$c;

    .line 13
    .line 14
    new-instance v1, Ll/z4f$a$b;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/z4f$a$b;-><init>(Ll/z4f$a;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    iget-object v5, p0, Ll/z4f$a;->b:Ll/ft5;

    .line 20
    .line 21
    move-wide v2, p2

    .line 22
    move-object v4, p4

    .line 23
    invoke-virtual/range {v0 .. v5}, Ll/lj40;->j(Ll/x20;JLjava/util/concurrent/TimeUnit;Ll/ft5;)Lrx/internal/schedulers/ScheduledAction;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z4f$a;->c:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z4f$a;->c:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
