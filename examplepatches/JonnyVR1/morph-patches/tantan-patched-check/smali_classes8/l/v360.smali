.class public Ll/v360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/v360$a;,
        Ll/v360$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Long;

.field public final b:Ll/x20;

.field public final c:Lrx/a$d;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Ll/v360;->a:Ljava/lang/Long;

    .line 40
    iput-object v0, p0, Ll/v360;->b:Ll/x20;

    .line 41
    sget-object v0, Lrx/a;->b:Lrx/a$d;

    iput-object v0, p0, Ll/v360;->c:Lrx/a$d;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    const/4 v0, 0x0

    .line 36
    sget-object v1, Lrx/a;->b:Lrx/a$d;

    invoke-direct {p0, p1, p2, v0, v1}, Ll/v360;-><init>(JLl/x20;Lrx/a$d;)V

    return-void
.end method

.method public constructor <init>(JLl/x20;)V
    .locals 1

    .line 37
    sget-object v0, Lrx/a;->b:Lrx/a$d;

    invoke-direct {p0, p1, p2, p3, v0}, Ll/v360;-><init>(JLl/x20;Lrx/a$d;)V

    return-void
.end method

.method public constructor <init>(JLl/x20;Lrx/a$d;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/v360;->a:Ljava/lang/Long;

    .line 18
    .line 19
    iput-object p3, p0, Ll/v360;->b:Ll/x20;

    .line 20
    .line 21
    iput-object p4, p0, Ll/v360;->c:Lrx/a$d;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "The BackpressureOverflow strategy must not be null"

    .line 25
    .line 26
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v1

    .line 30
    :cond_1
    const-string p0, "Buffer capacity must be > 0"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v1
.end method

.method public static b()Ll/v360;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/v360<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/v360$b;->INSTANCE:Ll/v360;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v360$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v360;->a:Ljava/lang/Long;

    .line 4
    .line 5
    iget-object v2, p0, Ll/v360;->b:Ll/x20;

    .line 6
    .line 7
    iget-object p0, p0, Ll/v360;->c:Lrx/a$d;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1, v2, p0}, Ll/v360$a;-><init>(Ll/gcg0;Ljava/lang/Long;Ll/x20;Lrx/a$d;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ll/v360$a;->h()Ll/vk90;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
