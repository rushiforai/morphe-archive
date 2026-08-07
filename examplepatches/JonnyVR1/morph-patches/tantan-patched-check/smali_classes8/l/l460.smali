.class public final Ll/l460;
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
.field public final a:Ll/f2e0;

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Ll/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/l460;->a:Ll/f2e0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/l460;->b:Lrx/c;

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
    iget-object v0, p0, Ll/l460;->a:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/l460$a;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, v0}, Ll/l460$a;-><init>(Ll/l460;Ll/gcg0;Ll/f2e0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l460;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
