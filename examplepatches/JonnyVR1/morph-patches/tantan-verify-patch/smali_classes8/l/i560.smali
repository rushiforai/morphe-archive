.class public final Ll/i560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i560$c;,
        Ll/i560$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/c<",
        "TT;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TU;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TU;+",
            "Lrx/c<",
            "+TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TU;>;",
            "Ll/qcj<",
            "-TU;+",
            "Lrx/c<",
            "+TV;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i560;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i560;->b:Ll/qcj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
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
    new-instance v0, Ll/ft5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/i560$c;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, v0}, Ll/i560$c;-><init>(Ll/i560;Ll/gcg0;Ll/ft5;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/i560$a;

    .line 15
    .line 16
    invoke-direct {p1, p0, v1}, Ll/i560$a;-><init>(Ll/i560;Ll/i560$c;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/i560;->a:Lrx/c;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
