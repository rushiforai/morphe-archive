.class public Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ac\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0014\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008)\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0016\u0018\u0000 \u00a3\u00012\u00020\u0001:\u0002\u00a4\u0001B\'\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u000cJ\u000f\u0010\u0012\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u000cJ\u000f\u0010\u0013\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u000cJ\u0019\u0010\u0016\u001a\u00020\n2\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0011\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0092\u0001\u0010-\u001a\u00020\n2\n\u0008\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\u0008\u0008\u0002\u0010\u001e\u001a\u00020\u001d2\n\u0008\u0002\u0010\u001f\u001a\u0004\u0018\u00010\r2\u0008\u0008\u0002\u0010 \u001a\u00020\u001d2\n\u0008\u0002\u0010\"\u001a\u0004\u0018\u00010!2\n\u0008\u0002\u0010$\u001a\u0004\u0018\u00010#2\n\u0008\u0002\u0010&\u001a\u0004\u0018\u00010%2\n\u0008\u0002\u0010(\u001a\u0004\u0018\u00010\'2%\u0008\u0002\u0010,\u001a\u001f\u0012\u0013\u0012\u00110\u0014\u00a2\u0006\u000c\u0008*\u0012\u0008\u0008+\u0012\u0004\u0008\u0008(\u0015\u0012\u0004\u0012\u00020\n\u0018\u00010)H\u0007\u00a2\u0006\u0004\u0008-\u0010.J\u0017\u0010/\u001a\u00020\n2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008/\u0010\u0010J\'\u00103\u001a\u00020\n2\u0006\u00100\u001a\u00020\u00062\u0006\u00101\u001a\u00020\u001d2\u0008\u00102\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u00083\u00104J\r\u00105\u001a\u00020\n\u00a2\u0006\u0004\u00085\u0010\u000cJ\r\u00106\u001a\u00020\n\u00a2\u0006\u0004\u00086\u0010\u000cJ\r\u00107\u001a\u00020\n\u00a2\u0006\u0004\u00087\u0010\u000cJ\r\u00108\u001a\u00020\n\u00a2\u0006\u0004\u00088\u0010\u000cJ\r\u00109\u001a\u00020\n\u00a2\u0006\u0004\u00089\u0010\u000cJ\'\u0010=\u001a\u00020\n2\u0006\u0010:\u001a\u00020\u00062\u0006\u0010;\u001a\u00020\u00062\u0008\u0010<\u001a\u0004\u0018\u00010!\u00a2\u0006\u0004\u0008=\u0010>J-\u0010C\u001a\u00020\n2\u0006\u0010:\u001a\u00020\u00062\u000e\u0010@\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\r0?2\u0006\u0010B\u001a\u00020A\u00a2\u0006\u0004\u0008C\u0010DJ\r\u0010E\u001a\u00020\u001d\u00a2\u0006\u0004\u0008E\u0010FJ\u0015\u0010H\u001a\u00020\n2\u0006\u0010G\u001a\u00020\u001d\u00a2\u0006\u0004\u0008H\u0010IR$\u0010Q\u001a\u0004\u0018\u00010J8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008K\u0010L\u001a\u0004\u0008M\u0010N\"\u0004\u0008O\u0010PR$\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008R\u0010S\u001a\u0004\u0008T\u0010U\"\u0004\u0008V\u0010\u0017R$\u0010\\\u001a\u0004\u0018\u00010\r8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008W\u0010X\u001a\u0004\u0008Y\u0010Z\"\u0004\u0008[\u0010\u0010R\"\u0010d\u001a\u00020]8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008^\u0010_\u001a\u0004\u0008`\u0010a\"\u0004\u0008b\u0010cR$\u0010h\u001a\u0004\u0018\u00010\r8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008e\u0010X\u001a\u0004\u0008f\u0010Z\"\u0004\u0008g\u0010\u0010R$\u0010\"\u001a\u0004\u0018\u00010!8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008i\u0010j\u001a\u0004\u0008k\u0010l\"\u0004\u0008m\u0010nR$\u0010$\u001a\u0004\u0018\u00010#8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008o\u0010p\u001a\u0004\u0008q\u0010r\"\u0004\u0008s\u0010tR$\u0010&\u001a\u0004\u0018\u00010%8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008u\u0010v\u001a\u0004\u0008w\u0010x\"\u0004\u0008y\u0010zR%\u0010(\u001a\u0004\u0018\u00010\'8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0013\n\u0004\u0008{\u0010|\u001a\u0004\u0008}\u0010~\"\u0005\u0008\u007f\u0010\u0080\u0001RE\u0010,\u001a\u001f\u0012\u0013\u0012\u00110\u0014\u00a2\u0006\u000c\u0008*\u0012\u0008\u0008+\u0012\u0004\u0008\u0008(\u0015\u0012\u0004\u0012\u00020\n\u0018\u00010)8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0018\n\u0006\u0008\u0081\u0001\u0010\u0082\u0001\u001a\u0006\u0008\u0083\u0001\u0010\u0084\u0001\"\u0006\u0008\u0085\u0001\u0010\u0086\u0001R\u001c\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0087\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0088\u0001\u0010\u0089\u0001R\u0019\u0010\u008d\u0001\u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008b\u0001\u0010\u008c\u0001R\u0019\u0010\u008f\u0001\u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008e\u0001\u0010\u008c\u0001R\u001a\u0010\u0091\u0001\u001a\u0004\u0018\u00010\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0090\u0001\u0010XR\u001a\u0010\u0093\u0001\u001a\u0004\u0018\u00010\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0092\u0001\u0010XR\u001a\u0010\u0095\u0001\u001a\u0004\u0018\u00010\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0094\u0001\u0010XR\u001c\u0010\u0099\u0001\u001a\u0005\u0018\u00010\u0096\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0097\u0001\u0010\u0098\u0001R\u001c\u0010\u009d\u0001\u001a\u0005\u0018\u00010\u009a\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u009b\u0001\u0010\u009c\u0001R\u001c\u0010\u00a1\u0001\u001a\u0005\u0018\u00010\u009e\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u009f\u0001\u0010\u00a0\u0001R\u0018\u0010 \u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00a2\u0001\u0010\u008c\u0001\u00a8\u0006\u00a5\u0001"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attributes",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "q0",
        "()V",
        "",
        "startUrl",
        "s0",
        "(Ljava/lang/String;)V",
        "r0",
        "w0",
        "p0",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mkWebView",
        "t0",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V",
        "Landroid/app/Activity;",
        "o0",
        "()Landroid/app/Activity;",
        "Ll/zlw;",
        "mkWhiteRepairData",
        "",
        "isNeedLoadUrl",
        "url",
        "isPanel",
        "Landroid/content/Intent;",
        "intent",
        "Ll/ilw;",
        "mkWebLoadListener",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
        "onEnhanceLoadUrlListener",
        "Ll/x0c;",
        "customWebViewHelper",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "name",
        "customMkInit",
        "u0",
        "(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V",
        "y0",
        "actionType",
        "isEnable",
        "callback",
        "J0",
        "(IZLjava/lang/String;)V",
        "H0",
        "G0",
        "D0",
        "I0",
        "onDestroy",
        "requestCode",
        "resultCode",
        "data",
        "z0",
        "(IILandroid/content/Intent;)V",
        "",
        "permissions",
        "",
        "grantResults",
        "E0",
        "(I[Ljava/lang/String;[I)V",
        "B0",
        "()Z",
        "isShow",
        "K0",
        "(Z)V",
        "Ll/amw;",
        "d",
        "Ll/amw;",
        "getMkWhiteScreenUtil",
        "()Ll/amw;",
        "setMkWhiteScreenUtil",
        "(Ll/amw;)V",
        "mkWhiteScreenUtil",
        "e",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "getMkWebView",
        "()Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "setMkWebView",
        "f",
        "Ljava/lang/String;",
        "getMkUrl",
        "()Ljava/lang/String;",
        "setMkUrl",
        "mkUrl",
        "Ll/q9r;",
        "g",
        "Ll/q9r;",
        "getBinding",
        "()Ll/q9r;",
        "setBinding",
        "(Ll/q9r;)V",
        "binding",
        "h",
        "getSwipeRefreshCallback",
        "setSwipeRefreshCallback",
        "swipeRefreshCallback",
        "i",
        "Landroid/content/Intent;",
        "getIntent",
        "()Landroid/content/Intent;",
        "setIntent",
        "(Landroid/content/Intent;)V",
        "j",
        "Ll/ilw;",
        "getMkWebLoadListener",
        "()Ll/ilw;",
        "setMkWebLoadListener",
        "(Ll/ilw;)V",
        "k",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
        "getOnEnhanceLoadUrlListener",
        "()Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
        "setOnEnhanceLoadUrlListener",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V",
        "l",
        "Ll/x0c;",
        "getCustomWebViewHelper",
        "()Ll/x0c;",
        "setCustomWebViewHelper",
        "(Ll/x0c;)V",
        "m",
        "Lkotlin/jvm/functions/Function1;",
        "getCustomMkInit",
        "()Lkotlin/jvm/functions/Function1;",
        "setCustomMkInit",
        "(Lkotlin/jvm/functions/Function1;)V",
        "Ll/njw;",
        "n",
        "Ll/njw;",
        "mkUIUtil",
        "o",
        "Z",
        "isRegisterKeyboardEvent",
        "p",
        "isHideLoading",
        "q",
        "loadingCustomFlag",
        "r",
        "customNavbar",
        "s",
        "webBgColor",
        "Ll/d2f;",
        "t",
        "Ll/d2f;",
        "customerLoadingViewManager",
        "Landroid/widget/FrameLayout;",
        "u",
        "Landroid/widget/FrameLayout;",
        "toolbarContainer",
        "Landroid/view/ViewGroup;",
        "v",
        "Landroid/view/ViewGroup;",
        "curToolbarView",
        "w",
        "Companion",
        "a",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$a;


