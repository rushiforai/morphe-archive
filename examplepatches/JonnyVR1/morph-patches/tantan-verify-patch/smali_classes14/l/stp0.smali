.class public Ll/stp0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field private dialogUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/stp0;->dialogUrl:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/ui/webview/mk/a;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/stp0;->dialogUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/webview/mk/a;->Q(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "WebViewChecker"

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Ll/stp0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/stp0;->dialogUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
