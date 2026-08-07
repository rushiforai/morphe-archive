.class public Ll/olm$b;
.super Ll/f2e0$a;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/olm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/k63;

.field public final synthetic b:Ll/olm;


# direct methods
.method public constructor <init>(Ll/olm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/olm$b;->b:Ll/olm;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/k63;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/k63;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/olm$b;->a:Ll/k63;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/olm;Ll/olm$a;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/olm$b;-><init>(Ll/olm;)V

    return-void
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/olm$b;->b:Ll/olm;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p2

    .line 11
    add-long/2addr v0, p2

    .line 12
    new-instance p2, Ll/vrf0;

    .line 13
    .line 14
    invoke-direct {p2, p1, p0, v0, v1}, Ll/vrf0;-><init>(Ll/x20;Ll/f2e0$a;J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/olm$b;->b(Ll/x20;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/olm$b;->a:Ll/k63;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k63;->isUnsubscribed()Z

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
    iget-object p0, p0, Ll/olm$b;->a:Ll/k63;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k63;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
