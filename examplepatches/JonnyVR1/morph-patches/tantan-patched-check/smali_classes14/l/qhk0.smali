.class public interface abstract Ll/qhk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qhk0$a;
    }
.end annotation


# virtual methods
.method public getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qhk0$a;->a(Ll/qhk0;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
.end method

.method public needUpdateUser()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract updateUser(Lcom/p1/mobile/putong/data/User;)V
.end method
