.class final Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
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
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

.field final synthetic b:Ll/kf3;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;Ll/kf3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$a;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$a;->b:Ll/kf3;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$a;->b:Ll/kf3;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$a;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->c()Ll/x40;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-virtual {v0, p0}, Ll/kf3;->l(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
