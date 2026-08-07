.class public Ll/z460$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y460$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z460;-><init>(Ll/pcj;Ll/qcj;Lrx/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y460$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/pcj;


# direct methods
.method public constructor <init>(Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z460$a;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/y460$c;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Long;

    .line 4
    .line 5
    check-cast p3, Ll/f2e0$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/z460$a;->b(Ll/y460$c;Ljava/lang/Long;Ll/f2e0$a;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b(Ll/y460$c;Ljava/lang/Long;Ll/f2e0$a;)Ll/kcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y460$c<",
            "TT;>;",
            "Ljava/lang/Long;",
            "Ll/f2e0$a;",
            ")",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/z460$a;->a:Ll/pcj;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-interface {p3}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    check-cast p3, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    new-instance v0, Ll/z460$a$a;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Ll/z460$a$a;-><init>(Ll/z460$a;Ll/y460$c;Ljava/lang/Long;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method
