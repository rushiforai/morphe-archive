.class public final Ll/y260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y260$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "TOpening:",
        "Ljava/lang/Object;",
        "TClosing:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ljava/util/List<",
        "TT;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TTOpening;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TTOpening;+",
            "Lrx/c<",
            "+TTClosing;>;>;"
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
            "+TTOpening;>;",
            "Ll/qcj<",
            "-TTOpening;+",
            "Lrx/c<",
            "+TTClosing;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y260;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/y260;->b:Ll/qcj;

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
            "Ljava/util/List<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/y260$b;

    .line 2
    .line 3
    new-instance v1, Ll/are0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/y260$b;-><init>(Ll/y260;Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/y260$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Ll/y260$a;-><init>(Ll/y260;Ll/y260$b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/y260;->a:Lrx/c;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y260;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
