.class public Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;
.super Ll/up9;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0016\u0018\u0000 ]2\u00020\u0001:\u0001^B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J-\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rJ+\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0019\u0010\u0014\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J)\u0010\u001d\u001a\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0019\u0010\u001f\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u0015J#\u0010\"\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010!\u001a\u0004\u0018\u00010 H\u0002\u00a2\u0006\u0004\u0008\"\u0010#J\u0019\u0010$\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008$\u0010\u0015J9\u0010(\u001a\"\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00060&j\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0006`\'2\u0008\u0010%\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008(\u0010)J\u0017\u0010+\u001a\u00020\u000b2\u0006\u0010*\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008+\u0010,J\u0019\u0010.\u001a\u00020\u00112\u0008\u0010-\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008.\u0010\u0015J\u0019\u00100\u001a\u00020\u00112\u0008\u0010/\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u00080\u0010\u0015J\'\u00102\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u00182\u0006\u0010\u0010\u001a\u00020\u00062\u0006\u00101\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u00082\u00103J\u0017\u00107\u001a\u0002062\u0006\u00105\u001a\u000204H\u0002\u00a2\u0006\u0004\u00087\u00108J\'\u0010;\u001a\u0002062\u0006\u00105\u001a\u0002042\u0006\u00109\u001a\u00020\u00182\u0006\u0010:\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008;\u0010<J\u0019\u0010=\u001a\u0004\u0018\u0001062\u0006\u00105\u001a\u000204H\u0002\u00a2\u0006\u0004\u0008=\u00108J\u001f\u0010?\u001a\u00020\u000b2\u0006\u00101\u001a\u00020\u00062\u0006\u0010>\u001a\u000206H\u0002\u00a2\u0006\u0004\u0008?\u0010@J\u0019\u0010A\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008A\u0010\u0015J\u0019\u0010B\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008B\u0010\u0015J\'\u0010F\u001a\u00020\u00112\u0006\u0010C\u001a\u00020\t2\u0006\u0010D\u001a\u00020\u00062\u0006\u0010E\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008F\u0010GJ\u0019\u0010H\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008H\u0010\u0015J\u0019\u0010I\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008I\u0010\u0015J\u0019\u0010J\u001a\u00020\u00112\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008J\u0010\u0015R\u0014\u0010N\u001a\u00020K8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008L\u0010MR\u0014\u0010Q\u001a\u00020\u00068\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008O\u0010PR\u0014\u0010S\u001a\u00020\u00068\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008R\u0010PR\u0014\u0010T\u001a\u00020\u00068\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010PR\u0014\u0010V\u001a\u00020\u00188\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008U\u0010.R\u0018\u0010X\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008:\u0010WR\u0014\u0010\\\u001a\u00020Y8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008Z\u0010[\u00a8\u0006_"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;",
        "Ll/up9;",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mkWebview",
        "<init>",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V",
        "",
        "namespace",
        "method",
        "Lorg/json/JSONObject;",
        "params",
        "",
        "p",
        "(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z",
        "mkCallback",
        "status",
        "msg",
        "",
        "M",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "R",
        "(Lorg/json/JSONObject;)V",
        "L",
        "()Ljava/lang/String;",
        "",
        "requestCode",
        "resultCode",
        "Landroid/content/Intent;",
        "data",
        "f",
        "(IILandroid/content/Intent;)Z",
        "P",
        "Ll/jjw;",
        "response",
        "O",
        "(Lorg/json/JSONObject;Ll/jjw;)V",
        "Y",
        "uploadParams",
        "Ljava/util/HashMap;",
        "Lkotlin/collections/HashMap;",
        "J",
        "(Lorg/json/JSONObject;)Ljava/util/HashMap;",
        "suffix",
        "N",
        "(Ljava/lang/String;)Z",
        "imgDataJson",
        "I",
        "jsonObject",
        "U",
        "path",
        "F",
        "(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        "Landroid/view/View;",
        "v",
        "Landroid/graphics/Bitmap;",
        "D",
        "(Landroid/view/View;)Landroid/graphics/Bitmap;",
        "w",
        "h",
        "E",
        "(Landroid/view/View;II)Landroid/graphics/Bitmap;",
        "H",
        "bitmap",
        "S",
        "(Ljava/lang/String;Landroid/graphics/Bitmap;)Z",
        "T",
        "W",
        "json",
        "k",
        "b",
        "Q",
        "(Lorg/json/JSONObject;Ljava/lang/String;Z)V",
        "X",
        "K",
        "V",
        "Ll/po5;",
        "c",
        "Ll/po5;",
        "job",
        "d",
        "Ljava/lang/String;",
        "IMG_REP_TYPE_BASE64",
        "e",
        "IMG_REP_TYPE_PATH",
        "IMG_REP_TYPE_MKFILE",
        "g",
        "REQUEST_CODE_ALBUM",
        "Lorg/json/JSONObject;",
        "imgReadRequestParams",
        "Lkotlin/coroutines/CoroutineContext;",
        "G",
        "()Lkotlin/coroutines/CoroutineContext;",
        "coroutineContext",
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
.field public static final Companion:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$a;


