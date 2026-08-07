.class public final Ll/nxi0$c;
.super Ll/z3g0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nxi0;->b(Ll/z06;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/z3g0<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00028\u00000\u0001J\u0019\u0010\u0004\u001a\u00020\u00032\u0008\u0010\u0002\u001a\u0004\u0018\u00018\u0000H\u0014\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\u0006\u001a\u00020\u00032\u0008\u0010\u0002\u001a\u0004\u0018\u00018\u0000H\u0014\u00a2\u0006\u0004\u0008\u0006\u0010\u0005J\u0011\u0010\u0007\u001a\u0004\u0018\u00018\u0000H\u0014\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/nxi0$c",
        "Ll/z3g0;",
        "ignored",
        "",
        "f",
        "(Ljava/lang/Object;)V",
        "b",
        "c",
        "()Ljava/lang/Object;",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic f:Ll/z06;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z06<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/cl90;

.field public final synthetic h:Ll/yk90;

.field public final synthetic i:Ll/nxi0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nxi0<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/z06;Ll/cl90;Ll/yk90;Ll/nxi0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TT;>;",
            "Ll/cl90;",
            "Ll/yk90;",
            "Ll/nxi0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nxi0$c;->f:Ll/z06;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nxi0$c;->g:Ll/cl90;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nxi0$c;->h:Ll/yk90;

    .line 6
    .line 7
    iput-object p4, p0, Ll/nxi0$c;->i:Ll/nxi0;

    .line 8
    .line 9
    const-string p4, "BackgroundThreadHandoffProducer"

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3, p4}, Ll/z3g0;-><init>(Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public c()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public f(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/nxi0$c;->g:Ll/cl90;

    .line 2
    .line 3
    iget-object v0, p0, Ll/nxi0$c;->h:Ll/yk90;

    .line 4
    .line 5
    const-string v1, "BackgroundThreadHandoffProducer"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {p1, v0, v1, v2}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/nxi0$c;->i:Ll/nxi0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/nxi0;->c()Ll/wk90;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/nxi0$c;->f:Ll/z06;

    .line 18
    .line 19
    iget-object p0, p0, Ll/nxi0$c;->h:Ll/yk90;

    .line 20
    .line 21
    invoke-interface {p1, v0, p0}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
