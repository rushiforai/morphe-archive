.class public Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;
.super Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;
.source "SourceFile"


# instance fields
.field public e:Ll/u5l;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b2()Ll/pd00;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->e:Ll/u5l;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/u5l;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/u5l;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->e:Ll/u5l;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->e:Ll/u5l;

    .line 13
    .line 14
    return-object p0
.end method

.method public c2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->e:Ll/u5l;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u5l;->c0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->e:Ll/u5l;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/u5l;->b0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isMainPage(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 20
    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->preCreateView(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->finish()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