# instance fields
.field private final c:Ll/po5;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:I

.field private h:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->Companion:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$a;

    return-void
.end method

.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/up9;-><init>(Ll/hul;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p1, v0, p1}, Ll/fpq;->b(Lkotlinx/coroutines/o;ILjava/lang/Object;)Ll/po5;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->c:Ll/po5;

    .line 14
    .line 15
    const-string p1, "base64"

    .line 16
    .line 17
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->d:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "file"

    .line 20
    .line 21
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->e:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "mkfile"

    .line 24
    .line 25
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->f:Ljava/lang/String;

    .line 26
    .line 27
    const/16 p1, 0x3e9

    .line 28
    .line 29
    iput p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->g:I

    .line 30
    .line 31
    return-void
.end method

.method public static final synthetic A(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->Q(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic B(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->S(Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic C(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->U(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final D(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {p0, p1, v0, v1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->E(Landroid/view/View;II)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private final E(Landroid/view/View;II)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    invoke-static {p2, p3, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Landroid/graphics/Canvas;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method private final F(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string p0, "message"

    .line 2
    .line 3
    const-string v0, "image"

    .line 4
    .line 5
    const-string v1, "status"

    .line 6
    .line 7
    filled-new-array {v1, p0, v0}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1, p2, p3}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ll/qpl;->a([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method private final G()Lkotlin/coroutines/CoroutineContext;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/common/thread/MMDispatchers;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->c:Ll/po5;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private final H(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private final I(Lorg/json/JSONObject;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "cid"

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v0

    .line 12
    :goto_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const-string v3, "url"

    .line 15
    .line 16
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move-object v3, v0

    .line 22
    :goto_1
    const-string v4, ""

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    const-string v5, "path"

    .line 27
    .line 28
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    if-eqz v5, :cond_2

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move-object v5, v4

    .line 36
    :goto_2
    const/4 v6, 0x0

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    const-string v7, "compressWidth"

    .line 40
    .line 41
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    goto :goto_3

    .line 46
    :cond_3
    move v7, v6

    .line 47
    :goto_3
    if-eqz p1, :cond_4

    .line 48
    .line 49
    const-string v6, "compressHeight"

    .line 50
    .line 51
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    :cond_4
    if-eqz p1, :cond_5

    .line 56
    .line 57
    const-string v0, "callback"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :cond_5
    invoke-static {v3}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_9

    .line 68
    .line 69
    invoke-static {v5}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_9

    .line 74
    .line 75
    if-lez v7, :cond_9

    .line 76
    .line 77
    if-lez v6, :cond_9

    .line 78
    .line 79
    :try_start_0
    invoke-static {v5}, Ll/wkw;->k(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_7

    .line 84
    .line 85
    invoke-static {v5}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-eqz p1, :cond_6

    .line 90
    .line 91
    move-object v5, p1

    .line 92
    goto :goto_4

    .line 93
    :cond_6
    move-object v5, v4

    .line 94
    goto :goto_4

    .line 95
    :catch_0
    move-exception p0

    .line 96
    goto :goto_5

    .line 97
    :cond_7
    :goto_4
    sget-object p1, Ll/o33;->INSTANCE:Ll/o33;

    .line 98
    .line 99
    invoke-virtual {p1, v5, v7, v6}, Ll/o33;->a(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    const-string v3, "data"

    .line 104
    .line 105
    if-nez p1, :cond_8

    .line 106
    .line 107
    :try_start_1
    new-instance p1, Lorg/json/JSONObject;

    .line 108
    .line 109
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p0, v0, p1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_8
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    .line 127
    .line 128
    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 129
    .line 130
    .line 131
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 132
    .line 133
    const/16 v7, 0x64

    .line 134
    .line 135
    invoke-virtual {p1, v6, v7, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const/4 v5, 0x2

    .line 143
    invoke-static {p1, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    new-instance v5, Lorg/json/JSONObject;

    .line 148
    .line 149
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v5, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v5, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p0, v0, p1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :goto_5
    const-string p1, "MediaExtraBridge"

    .line 167
    .line 168
    invoke-static {p1, v4, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_9
    invoke-static {}, Ll/hkw;->a()Ll/hkw;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    new-instance v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$b;

    .line 177
    .line 178
    invoke-direct {v1, p0, v2, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$b;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1, v3, v1}, Ll/hkw;->d(Ljava/lang/String;Ll/vim;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method private final J(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    const-string v0, "MediaExtraBridge"

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    invoke-static {v0, v1, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-object p0
.end method

.method private final K(Lorg/json/JSONObject;)V
    .locals 8

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, "callback"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v1, v0

    .line 15
    :goto_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    :try_start_0
    const-string v2, "urls"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_1

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_3

    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    :goto_1
    new-instance v2, Lorg/json/JSONArray;

    .line 28
    .line 29
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    move v5, v3

    .line 40
    :goto_2
    if-ge v5, v4, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-static {v6}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    if-eqz v7, :cond_2

    .line 51
    .line 52
    invoke-static {v6}, Ll/fkw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-static {v6}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    if-eqz v7, :cond_2

    .line 61
    .line 62
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 63
    .line 64
    .line 65
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    invoke-virtual {p0, v1, v2, v0, v3}, Ll/qpl;->i(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :goto_3
    const-string v2, "MediaExtraBridge"

    .line 73
    .line 74
    invoke-static {v2, v0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Lorg/json/JSONArray;

    .line 78
    .line 79
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    move-object v0, p1

    .line 89
    :cond_4
    const/4 p1, -0x1

    .line 90
    invoke-virtual {p0, v1, v2, v0, p1}, Ll/qpl;->i(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private final N(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string p0, "png"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, p1, v0}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_1

    .line 9
    .line 10
    const-string p0, "jpg"

    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    const-string p0, "jpeg"

    .line 19
    .line 20
    invoke-static {p0, p1, v0}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    const-string p0, "bmp"

    .line 27
    .line 28
    invoke-static {p0, p1, v0}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    return v0
.end method

.method private final O(Lorg/json/JSONObject;Ll/jjw;)V
    .locals 6

    .line 1
    sget-object v0, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->G()Lkotlin/coroutines/CoroutineContext;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v3, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v3, p0, p1, p2, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ll/jjw;Lkotlin/coroutines/Continuation;)V

    .line 11
    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final P(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "image/*"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const-string v1, "android.intent.action.GET_CONTENT"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    const-string v1, "android.intent.category.OPENABLE"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    instance-of v2, v1, Landroid/app/Activity;

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :cond_0
    check-cast v1, Landroid/app/Activity;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->g:I

    .line 35
    .line 36
    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->h:Lorg/json/JSONObject;

    .line 40
    .line 41
    return-void
.end method

.method private final Q(Lorg/json/JSONObject;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    xor-int/lit8 p0, p3, 0x1

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p1, "MediaExtraBridge"

    .line 13
    .line 14
    const-string p2, ""

    .line 15
    .line 16
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private final S(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .locals 3

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const-string v0, "MediaExtraBridge"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    .line 7
    .line 8
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    .line 10
    .line 11
    :try_start_1
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 12
    .line 13
    const/16 v1, 0x46

    .line 14
    .line 15
    invoke-virtual {p2, p1, v1, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    .line 18
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p1

    .line 23
    invoke-static {v0, p0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    move-object v1, v2

    .line 30
    goto :goto_3

    .line 31
    :catch_1
    move-exception p1

    .line 32
    move-object v1, v2

    .line 33
    goto :goto_1

    .line 34
    :catchall_1
    move-exception p1

    .line 35
    goto :goto_3

    .line 36
    :catch_2
    move-exception p1

    .line 37
    :goto_1
    :try_start_3
    invoke-static {v0, p0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 38
    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 43
    .line 44
    .line 45
    goto :goto_2

    .line 46
    :catch_3
    move-exception p1

    .line 47
    invoke-static {v0, p0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    :goto_2
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :goto_3
    if-eqz v1, :cond_1

    .line 53
    .line 54
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :catch_4
    move-exception p2

    .line 59
    invoke-static {v0, p0, p2}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_4
    throw p1
.end method

.method private final T(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    invoke-static {p0, v0}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private final U(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v1, "type"

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    :goto_0
    if-nez v1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    iget-object v1, p0, Ll/qpl;->a:Ll/hul;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-interface {v1}, Ll/hul;->getWebViewParent()Landroid/view/ViewParent;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    check-cast v1, Landroid/view/View;

    .line 50
    .line 51
    invoke-direct {p0, v1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->D(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    const-string p0, "null cannot be cast to non-null type android.view.View"

    .line 57
    .line 58
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    :goto_1
    iget-object v1, p0, Ll/qpl;->a:Ll/hul;

    .line 63
    .line 64
    invoke-interface {v1}, Ll/hul;->getView()Landroid/webkit/WebView;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    invoke-direct {p0, v1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->H(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    :goto_2
    new-instance v2, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;

    .line 76
    .line 77
    invoke-direct {v2, p0, p1, v1, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Landroid/graphics/Bitmap;Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x2

    .line 81
    invoke-static {p0, v2}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    return-void
.end method

.method private final V(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, "track"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v1, v0

    .line 15
    :goto_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const-string v2, "seek_to"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-static {v1}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_5

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    :try_start_0
    invoke-static {v1}, Ll/wkw;->k(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    invoke-static {v1}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    move-object v0, p1

    .line 48
    :cond_3
    move-object v1, v0

    .line 49
    :cond_4
    :try_start_1
    new-instance p1, Landroid/content/Intent;

    .line 50
    .line 51
    const-string v0, "android.intent.action.VIEW"

    .line 52
    .line 53
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    const-string v0, "video/mp4"

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :catch_0
    :try_start_2
    const-string p0, "\u4f60\u7684\u624b\u673a\u672a\u5b89\u88c5\u64ad\u653e\u5668"

    .line 77
    .line 78
    invoke-static {p0}, Ll/t1j0;->m(Ljava/lang/CharSequence;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 79
    .line 80
    .line 81
    :catch_1
    :cond_5
    :goto_1
    return-void
.end method

.method private final W(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0, v0}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final X(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0, v0}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final Y(Lorg/json/JSONObject;)V
    .locals 6

    .line 1
    sget-object v0, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->G()Lkotlin/coroutines/CoroutineContext;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v3, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v3, p0, p1, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    .line 11
    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static final synthetic q(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->F(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic s(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic t(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic u(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic v(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->I(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic w(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->J(Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qpl;->a:Ll/hul;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic z(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->N(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public L()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public final M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "status"

    .line 2
    .line 3
    const-string v1, "message"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object p2, v1

    .line 15
    :goto_0
    if-eqz p3, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    move-object p3, v1

    .line 19
    :goto_1
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {v0, p2}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public R(Lorg/json/JSONObject;)V
    .locals 1
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0, v0}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(IILandroid/content/Intent;)Z
    .locals 7
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_2

    .line 3
    .line 4
    iget v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->g:I

    .line 5
    .line 6
    if-ne p1, v1, :cond_2

    .line 7
    .line 8
    if-eqz p3, :cond_2

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    :try_start_0
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 17
    .line 18
    sget-object v2, Lc;->INSTANCE:Lc;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v2, v3, v1}, Lc;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const-string v2, "MediaExtraBridge"

    .line 31
    .line 32
    invoke-static {v2, v1}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->h:Lorg/json/JSONObject;

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    new-instance v4, Ll/jjw;

    .line 44
    .line 45
    const/4 v5, 0x1

    .line 46
    invoke-direct {v4, v3, v5, v3}, Ll/jjw;-><init>(Ll/ijw;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Ll/jjw;->a()Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v5, "mediaPaths"

    .line 54
    .line 55
    new-instance v6, Lorg/json/JSONArray;

    .line 56
    .line 57
    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v3, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, v2, v4}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->O(Lorg/json/JSONObject;Ll/jjw;)V

    .line 68
    .line 69
    .line 70
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 71
    .line 72
    :cond_1
    invoke-static {v3}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    goto :goto_2

    .line 77
    :goto_1
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 78
    .line 79
    invoke-static {v1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    :goto_2
    invoke-static {v1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->h:Lorg/json/JSONObject;

    .line 94
    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    const-string v2, "callback"

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v2, Lorg/json/JSONObject;

    .line 104
    .line 105
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v3, "status"

    .line 109
    .line 110
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    const-string v0, "message"

    .line 114
    .line 115
    const-string v3, "please check local file permission"

    .line 116
    .line 117
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    new-instance v0, Lorg/json/JSONArray;

    .line 121
    .line 122
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v3, "images"

    .line 126
    .line 127
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v1, v0}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    invoke-super {p0, p1, p2, p3}, Ll/qpl;->f(IILandroid/content/Intent;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    return p0
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p1, p2}, Ll/alw;->b(Ljava/lang/String;Ljava/lang/String;)Ll/jxl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    sparse-switch v0, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_0
    const-string p1, "uploadFiles"

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_4

    .line 36
    .line 37
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->X(Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    return v3

    .line 41
    :sswitch_1
    const-string p1, "saveBase64File"

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    invoke-virtual {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->R(Lorg/json/JSONObject;)V

    .line 50
    .line 51
    .line 52
    return v3

    .line 53
    :sswitch_2
    const-string v0, "customRecord"

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_4

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    sget-object v4, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 64
    .line 65
    sget-object p2, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/hellogroup/common/thread/MMDispatchers;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    new-instance v7, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$1;

    .line 72
    .line 73
    invoke-direct {v7, p0, p1, p3, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ll/jxl;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    .line 74
    .line 75
    .line 76
    const/4 v8, 0x2

    .line 77
    const/4 v9, 0x0

    .line 78
    const/4 v6, 0x0

    .line 79
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 80
    .line 81
    .line 82
    :cond_1
    return v3

    .line 83
    :sswitch_3
    const-string p1, "uploadFile"

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->W(Lorg/json/JSONObject;)V

    .line 92
    .line 93
    .line 94
    return v3

    .line 95
    :sswitch_4
    const-string p1, "screenShot"

    .line 96
    .line 97
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    iget-object p1, p0, Ll/qpl;->a:Ll/hul;

    .line 104
    .line 105
    if-nez p1, :cond_2

    .line 106
    .line 107
    return v3

    .line 108
    :cond_2
    new-instance p2, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$d;

    .line 109
    .line 110
    invoke-direct {p2, p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$d;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {p1, p2}, Ll/hul;->setWebViewPost(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    return v3

    .line 117
    :sswitch_5
    const-string v0, "readImages"

    .line 118
    .line 119
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-eqz p2, :cond_4

    .line 124
    .line 125
    if-eqz p1, :cond_3

    .line 126
    .line 127
    sget-object v4, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 128
    .line 129
    sget-object p2, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 130
    .line 131
    invoke-virtual {p2}, Lcom/hellogroup/common/thread/MMDispatchers;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    new-instance v7, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$2;

    .line 136
    .line 137
    invoke-direct {v7, p0, p1, p3, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$2;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ll/jxl;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    .line 138
    .line 139
    .line 140
    const/4 v8, 0x2

    .line 141
    const/4 v9, 0x0

    .line 142
    const/4 v6, 0x0

    .line 143
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 144
    .line 145
    .line 146
    return v3

    .line 147
    :cond_3
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->P(Lorg/json/JSONObject;)V

    .line 148
    .line 149
    .line 150
    return v3

    .line 151
    :sswitch_6
    const-string p1, "getImageData"

    .line 152
    .line 153
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_4

    .line 158
    .line 159
    new-instance p1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$c;

    .line 160
    .line 161
    invoke-direct {p1, p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$c;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V

    .line 162
    .line 163
    .line 164
    invoke-static {p1}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 165
    .line 166
    .line 167
    return v3

    .line 168
    :sswitch_7
    const-string p1, "getMKFileUrl"

    .line 169
    .line 170
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eqz p1, :cond_4

    .line 175
    .line 176
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->K(Lorg/json/JSONObject;)V

    .line 177
    .line 178
    .line 179
    return v3

    .line 180
    :sswitch_8
    const-string p1, "startVideo"

    .line 181
    .line 182
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_4

    .line 187
    .line 188
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->V(Lorg/json/JSONObject;)V

    .line 189
    .line 190
    .line 191
    return v3

    .line 192
    :sswitch_9
    const-string p1, "uploadImages"

    .line 193
    .line 194
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_4

    .line 199
    .line 200
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->Y(Lorg/json/JSONObject;)V

    .line 201
    .line 202
    .line 203
    return v3

    .line 204
    :sswitch_a
    const-string v0, "shotVideo"

    .line 205
    .line 206
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    if-eqz p2, :cond_4

    .line 211
    .line 212
    if-eqz p1, :cond_4

    .line 213
    .line 214
    sget-object v4, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 215
    .line 216
    sget-object p2, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 217
    .line 218
    invoke-virtual {p2}, Lcom/hellogroup/common/thread/MMDispatchers;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    new-instance v7, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;

    .line 223
    .line 224
    invoke-direct {v7, p0, p1, p3, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ll/jxl;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    .line 225
    .line 226
    .line 227
    const/4 v8, 0x2

    .line 228
    const/4 v9, 0x0

    .line 229
    const/4 v6, 0x0

    .line 230
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 231
    .line 232
    .line 233
    return v3

    .line 234
    :sswitch_b
    const-string p1, "saveImagesToAlbum"

    .line 235
    .line 236
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_4

    .line 241
    .line 242
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->T(Lorg/json/JSONObject;)V

    .line 243
    .line 244
    .line 245
    nop

    .line 246
    :cond_4
    :goto_0
    return v1

    .line 247
    :sswitch_data_0
    .sparse-switch
        -0x7fb14b61 -> :sswitch_b
        -0x7714ea5f -> :sswitch_a
        -0x7618c827 -> :sswitch_9
        -0x5e4832c7 -> :sswitch_8
        -0x4034f7c1 -> :sswitch_7
        -0x34f1a711 -> :sswitch_6
        -0x2f4b4052 -> :sswitch_5
        -0x18e1067a -> :sswitch_4
        -0xe8370e3 -> :sswitch_3
        0x148dcb22 -> :sswitch_2
        0x31616cc8 -> :sswitch_1
        0x3e1554f6 -> :sswitch_0
    .end sparse-switch
.end method
