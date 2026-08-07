.class public Ll/tvz$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tvz;->id()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tvz$b;->a:Ll/tvz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/tvz$b;->a:Ll/tvz;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tvz;->gc(Ll/tvz;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/tvz;->hc(Ll/tvz;I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ja()Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;->exp_dismiss_count:I

    .line 25
    .line 26
    if-lt v0, p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/tvz$b;->a:Ll/tvz;

    .line 29
    .line 30
    invoke-static {p0}, Ll/tvz;->kc(Ll/tvz;)Ll/iam;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ll/yxz;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Ll/yxz;->A5(Z)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tvz$b;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
