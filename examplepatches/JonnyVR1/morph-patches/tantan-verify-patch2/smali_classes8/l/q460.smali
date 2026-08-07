.class public final Ll/q460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q460$b;
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
.field public final a:J

.field public final b:Ll/f2e0;

.field public final c:I


# direct methods
.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p2

    .line 10
    iput-wide p2, p0, Ll/q460;->a:J

    .line 11
    .line 12
    iput-object p5, p0, Ll/q460;->b:Ll/f2e0;

    .line 13
    .line 14
    iput p1, p0, Ll/q460;->c:I

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "count could not be negative"

    .line 18
    .line 19
    invoke-static {p0}, Ll/kym;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    throw p0
.end method

.method public constructor <init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    iput-wide p1, p0, Ll/q460;->a:J

    .line 26
    iput-object p4, p0, Ll/q460;->b:Ll/f2e0;

    const/4 p1, -0x1

    .line 27
    iput p1, p0, Ll/q460;->c:I

    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 6
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
    new-instance v0, Ll/q460$b;

    .line 2
    .line 3
    iget v2, p0, Ll/q460;->c:I

    .line 4
    .line 5
    iget-wide v3, p0, Ll/q460;->a:J

    .line 6
    .line 7
    iget-object v5, p0, Ll/q460;->b:Ll/f2e0;

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    invoke-direct/range {v0 .. v5}, Ll/q460$b;-><init>(Ll/gcg0;IJLl/f2e0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/q460$a;

    .line 17
    .line 18
    invoke-direct {p1, p0, v0}, Ll/q460$a;-><init>(Ll/q460;Ll/q460$b;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
