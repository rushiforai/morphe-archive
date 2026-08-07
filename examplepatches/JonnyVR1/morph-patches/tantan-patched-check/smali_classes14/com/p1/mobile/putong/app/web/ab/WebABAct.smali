.class public Lcom/p1/mobile/putong/app/web/ab/WebABAct;
.super Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.source "SourceFile"


# instance fields
.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c2()Ll/lup0;
    .locals 1

    .line 1
    new-instance v0, Ll/tqp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tqp0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/sup0;
    .locals 1

    .line 1
    new-instance v0, Ll/vqp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vqp0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public g2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/web/ab/WebABAct;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "pageName"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/app/web/ab/WebABAct;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->initDataOnCreate()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ar2;->Z()V

    .line 21
    .line 22
    .line 23
    const-string v0, "p_mytantan"

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/app/web/ab/WebABAct;->f:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hackCenterTitle:Z

    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/web/ab/WebABAct;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
