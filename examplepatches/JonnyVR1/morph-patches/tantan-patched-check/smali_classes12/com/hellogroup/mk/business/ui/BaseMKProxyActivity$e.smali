.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/skw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Ll/rkw;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 4
    .line 5
    iget-object p2, p2, Ll/rkw;->d:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tkw;->e()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
