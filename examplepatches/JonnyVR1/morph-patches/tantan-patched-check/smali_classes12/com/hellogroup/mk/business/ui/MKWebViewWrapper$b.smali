.class public final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;
.super Ll/x0c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->u0(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000;\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J)\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0019\u0010\r\u001a\u00020\u00082\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0019\u0010\u0013\u001a\u00020\u00082\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0019\u0010\u0017\u001a\u00020\u00082\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ#\u0010\u001e\u001a\u00020\u00042\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008 \u0010\u001a\u00a8\u0006!"
    }
    d2 = {
        "com/hellogroup/mk/business/ui/MKWebViewWrapper$b",
        "Ll/x0c;",
        "",
        "actionType",
        "",
        "isEnable",
        "",
        "callback",
        "",
        "w",
        "(IZLjava/lang/String;)V",
        "Ll/ave0;",
        "uiParams",
        "k",
        "(Ll/ave0;)V",
        "show",
        "e",
        "(Z)V",
        "title",
        "g",
        "(Ljava/lang/String;)V",
        "Ll/zue0;",
        "params",
        "r",
        "(Ll/zue0;)V",
        "f",
        "()V",
        "url",
        "Lorg/json/JSONObject;",
        "jsParams",
        "m",
        "(Ljava/lang/String;Lorg/json/JSONObject;)Z",
        "closePage",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic m:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

.field final synthetic n:Landroid/app/Activity;

.field final synthetic o:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;->m:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;->n:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;->o:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p4}, Ll/x0c;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public closePage()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;->n:Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public k(Ll/ave0;)V
    .locals 0
    .param p1    # Ll/ave0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public m(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->m(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r(Ll/zue0;)V
    .locals 0
    .param p1    # Ll/zue0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public w(IZLjava/lang/String;)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;->m:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->J0(IZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
