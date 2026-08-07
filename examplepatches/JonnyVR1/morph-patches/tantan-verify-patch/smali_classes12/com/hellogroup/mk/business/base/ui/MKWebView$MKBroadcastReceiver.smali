.class Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MKBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method private constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "com.immomo.momo.mk.post_message"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 17
    .line 18
    invoke-static {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method
