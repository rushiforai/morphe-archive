.class public final Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$a;,
        Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u0000 M2\u00020\u0001:\u0002NOB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u000f\u0010\u0006\u001a\u00020\u0004H\u0014\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J\u0019\u0010\t\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0017\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0019\u0010\r\u001a\u00020\u00042\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0014\u00a2\u0006\u0004\u0008\r\u0010\u000eJ)\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u000bH\u0014\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J/\u0010\u001a\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u000e\u0010\u0017\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00160\u00152\u0006\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u0003J#\u0010!\u001a\u00020 2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0016H\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u000f\u0010#\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008#\u0010\u0003J)\u0010$\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u000f2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0003\u00a2\u0006\u0004\u0008$\u0010\u0014J\u0017\u0010&\u001a\u00020\u00042\u0006\u0010%\u001a\u00020 H\u0002\u00a2\u0006\u0004\u0008&\u0010\'J\u0017\u0010(\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008(\u0010)J\u0017\u0010*\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008*\u0010)J\u0017\u0010,\u001a\u00020\u000f2\u0006\u0010+\u001a\u00020\u0016H\u0002\u00a2\u0006\u0004\u0008,\u0010-R\u001c\u00101\u001a\u0008\u0018\u00010.R\u00020\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008/\u00100R$\u00108\u001a\u0004\u0018\u00010\u001d8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00082\u00103\u001a\u0004\u00084\u00105\"\u0004\u00086\u00107R*\u0010A\u001a\n\u0012\u0004\u0012\u00020:\u0018\u0001098\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008;\u0010<\u001a\u0004\u0008=\u0010>\"\u0004\u0008?\u0010@R0\u0010E\u001a\u0010\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020:0\u0015\u0018\u0001098\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008B\u0010<\u001a\u0004\u0008C\u0010>\"\u0004\u0008D\u0010@R\u0018\u0010H\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008F\u0010GR\u0018\u0010L\u001a\u0004\u0018\u00010I8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008J\u0010K\u00a8\u0006P"
    }
    d2 = {
        "Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "<init>",
        "()V",
        "",
        "g2",
        "initSubscription",
        "Landroid/os/Bundle;",
        "savedInstanceState",
        "preCreateView",
        "(Landroid/os/Bundle;)V",
        "Landroid/content/Intent;",
        "intent",
        "onNewIntent",
        "(Landroid/content/Intent;)V",
        "",
        "requestCode",
        "resultCode",
        "data",
        "onActivityResult",
        "(IILandroid/content/Intent;)V",
        "",
        "",
        "permissions",
        "",
        "grantResults",
        "onRequestPermissionsResult",
        "(I[Ljava/lang/String;[I)V",
        "k2",
        "Landroid/webkit/WebView;",
        "view",
        "url",
        "",
        "l2",
        "(Landroid/webkit/WebView;Ljava/lang/String;)Z",
        "i2",
        "h2",
        "trtc",
        "m2",
        "(Z)V",
        "d2",
        "(I)V",
        "o2",
        "permission",
        "c2",
        "(Ljava/lang/String;)I",
        "Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;",
        "c",
        "Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;",
        "webChromeClient",
        "d",
        "Landroid/webkit/WebView;",
        "getMWebView",
        "()Landroid/webkit/WebView;",
        "setMWebView",
        "(Landroid/webkit/WebView;)V",
        "mWebView",
        "Landroid/webkit/ValueCallback;",
        "Landroid/net/Uri;",
        "e",
        "Landroid/webkit/ValueCallback;",
        "getUploadMessage",
        "()Landroid/webkit/ValueCallback;",
        "setUploadMessage",
        "(Landroid/webkit/ValueCallback;)V",
        "uploadMessage",
        "f",
        "e2",
        "n2",
        "uploadMessageAboveL",
        "g",
        "Ljava/lang/String;",
        "curUrl",
        "Landroid/app/AlertDialog;",
        "h",
        "Landroid/app/AlertDialog;",
        "dialog",
        "Companion",
        "a",
        "b",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public c:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Landroid/webkit/WebView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public g:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public h:Landroid/app/AlertDialog;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->Companion:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->g:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static X1(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 10
    .line 11
    if-eqz p0, :cond_6

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/webkit/WebView;->onResume()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 26
    .line 27
    if-eqz p0, :cond_6

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/webkit/WebView;->onPause()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 34
    .line 35
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 42
    .line 43
    if-eqz p0, :cond_6

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 50
    .line 51
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_6

    .line 56
    .line 57
    :try_start_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 58
    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 65
    .line 66
    if-eqz p1, :cond_4

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    :catch_0
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 72
    .line 73
    if-eqz p1, :cond_5

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    const/4 v0, 0x1

    .line 80
    if-ne p1, v0, :cond_5

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 83
    .line 84
    if-eqz p1, :cond_5

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 87
    .line 88
    .line 89
    :cond_5
    const/4 p1, 0x0

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 91
    .line 92
    :cond_6
    return-void
.end method

.method public static Y1(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 p2, 0x1

    .line 10
    if-ne p1, p2, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 21
    .line 22
    return-void
.end method

.method public static Z1(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;ILandroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x1

    .line 10
    if-ne p2, p3, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p2, 0x0

    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d2(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static final synthetic a2(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->l2(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic b2(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->m2(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final g2()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cop0;->a()Ll/cop0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/cop0;->f(Landroid/webkit/WebView;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$c;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$c;-><init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;

    .line 23
    .line 24
    invoke-direct {v0, p0, p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;-><init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->c:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method


# virtual methods
.method public final c2(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final d2(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "package"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v1, v0, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroid/content/Intent;

    .line 17
    .line 18
    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 19
    .line 20
    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, v1, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final e2()Landroid/webkit/ValueCallback;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h2(IILandroid/content/Intent;)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, -0x1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-ne p2, p1, :cond_3

    .line 9
    .line 10
    if-eqz p3, :cond_3

    .line 11
    .line 12
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const/4 p3, 0x0

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    new-array v2, v1, [Landroid/net/Uri;

    .line 28
    .line 29
    move v3, p3

    .line 30
    :goto_0
    if-ge v3, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p2, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    aput-object v4, v2, v3

    .line 44
    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move-object v2, v0

    .line 49
    :cond_2
    if-eqz p1, :cond_4

    .line 50
    .line 51
    const/4 p2, 0x1

    .line 52
    new-array v2, p2, [Landroid/net/Uri;

    .line 53
    .line 54
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    aput-object p1, v2, p3

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move-object v2, v0

    .line 65
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 66
    .line 67
    if-eqz p1, :cond_5

    .line 68
    .line 69
    invoke-interface {p1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 73
    .line 74
    return-void
.end method

.method public final i2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 19
    .line 20
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 21
    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_3
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 30
    .line 31
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 32
    .line 33
    if-eqz v0, :cond_6

    .line 34
    .line 35
    if-eqz v0, :cond_5

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-static {v2, v1}, Landroid/webkit/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v0, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_5
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 49
    .line 50
    if-eqz v0, :cond_8

    .line 51
    .line 52
    if-eqz v0, :cond_7

    .line 53
    .line 54
    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_7
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 58
    .line 59
    :cond_8
    :goto_0
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/gqi0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/gqi0;-><init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final k2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "url"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->g:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final l2(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    const-string v2, "m.tantanapp.com"

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static {p2, v2, v0, v3, v4}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    const/4 v6, 0x1

    .line 24
    if-nez v5, :cond_5

    .line 25
    .line 26
    sget-object v5, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 27
    .line 28
    invoke-virtual {v5, v2}, Ll/lhl;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {p2, v2, v0, v3, v4}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_5

    .line 37
    .line 38
    const-string v2, "m.staging2.p1staff.com"

    .line 39
    .line 40
    invoke-static {p2, v2, v0, v3, v4}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v2, "http"

    .line 52
    .line 53
    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v1, "https"

    .line 64
    .line 65
    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    return v0

    .line 73
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    return v6

    .line 79
    :cond_5
    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1, p2}, Ll/mai0;->a0(Landroid/content/Intent;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 98
    .line 99
    .line 100
    return v6
.end method

.method public final m2(Z)V
    .locals 2

    .line 1
    const-string v0, "android.permission.CAMERA"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->c2(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    filled-new-array {v0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/16 v0, 0xc

    .line 16
    .line 17
    invoke-static {p0, p1, v0}, Ll/v40;->u(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    filled-new-array {v0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/16 v0, 0xb

    .line 26
    .line 27
    invoke-static {p0, p1, v0}, Ll/v40;->u(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->c:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;->enterTrtcFaceVerify()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    if-eqz p0, :cond_3

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;->enterOldModeFaceVerify()Z

    .line 44
    .line 45
    .line 46
    :cond_3
    return-void
.end method

.method public final n2(Landroid/webkit/ValueCallback;)V
    .locals 0
    .param p1    # Landroid/webkit/ValueCallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    return-void
.end method

.method public final o2(I)V
    .locals 2

    .line 1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u6743\u9650\u7533\u8bf7\u63d0\u793a"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "\u8bf7\u524d\u5f80\u8bbe\u7f6e->\u5e94\u7528->\u6743\u9650\u4e2d\u6253\u5f00\u76f8\u5173\u6743\u9650\uff0c\u5426\u5219\u529f\u80fd\u65e0\u6cd5\u6b63\u5e38\u8fd0\u884c\uff01"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/hqi0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/hqi0;-><init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;I)V

    .line 21
    .line 22
    .line 23
    const-string p1, "\u786e\u5b9a"

    .line 24
    .line 25
    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/iqi0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/iqi0;-><init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "\u53d6\u6d88"

    .line 35
    .line 36
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h:Landroid/app/AlertDialog;

    .line 50
    .line 51
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p2, v0, :cond_c

    .line 6
    .line 7
    if-eqz p3, :cond_c

    .line 8
    .line 9
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    const/16 v1, 0xb

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eq p1, v1, :cond_b

    .line 20
    .line 21
    const/16 v1, 0xc

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    if-eq p1, v1, :cond_a

    .line 25
    .line 26
    const/16 v1, 0x11

    .line 27
    .line 28
    if-eq p1, v1, :cond_9

    .line 29
    .line 30
    const/16 v1, 0x7d2

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    if-eq p1, v1, :cond_6

    .line 34
    .line 35
    const/16 v1, 0x2710

    .line 36
    .line 37
    if-eq p1, v1, :cond_1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 41
    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 45
    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    if-eq p2, v0, :cond_3

    .line 50
    .line 51
    move-object v0, v4

    .line 52
    goto :goto_0

    .line 53
    :cond_3
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 58
    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->h2(IILandroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 66
    .line 67
    if-eqz p1, :cond_8

    .line 68
    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :cond_5
    iput-object v4, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->e:Landroid/webkit/ValueCallback;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_6
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_7

    .line 82
    .line 83
    new-array v4, v3, [Landroid/net/Uri;

    .line 84
    .line 85
    aput-object p1, v4, v2

    .line 86
    .line 87
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->f:Landroid/webkit/ValueCallback;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    invoke-interface {p0, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :cond_8
    :goto_1
    return-void

    .line 95
    :cond_9
    invoke-static {}, Ll/cop0;->a()Ll/cop0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0, p1, p2, p3}, Ll/cop0;->c(IILandroid/content/Intent;)Z

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_a
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->m2(Z)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_b
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->m2(Z)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_c
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->i2()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->k2()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->i2()V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 11
    .line 12
    .line 13
    const-string p2, "\u56e0\u62d2\u7edd\u6388\u4e88\u6743\u9650\uff0c\u8bf75\u79d2\u540e\u518d\u8bd5"

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const/4 v1, 0x0

    .line 17
    const/16 v2, 0xb

    .line 18
    .line 19
    if-eq p1, v2, :cond_3

    .line 20
    .line 21
    const/16 v2, 0xc

    .line 22
    .line 23
    if-eq p1, v2, :cond_0

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    array-length p1, p3

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v0, v1

    .line 31
    :goto_0
    if-nez v0, :cond_6

    .line 32
    .line 33
    aget p1, p3, v1

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->c:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;

    .line 38
    .line 39
    if-eqz p0, :cond_6

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;->enterTrtcFaceVerify()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->o2(I)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    array-length p1, p3

    .line 53
    if-nez p1, :cond_4

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_4
    move v0, v1

    .line 57
    :goto_1
    if-nez v0, :cond_6

    .line 58
    .line 59
    aget p1, p3, v1

    .line 60
    .line 61
    if-nez p1, :cond_5

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->c:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity$b;->enterOldModeFaceVerify()Z

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_5
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->o2(I)V

    .line 72
    .line 73
    .line 74
    invoke-static {p2}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_6
    :goto_2
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WebViewUseError"
        }
    .end annotation

    .line 1
    new-instance p1, Landroid/webkit/WebView;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "title"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string p1, "\u5408\u540c\u7b7e\u7f72"

    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->d:Landroid/webkit/WebView;

    .line 30
    .line 31
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    sget v1, Ll/bnl0;->e:I

    .line 34
    .line 35
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    sget p1, Ll/b9c0;->p:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 44
    .line 45
    .line 46
    const/16 p1, 0x10

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->g2()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->k2()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
