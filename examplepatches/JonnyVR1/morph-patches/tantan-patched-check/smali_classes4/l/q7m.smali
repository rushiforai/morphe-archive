.class public interface abstract Ll/q7m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xql;
.implements Ll/kql;


# virtual methods
.method public abstract B0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/q7m;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Z
.end method

.method public abstract C()V
.end method

.method public abstract D(Ljava/lang/String;)Z
.end method

.method public abstract F()Z
.end method

.method public G()V
    .locals 0

    .line 1
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxl0;Lcom/p1/mobile/putong/core/data/VirtualCardType;I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public abstract R()Z
.end method

.method public abstract T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
.end method

.method public abstract U()V
.end method

.method public abstract Y()Lcom/p1/mobile/putong/core/ui/PictureView;
.end method

.method public abstract getCardData()Ll/ik4;
.end method

.method public abstract getCardView()Landroid/view/View;
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILandroid/view/View;)V
.end method

.method public n()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract q0()Z
.end method

.method public abstract r()V
.end method

.method public s()V
    .locals 0

    .line 1
    return-void
.end method

.method public setExpandedScrollListener(Ll/atl;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setPageHelper(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;)V
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public setUndoClickAction(Ll/x20;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setUsHomeCardAnimHelper(Ll/fqj0;)V
.end method

.method public abstract t()Landroid/view/ViewStub;
.end method

.method public abstract y()Z
.end method
