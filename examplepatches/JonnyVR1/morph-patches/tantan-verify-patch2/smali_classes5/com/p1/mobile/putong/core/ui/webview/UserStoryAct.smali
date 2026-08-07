.class public Lcom/p1/mobile/putong/core/ui/webview/UserStoryAct;
.super Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/webview/UserStoryAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "title"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "url"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public c2()Ll/lup0;
    .locals 1

    .line 1
    new-instance v0, Ll/uik0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uik0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/sup0;
    .locals 1

    .line 1
    new-instance v0, Ll/ajk0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ajk0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

    .line 19
    .line 20
    check-cast p0, Ll/uik0;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/uik0;->A0(Lcom/p1/mobile/putong/data/Picture;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
