.class final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->p0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/zlw;",
        "Ljava/lang/String;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0007\u001a\u00020\u00042\u0008\u0010\u0001\u001a\u0004\u0018\u00010\u00002\u0006\u0010\u0003\u001a\u00020\u0002H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Ll/zlw;",
        "mkWhiteRepairData",
        "",
        "newStartUrl",
        "",
        "invoke",
        "(Ll/zlw;Ljava/lang/String;)V",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;->this$0:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 36
    check-cast p1, Ll/zlw;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;->invoke(Ll/zlw;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/zlw;Ljava/lang/String;)V
    .locals 13
    .param p1    # Ll/zlw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;->this$0:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->setMkUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;->this$0:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const/16 v11, 0x1f6

    .line 22
    .line 23
    const/4 v12, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const/4 v8, 0x0

    .line 29
    const/4 v9, 0x0

    .line 30
    const/4 v10, 0x0

    .line 31
    move-object v2, p1

    .line 32
    invoke-static/range {v1 .. v12}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->v0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
