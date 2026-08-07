.class public Ll/xhk0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bik0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->values()[Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/whk0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/whk0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/vwt;->h7()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->LIVE_NICE_NUMBER:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-static {p1, v0}, Ll/v9d0;->j(Landroid/os/Bundle;Ljava/util/List;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p0, Ll/bik0;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/bik0;->f(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
