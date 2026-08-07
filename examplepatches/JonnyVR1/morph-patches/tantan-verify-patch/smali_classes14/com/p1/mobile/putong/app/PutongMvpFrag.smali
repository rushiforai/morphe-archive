.class public abstract Lcom/p1/mobile/putong/app/PutongMvpFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<p:",
        "Ll/ar2;",
        "v::",
        "Ll/iam<",
        "Tp;>;>",
        "Lcom/p1/mobile/putong/app/PutongFrag;"
    }
.end annotation


# instance fields
.field public A:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Tv;"
        }
    .end annotation
.end field

.field public z:Ll/ar2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Tp;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract M4()Ll/ar2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()Tp;"
        }
    .end annotation
.end method

.method public abstract N4()Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()Tv;"
        }
    .end annotation
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->M4()Ll/ar2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->N4()Ll/iam;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->Z()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
