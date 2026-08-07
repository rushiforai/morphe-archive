.class public Ll/vsi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vsi$b;
    }
.end annotation


# instance fields
.field public final a:Ll/w4d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w4d0<",
            "[B>;"
        }
    .end annotation
.end field

.field public final b:Ll/vsi$b;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gqy;Ll/bj80;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p2, Ll/bj80;->g:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/vsi$b;

    .line 19
    .line 20
    invoke-static {}, Ll/ht40;->h()Ll/ht40;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, p1, p2, v1}, Ll/vsi$b;-><init>(Ll/gqy;Ll/bj80;Ll/cj80;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/vsi;->b:Ll/vsi$b;

    .line 28
    .line 29
    new-instance p1, Ll/vsi$a;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/vsi$a;-><init>(Ll/vsi;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/vsi;->a:Ll/w4d0;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a(I)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/fb5<",
            "[B>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vsi;->b:Ll/vsi$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, [B

    .line 8
    .line 9
    iget-object p0, p0, Ll/vsi;->a:Ll/w4d0;

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public b([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsi;->b:Ll/vsi$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->release(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
