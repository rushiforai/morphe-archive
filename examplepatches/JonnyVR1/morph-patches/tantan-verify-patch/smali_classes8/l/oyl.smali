.class public interface abstract Ll/oyl;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/oyl;->getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ll/oyl;->setContent(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract getClickView()Landroid/view/View;
.end method

.method public abstract getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
