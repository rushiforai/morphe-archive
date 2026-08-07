.class public interface abstract Ll/e5h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/fragment/app/Fragment;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract a(Ll/dsl;)Landroidx/fragment/app/Fragment;
    .param p1    # Ll/dsl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dsl;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract b()Landroid/os/Bundle;
.end method

.method public c()Landroidx/fragment/app/Fragment;
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/e5h;->b()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v1}, Ll/e5h;->a(Ll/dsl;)Landroidx/fragment/app/Fragment;

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

.method public abstract getTitle()Ljava/lang/String;
.end method
