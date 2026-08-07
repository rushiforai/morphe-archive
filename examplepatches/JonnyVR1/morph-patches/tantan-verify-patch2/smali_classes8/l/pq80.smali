.class public interface abstract Ll/pq80;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract b(Ll/cf60;)V
.end method

.method public d(ILandroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/pq80;->i(ILcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2}, Ll/pq80;->h(ILcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public abstract e()Ll/ie80$c;
.end method

.method public abstract f(Landroidx/viewpager/widget/ViewPager;II)V
.end method

.method public abstract g()V
.end method

.method public abstract h(ILcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
.end method

.method public abstract i(ILcom/p1/mobile/putong/core/ui/PlayerView;)V
.end method
