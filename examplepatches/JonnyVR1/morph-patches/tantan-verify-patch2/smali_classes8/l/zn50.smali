.class public final Ll/zn50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zn50;->a:Ll/pcj;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zn50;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zn50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
