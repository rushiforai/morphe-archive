.class public interface abstract Ll/o7h;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a(Ll/dsl;)Landroidx/fragment/app/Fragment;
    .param p1    # Ll/dsl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract b()Landroid/os/Bundle;
.end method

.method public c()Landroidx/fragment/app/Fragment;
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/o7h;->b()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v1}, Ll/o7h;->a(Ll/dsl;)Landroidx/fragment/app/Fragment;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public abstract d()Z
.end method

.method public abstract e()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method
