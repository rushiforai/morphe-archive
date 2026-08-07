.class public final Ll/bo50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TU;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "TU;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bo50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bo50;->b:Lrx/c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wqe0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wqe0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v1, Ll/bo50$a;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1, v0}, Ll/bo50$a;-><init>(Ll/bo50;Ll/gcg0;Ll/wqe0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/bo50;->b:Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bo50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
