.class final Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/view/View;",
        "kotlin.jvm.PlatformType",
        "onClick"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->V0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ll/x40;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Ll/x40;->f:Landroid/webkit/WebView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->V0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ll/x40;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Ll/x40;->d:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->V0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ll/x40;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 43
    .line 44
    .line 45
    return-void
.end method
