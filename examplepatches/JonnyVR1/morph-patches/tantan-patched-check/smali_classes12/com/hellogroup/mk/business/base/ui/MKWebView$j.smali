.class Lcom/hellogroup/mk/business/base/ui/MKWebView$j;
.super Ll/gpj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gpj0<",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
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
    .locals 1

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
    invoke-virtual {p0}, Ll/gpj0;->a()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/os/Message;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
