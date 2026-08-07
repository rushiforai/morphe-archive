.class Lcom/hellogroup/mk/business/base/ui/MKWebView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;->r0(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/Boolean;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "lehua:boost \u5931\u8d25\u964d\u7ea7\u91cd\u65b0load url "

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "MK---WebView"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p1, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception p1

    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-static {v0, v1, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;->a(Ljava/lang/Boolean;)Lkotlin/Unit;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
