.class Lcom/bumptech/glide/load/engine/i$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/u3d0;ZLl/kzq;Lcom/bumptech/glide/load/engine/m$a;)Lcom/bumptech/glide/load/engine/m;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/u3d0<",
            "TR;>;Z",
            "Ll/kzq;",
            "Lcom/bumptech/glide/load/engine/m$a;",
            ")",
            "Lcom/bumptech/glide/load/engine/m<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/engine/m;

    .line 2
    .line 3
    const/4 v3, 0x1

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/m;-><init>(Ll/u3d0;ZZLl/kzq;Lcom/bumptech/glide/load/engine/m$a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
