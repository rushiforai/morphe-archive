.class public Ll/ufs;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ufs;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ufs;->a:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget p0, p0, Ll/ufs;->b:I

    .line 12
    .line 13
    if-lez p0, :cond_1

    .line 14
    .line 15
    filled-new-array {p1}, [Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
