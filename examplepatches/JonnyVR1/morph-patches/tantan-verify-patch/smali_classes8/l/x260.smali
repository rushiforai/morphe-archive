.class public final Ll/x260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x260$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
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
.field public final a:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TTClosing;>;>;"
        }
    .end annotation
.end field

.field public final b:I


# direct methods
.method public constructor <init>(Ll/pcj;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TTClosing;>;>;I)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Ll/x260;->a:Ll/pcj;

    .line 16
    iput p2, p0, Ll/x260;->b:I

    return-void
.end method

.method public constructor <init>(Lrx/c;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TTClosing;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x260$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/x260$a;-><init>(Ll/x260;Lrx/c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/x260;->a:Ll/pcj;

    .line 10
    .line 11
    iput p2, p0, Ll/x260;->b:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
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
    :try_start_0
    iget-object v0, p0, Ll/x260;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    new-instance v1, Ll/x260$c;

    .line 10
    .line 11
    new-instance v2, Ll/are0;

    .line 12
    .line 13
    invoke-direct {v2, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v1, p0, v2}, Ll/x260$c;-><init>(Ll/x260;Ll/gcg0;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/x260$b;

    .line 20
    .line 21
    invoke-direct {v2, p0, v1}, Ll/x260$b;-><init>(Ll/x260;Ll/x260$c;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x260;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