# instance fields
.field private d:Ll/amw;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private e:Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private f:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private g:Ll/q9r;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private h:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private i:Landroid/content/Intent;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private j:Ll/ilw;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private k:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private l:Ll/x0c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private m:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private n:Ll/njw;

.field private o:Z

.field private p:Z

.field private q:Ljava/lang/String;

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Ll/d2f;

.field private u:Landroid/widget/FrameLayout;

.field private v:Landroid/view/ViewGroup;

.field private w:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->Companion:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 46
    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 44
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/bec0;->e:I

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Ll/q9r;->a(Landroid/view/View;)Ll/q9r;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 25
    .line 26
    new-instance p1, Ll/amw;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/amw;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 32
    .line 33
    new-instance p1, Ll/njw;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/njw;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->n:Ll/njw;

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w0()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 45
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static final synthetic h0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Landroid/app/Activity;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic i0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic j0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Ll/d2f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic k0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Ll/njw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->n:Ll/njw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic l0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic m0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic n0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method private final o0()Landroid/app/Activity;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Landroid/app/Activity;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    :cond_0
    check-cast p0, Landroid/app/Activity;

    .line 11
    .line 12
    return-object p0
.end method

.method private final p0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v3, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;

    .line 10
    .line 11
    invoke-direct {v3, p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$checkReloadRecycleWeb$1;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/amw;->d(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/ViewGroup;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private final q0()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "1"

    .line 10
    .line 11
    const-string v3, "_clsL"

    .line 12
    .line 13
    invoke-virtual {v1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->p:Z

    .line 22
    .line 23
    const-string v2, "_loading"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->q:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "_navbar"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->r:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "_bg_color"

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->s:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-static {v1}, Ll/v1r;->a(Ljava/lang/String;)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 60
    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->r0()V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->s0(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    const-string v0, "MKWebViewWrapper"

    .line 75
    .line 76
    const-string v1, ""

    .line 77
    .line 78
    invoke-static {v0, v1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private final r0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v1, Ll/vjw;->INSTANCE:Ll/vjw;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v6, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 18
    .line 19
    iget-object v5, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->u:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    iget-object v4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->r:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual/range {v1 .. v6}, Ll/vjw;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Landroid/view/ViewGroup;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->v:Landroid/view/ViewGroup;

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private final s0(Ljava/lang/String;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/vjw;->INSTANCE:Ll/vjw;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v6, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    iget-boolean v8, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w:Z

    .line 14
    .line 15
    iget-object v4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->q:Ljava/lang/String;

    .line 16
    .line 17
    const/16 v9, 0x20

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    const/4 v7, 0x0

    .line 21
    move-object v5, p0

    .line 22
    move-object v3, p1

    .line 23
    invoke-static/range {v1 .. v10}, Ll/vjw;->c(Ll/vjw;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Boolean;ZILjava/lang/Object;)Ll/d2f;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iput-object p0, v5, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string p1, "customMkInit initEnhanceView="

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "MKWebViewWrapper"

    .line 44
    .line 45
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private final t0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/kjw;->INSTANCE:Ll/kjw;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1, p0}, Ll/kjw;->a(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic v0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p11, :cond_9

    .line 2
    .line 3
    and-int/lit8 p11, p10, 0x1

    .line 4
    .line 5
    if-eqz p11, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    and-int/lit8 p11, p10, 0x2

    .line 9
    .line 10
    if-eqz p11, :cond_1

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    :cond_1
    and-int/lit8 p11, p10, 0x4

    .line 14
    .line 15
    if-eqz p11, :cond_2

    .line 16
    .line 17
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p11, p10, 0x8

    .line 20
    .line 21
    if-eqz p11, :cond_3

    .line 22
    .line 23
    iget-boolean p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w:Z

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p11, p10, 0x10

    .line 26
    .line 27
    if-eqz p11, :cond_4

    .line 28
    .line 29
    iget-object p5, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->i:Landroid/content/Intent;

    .line 30
    .line 31
    :cond_4
    and-int/lit8 p11, p10, 0x20

    .line 32
    .line 33
    if-eqz p11, :cond_5

    .line 34
    .line 35
    iget-object p6, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->j:Ll/ilw;

    .line 36
    .line 37
    :cond_5
    and-int/lit8 p11, p10, 0x40

    .line 38
    .line 39
    if-eqz p11, :cond_6

    .line 40
    .line 41
    iget-object p7, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->k:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 42
    .line 43
    :cond_6
    and-int/lit16 p11, p10, 0x80

    .line 44
    .line 45
    if-eqz p11, :cond_7

    .line 46
    .line 47
    iget-object p8, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 48
    .line 49
    :cond_7
    and-int/lit16 p10, p10, 0x100

    .line 50
    .line 51
    if-eqz p10, :cond_8

    .line 52
    .line 53
    iget-object p9, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->m:Lkotlin/jvm/functions/Function1;

    .line 54
    .line 55
    :cond_8
    move-object p10, p8

    .line 56
    move-object p11, p9

    .line 57
    move-object p8, p6

    .line 58
    move-object p9, p7

    .line 59
    move p6, p4

    .line 60
    move-object p7, p5

    .line 61
    move p4, p2

    .line 62
    move-object p5, p3

    .line 63
    move-object p2, p0

    .line 64
    move-object p3, p1

    .line 65
    invoke-virtual/range {p2 .. p11}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->u0(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_9
    const-string p0, "Super calls with default arguments not supported in this target, function: initMK"

    .line 70
    .line 71
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private final w0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 2
    .line 3
    iget-object v0, v0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 13
    .line 14
    iget-object v0, v0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 15
    .line 16
    new-instance v1, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setOnRefreshListener(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final B0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->canGoBack()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final D0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/d2f;->c(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->u()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/amw;->b()V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public final E0(I[Ljava/lang/String;[I)V
    .locals 0
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
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->G(I[Ljava/lang/String;[I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/d2f;->d(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->p0()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->v()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final H0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/d2f;->e(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/d2f;->f(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final J0(IZLjava/lang/String;)V
    .locals 1
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;IZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final K0(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/d2f;->g(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final getBinding()Ll/q9r;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCustomMkInit()Lkotlin/jvm/functions/Function1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->m:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCustomWebViewHelper()Ll/x0c;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getIntent()Landroid/content/Intent;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->i:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMkUrl()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMkWebLoadListener()Ll/ilw;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->j:Ll/ilw;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMkWebView()Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMkWhiteScreenUtil()Ll/amw;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOnEnhanceLoadUrlListener()Lcom/hellogroup/mk/business/base/ui/MKWebView$f;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->k:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSwipeRefreshCallback()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onDestroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t:Ll/d2f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/d2f;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->n:Ll/njw;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/njw;->g(Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d()V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ll/amw;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public final setBinding(Ll/q9r;)V
    .locals 0
    .param p1    # Ll/q9r;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 5
    .line 6
    return-void
.end method

.method public final setCustomMkInit(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->m:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-void
.end method

.method public final setCustomWebViewHelper(Ll/x0c;)V
    .locals 0
    .param p1    # Ll/x0c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 2
    .line 3
    return-void
.end method

.method public final setIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->i:Landroid/content/Intent;

    .line 2
    .line 3
    return-void
.end method

.method public final setMkUrl(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final setMkWebLoadListener(Ll/ilw;)V
    .locals 0
    .param p1    # Ll/ilw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->j:Ll/ilw;

    .line 2
    .line 3
    return-void
.end method

.method public final setMkWebView(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-void
.end method

.method public final setMkWhiteScreenUtil(Ll/amw;)V
    .locals 0
    .param p1    # Ll/amw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->d:Ll/amw;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnEnhanceLoadUrlListener(Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView$f;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->k:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 2
    .line 3
    return-void
.end method

.method public final setSwipeRefreshCallback(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final u0(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V
    .locals 6
    .param p1    # Ll/zlw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/ilw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/hellogroup/mk/business/base/ui/MKWebView$f;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/x0c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p9    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zlw;",
            "Z",
            "Ljava/lang/String;",
            "Z",
            "Landroid/content/Intent;",
            "Ll/ilw;",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
            "Ll/x0c;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    iput-boolean p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w:Z

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iput-object p5, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->i:Landroid/content/Intent;

    .line 6
    .line 7
    :cond_0
    if-eqz p6, :cond_1

    .line 8
    .line 9
    iput-object p6, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->j:Ll/ilw;

    .line 10
    .line 11
    :cond_1
    if-eqz p7, :cond_2

    .line 12
    .line 13
    iput-object p7, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->k:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 14
    .line 15
    :cond_2
    if-eqz p8, :cond_3

    .line 16
    .line 17
    iput-object p8, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 18
    .line 19
    :cond_3
    if-eqz p9, :cond_4

    .line 20
    .line 21
    iput-object p9, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->m:Lkotlin/jvm/functions/Function1;

    .line 22
    .line 23
    :cond_4
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->o0()Landroid/app/Activity;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sget-object p4, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 28
    .line 29
    invoke-virtual {p4, v4, p3, p5}, Ll/mjw;->s(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Intent;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    if-eqz p4, :cond_5

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_5
    new-instance p4, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    invoke-static {p5, p3}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 39
    .line 40
    .line 41
    move-result-object p5

    .line 42
    invoke-direct {p4, v4, p5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iput-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    new-instance p5, Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    const/4 v0, -0x1

    .line 50
    invoke-direct {p5, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p4, p5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 57
    .line 58
    const/4 p5, 0x0

    .line 59
    if-eqz p4, :cond_8

    .line 60
    .line 61
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->i()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_7

    .line 68
    .line 69
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/hellogroup/mk/fdt/FDTManager;->k()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_6

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_6
    move v0, p5

    .line 79
    goto :goto_2

    .line 80
    :cond_7
    :goto_1
    const/4 v0, 0x1

    .line 81
    :goto_2
    invoke-virtual {p4, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setDebuggable(Z)V

    .line 82
    .line 83
    .line 84
    :cond_8
    iget-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->g:Ll/q9r;

    .line 85
    .line 86
    iget-object p4, p4, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 89
    .line 90
    invoke-virtual {p4, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->addView(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    if-eqz p1, :cond_9

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/zlw;->a()Ll/nlw;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    if-eqz p1, :cond_9

    .line 100
    .line 101
    iget-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 102
    .line 103
    if-eqz p4, :cond_9

    .line 104
    .line 105
    invoke-virtual {p4, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0(Ll/nlw;)V

    .line 106
    .line 107
    .line 108
    :cond_9
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 109
    .line 110
    if-nez p1, :cond_b

    .line 111
    .line 112
    if-eqz p8, :cond_a

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_a
    new-instance p8, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;

    .line 116
    .line 117
    invoke-direct {p8, p0, v4, p3, p3}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$b;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :goto_3
    iput-object p8, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 121
    .line 122
    :cond_b
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 123
    .line 124
    if-eqz p1, :cond_c

    .line 125
    .line 126
    invoke-virtual {p1, p5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 127
    .line 128
    .line 129
    :cond_c
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 130
    .line 131
    if-eqz p1, :cond_d

    .line 132
    .line 133
    invoke-static {p3}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    invoke-virtual {p1, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebUserAgent(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_d
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 141
    .line 142
    if-eqz v1, :cond_e

    .line 143
    .line 144
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 145
    .line 146
    invoke-virtual {v1, v4, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 150
    .line 151
    if-eqz p1, :cond_e

    .line 152
    .line 153
    new-instance v0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;

    .line 154
    .line 155
    move-object v2, v1

    .line 156
    move-object v3, p0

    .line 157
    move-object v5, p6

    .line 158
    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;-><init>(Ll/x0c;Ll/nxl;Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Landroid/app/Activity;Ll/ilw;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 162
    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_e
    move-object v3, p0

    .line 166
    :goto_4
    iget-object p0, v3, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 167
    .line 168
    invoke-direct {v3, p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->t0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 169
    .line 170
    .line 171
    iget-object p0, v3, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 172
    .line 173
    if-eqz p0, :cond_f

    .line 174
    .line 175
    new-instance p1, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;

    .line 176
    .line 177
    invoke-direct {p1, v3, p7}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setOnLoadUrlListener(Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V

    .line 181
    .line 182
    .line 183
    :cond_f
    iget-object p0, v3, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 184
    .line 185
    if-eqz p0, :cond_10

    .line 186
    .line 187
    if-eqz p9, :cond_10

    .line 188
    .line 189
    invoke-interface {p9, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    check-cast p0, Lkotlin/Unit;

    .line 194
    .line 195
    :cond_10
    if-eqz p2, :cond_11

    .line 196
    .line 197
    invoke-virtual {v3, p3}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->y0(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_11
    return-void
.end method

.method public final y0(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->f:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->q0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->e:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final z0(IILandroid/content/Intent;)V
    .locals 0
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->l:Ll/x0c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->E(IILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
