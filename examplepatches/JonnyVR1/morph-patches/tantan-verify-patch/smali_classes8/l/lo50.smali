.class public final Ll/lo50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lo50$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field public final c:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "TR;-TT;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Ljava/lang/Object;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;TR;",
            "Ll/rcj<",
            "TR;-TT;TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lo50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lo50;->b:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lo50;->c:Ll/rcj;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/lo50$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lo50;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Ll/lo50;->c:Ll/rcj;

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2}, Ll/lo50$a;-><init>(Ll/gcg0;Ljava/lang/Object;Ll/rcj;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/lo50;->a:Lrx/c;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/aud;->k(Lrx/c;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lo50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
