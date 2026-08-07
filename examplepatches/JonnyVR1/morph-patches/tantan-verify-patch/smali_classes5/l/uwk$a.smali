.class public Ll/uwk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uwk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uwk$a;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uwk$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uwk$a;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uwk$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "failed"

    .line 6
    .line 7
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "javascript:paymentCallback(\"%s\",\"%s\")"

    .line 12
    .line 13
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Kl:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/uwk$a;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    iget-object p0, p0, Ll/uwk$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "succeed"

    .line 11
    .line 12
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v1, "javascript:paymentCallback(\"%s\",\"%s\")"

    .line 17
    .line 18
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
