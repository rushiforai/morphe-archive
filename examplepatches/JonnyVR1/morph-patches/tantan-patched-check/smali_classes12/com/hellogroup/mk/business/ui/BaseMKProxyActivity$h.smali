.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;
.super Ll/gpj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gpj0<",
        "Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gpj0;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gpj0;->a()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_3

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p0}, Ll/gpj0;->a()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 25
    .line 26
    if-eqz v0, :cond_4

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N2()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-virtual {p0}, Ll/gpj0;->a()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 37
    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-virtual {p0}, Ll/gpj0;->a()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
