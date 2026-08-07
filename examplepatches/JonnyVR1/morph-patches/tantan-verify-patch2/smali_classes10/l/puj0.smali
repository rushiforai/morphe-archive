.class public abstract Ll/puj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ouj0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/view/View;

.field public c:Ll/ouj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/puj0;->a:Lv/VFrame;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/ouj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/puj0;->c:Ll/ouj0;

    .line 2
    .line 3
    return-void
.end method

.method public abstract c()V
.end method

.method public abstract d()I
.end method

.method public abstract e()I
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ll/puj0;->d()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/puj0;->c()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/puj0;->e()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 42
    .line 43
    iget-object p0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/puj0;->a:Lv/VFrame;

    .line 16
    .line 17
    iget-object p0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ouj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/puj0;->b(Ll/ouj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation
.end method
