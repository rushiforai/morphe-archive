.class public Ll/aqq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqq;


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongAct;

.field public final b:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public final c:Ljava/lang/String;

.field public d:Ll/gqq;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aqq;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aqq;->b:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    iput-object p3, p0, Ll/aqq;->c:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p3, Ll/gqq;

    .line 11
    .line 12
    invoke-direct {p3, p1, p2}, Ll/gqq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 13
    .line 14
    .line 15
    iput-object p3, p0, Ll/aqq;->d:Ll/gqq;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Landroid/webkit/WebView;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqq;->e()Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqq;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqq;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/hqq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqq;->d:Ll/gqq;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/app/web/WebViewX;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqq;->b:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqq;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
