.class final Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity$onCreate$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity$onCreate$1;->this$0:Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity$onCreate$1;->invoke(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity$onCreate$1;->this$0:Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;->V0()Ll/j50;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p1, p1, Ll/j50;->c:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getMkWebView()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/MKCommonWebPanelActivity;->a1(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
