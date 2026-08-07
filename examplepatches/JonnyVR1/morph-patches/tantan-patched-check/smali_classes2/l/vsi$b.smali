.class public Ll/vsi$b;
.super Lcom/facebook/imagepipeline/memory/a;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vsi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>(Ll/gqy;Ll/bj80;Ll/cj80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/memory/a;-><init>(Ll/gqy;Ll/bj80;Ll/cj80;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public x(I)Ll/pg3;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pg3<",
            "[B>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/m850;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/a;->p(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->c:Ll/bj80;

    .line 8
    .line 9
    iget p0, p0, Ll/bj80;->g:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p1, p0, v1}, Ll/m850;-><init>(III)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
