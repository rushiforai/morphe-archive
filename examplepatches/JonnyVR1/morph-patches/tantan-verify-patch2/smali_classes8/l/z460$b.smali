.class public Ll/z460$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y460$b;


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
        "Ll/y460$b<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/qcj;


# direct methods
.method public constructor <init>(Ll/qcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z460$b;->a:Ll/qcj;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/y460$c;Ljava/lang/Long;Ljava/lang/Object;Ll/f2e0$a;)Ll/kcg0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y460$c<",
            "TT;>;",
            "Ljava/lang/Long;",
            "TT;",
            "Ll/f2e0$a;",
            ")",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p4, p0, Ll/z460$b;->a:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {p4, p3}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    new-instance p4, Ll/z460$b$a;

    .line 10
    .line 11
    invoke-direct {p4, p0, p1, p2}, Ll/z460$b$a;-><init>(Ll/z460$b;Ll/y460$c;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, p4}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/y460$c;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Long;

    .line 4
    .line 5
    check-cast p4, Ll/f2e0$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/z460$b;->a(Ll/y460$c;Ljava/lang/Long;Ljava/lang/Object;Ll/f2e0$a;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
