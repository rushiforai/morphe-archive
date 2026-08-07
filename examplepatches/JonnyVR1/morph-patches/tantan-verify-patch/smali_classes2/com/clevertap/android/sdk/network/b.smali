.class public final Lcom/clevertap/android/sdk/network/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/network/b$a;,
        Lcom/clevertap/android/sdk/network/b$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ce\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0017\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u001f\n\u0002\u0010!\n\u0002\u0008\u0005\u0008\u0000\u0018\u0000 \u0093\u00012\u00020\u0001:\u0001{By\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0006\u0010\u0019\u001a\u00020\u0018\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u001c\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0017\u0010#\u001a\u00020\"2\u0006\u0010!\u001a\u00020 H\u0002\u00a2\u0006\u0004\u0008#\u0010$J\u001b\u0010\'\u001a\u0004\u0018\u00010&2\u0008\u0010%\u001a\u0004\u0018\u00010 H\u0002\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010,\u001a\u00020+2\u0006\u0010*\u001a\u00020)H\u0003\u00a2\u0006\u0004\u0008,\u0010-J\u0017\u0010.\u001a\u00020\"2\u0006\u0010*\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008.\u0010/J\u0019\u00101\u001a\u0004\u0018\u0001002\u0006\u0010*\u001a\u00020)H\u0002\u00a2\u0006\u0004\u00081\u00102J5\u0010:\u001a\u00020\"2\u0006\u00104\u001a\u0002032\u0006\u00106\u001a\u0002052\u000c\u00108\u001a\u0008\u0012\u0004\u0012\u00020+072\u0006\u00109\u001a\u00020\"H\u0002\u00a2\u0006\u0004\u0008:\u0010;J\u001f\u0010>\u001a\u00020+2\u0006\u00106\u001a\u0002052\u0006\u0010=\u001a\u00020<H\u0002\u00a2\u0006\u0004\u0008>\u0010?J!\u0010A\u001a\u00020+2\u0008\u0010@\u001a\u0004\u0018\u00010&2\u0006\u0010=\u001a\u00020<H\u0002\u00a2\u0006\u0004\u0008A\u0010BJ\u001f\u0010D\u001a\u00020)2\u0006\u00104\u001a\u0002032\u0006\u0010C\u001a\u000205H\u0003\u00a2\u0006\u0004\u0008D\u0010EJ\u0017\u0010F\u001a\u00020)2\u0006\u0010C\u001a\u000205H\u0002\u00a2\u0006\u0004\u0008F\u0010GJ\u0017\u0010H\u001a\u00020)2\u0006\u0010C\u001a\u000205H\u0002\u00a2\u0006\u0004\u0008H\u0010GJ\u0017\u0010I\u001a\u00020\"2\u0006\u0010*\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008I\u0010/J\u001f\u0010K\u001a\u00020+2\u0006\u0010*\u001a\u00020)2\u0006\u0010J\u001a\u00020 H\u0002\u00a2\u0006\u0004\u0008K\u0010LJ\u0017\u0010M\u001a\u00020\"2\u0006\u0010*\u001a\u00020)H\u0003\u00a2\u0006\u0004\u0008M\u0010/J5\u0010O\u001a\u00020\"2\u0006\u0010*\u001a\u00020)2\u0006\u0010N\u001a\u00020\"2\u000c\u00108\u001a\u0008\u0012\u0004\u0012\u00020+072\u0006\u00109\u001a\u00020\"H\u0003\u00a2\u0006\u0004\u0008O\u0010PJ\u0017\u0010Q\u001a\u00020+2\u0006\u0010*\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008Q\u0010-J\u0017\u0010R\u001a\u00020\"2\u0006\u0010C\u001a\u000205H\u0002\u00a2\u0006\u0004\u0008R\u0010SJ\u0017\u0010V\u001a\u00020+2\u0006\u0010U\u001a\u00020TH\u0002\u00a2\u0006\u0004\u0008V\u0010WJ\u0017\u0010Y\u001a\u00020+2\u0006\u0010X\u001a\u00020 H\u0002\u00a2\u0006\u0004\u0008Y\u0010ZJ\u0019\u0010\\\u001a\u00020+2\u0008\u0010[\u001a\u0004\u0018\u00010 H\u0003\u00a2\u0006\u0004\u0008\\\u0010ZJ\u0017\u0010_\u001a\u00020+2\u0006\u0010^\u001a\u00020]H\u0002\u00a2\u0006\u0004\u0008_\u0010`J\u0017\u0010b\u001a\u00020+2\u0006\u0010a\u001a\u00020 H\u0003\u00a2\u0006\u0004\u0008b\u0010ZJ#\u0010e\u001a\u00020+2\u0006\u0010c\u001a\u00020\"2\n\u0008\u0002\u0010d\u001a\u0004\u0018\u000100H\u0003\u00a2\u0006\u0004\u0008e\u0010fJ\u0015\u0010i\u001a\u00020+2\u0006\u0010h\u001a\u00020g\u00a2\u0006\u0004\u0008i\u0010jJ/\u0010k\u001a\u00020+2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u00104\u001a\u0002032\u0008\u0010%\u001a\u0004\u0018\u00010 2\u0006\u00109\u001a\u00020\"\u00a2\u0006\u0004\u0008k\u0010lJ\r\u0010m\u001a\u00020]\u00a2\u0006\u0004\u0008m\u0010nJ\u001f\u0010q\u001a\u00020+2\u0006\u00104\u001a\u0002032\u0006\u0010p\u001a\u00020oH\u0007\u00a2\u0006\u0004\u0008q\u0010rJ\u0017\u0010s\u001a\u00020\"2\u0006\u00104\u001a\u000203H\u0007\u00a2\u0006\u0004\u0008s\u0010tJ\u001f\u0010u\u001a\u00020+2\u0006\u00104\u001a\u0002032\u0006\u0010p\u001a\u00020oH\u0007\u00a2\u0006\u0004\u0008u\u0010rJ;\u0010v\u001a\u00020\"2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u00104\u001a\u0002032\u0008\u0010U\u001a\u0004\u0018\u00010T2\u0008\u0010%\u001a\u0004\u0018\u00010 2\u0008\u0008\u0002\u00109\u001a\u00020\"\u00a2\u0006\u0004\u0008v\u0010wJ\u0019\u0010y\u001a\u0004\u0018\u00010&2\u0006\u0010x\u001a\u00020 H\u0007\u00a2\u0006\u0004\u0008y\u0010(J\u0015\u0010z\u001a\u00020\"2\u0006\u0010*\u001a\u00020)\u00a2\u0006\u0004\u0008z\u0010/R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008{\u0010|R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008}\u0010~R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008z\u0010\u007fR\u0015\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008i\u0010\u0080\u0001R\u0015\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008A\u0010\u0081\u0001R\u0015\u0010\r\u001a\u00020\u000c8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008D\u0010\u0082\u0001R\u0015\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008R\u0010\u0083\u0001R\u0015\u0010\u0011\u001a\u00020\u00108\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008y\u0010\u0084\u0001R\u0015\u0010\u0013\u001a\u00020\u00128\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008k\u0010\u0085\u0001R\u0016\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0086\u0001\u0010\u0087\u0001R\u0015\u0010\u0017\u001a\u00020\u00168\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008m\u0010\u0088\u0001R\u0015\u0010\u0019\u001a\u00020\u00188\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008\'\u0010\u0089\u0001R\u0015\u0010\u001b\u001a\u00020\u001a8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008M\u0010\u008a\u0001R\u0015\u0010\u001d\u001a\u00020\u001c8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008O\u0010\u008b\u0001R\u0017\u0010\u008c\u0001\u001a\u00020]8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008Q\u0010bR\u0017\u0010\u008d\u0001\u001a\u00020]8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008I\u0010bR\u0017\u0010\u008e\u0001\u001a\u00020]8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008K\u0010bR\u001d\u0010\u0091\u0001\u001a\t\u0012\u0004\u0012\u00020g0\u008f\u00018\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008#\u0010\u0090\u0001R\u0013\u0010\u0092\u0001\u001a\u00020]8G\u00a2\u0006\u0007\u001a\u0005\u0008\u0086\u0001\u0010n\u00a8\u0006\u0094\u0001"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/b;",
        "",
        "Landroid/content/Context;",
        "context",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "config",
        "Ll/uzd;",
        "deviceInfo",
        "Ll/bu9;",
        "coreMetaData",
        "Ll/w36;",
        "controllerManager",
        "Ll/bj2;",
        "databaseManager",
        "Ll/ch2;",
        "callbackManager",
        "Ll/byb;",
        "ctApiWrapper",
        "Ll/sj20;",
        "encryptionManager",
        "Ll/t1;",
        "arpResponse",
        "Ll/tk20;",
        "networkRepo",
        "Ll/hxb0;",
        "queueHeaderBuilder",
        "Ll/q95;",
        "cleverTapResponseHandler",
        "Ll/axl;",
        "logger",
        "<init>",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/bu9;Ll/w36;Ll/bj2;Ll/ch2;Ll/byb;Ll/sj20;Ll/t1;Ll/tk20;Ll/hxb0;Ll/q95;Ll/axl;)V",
        "",
        "newDomain",
        "",
        "r",
        "(Ljava/lang/String;)Z",
        "caller",
        "Lorg/json/JSONObject;",
        "l",
        "(Ljava/lang/String;)Lorg/json/JSONObject;",
        "Ll/j5d0;",
        "response",
        "",
        "A",
        "(Ll/j5d0;)V",
        "J",
        "(Ll/j5d0;)Z",
        "",
        "y",
        "(Ll/j5d0;)Ljava/lang/Long;",
        "Lcom/clevertap/android/sdk/events/EventGroup;",
        "eventGroup",
        "Ll/cpe0;",
        "requestBody",
        "Lkotlin/Function0;",
        "notifyNetworkHeaderListeners",
        "isUserSwitchFlush",
        "u",
        "(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;Lkotlin/jvm/functions/Function0;Z)Z",
        "Lcom/clevertap/android/sdk/network/EndpointId;",
        "endpointId",
        "v",
        "(Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)V",
        "queueHeader",
        "e",
        "(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/network/EndpointId;)V",
        "body",
        "f",
        "(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;)Ll/j5d0;",
        "D",
        "(Ll/cpe0;)Ll/j5d0;",
        "B",
        "p",
        "logTag",
        "q",
        "(Ll/j5d0;Ljava/lang/String;)V",
        "m",
        "isFullResponse",
        "n",
        "(Ll/j5d0;ZLkotlin/jvm/functions/Function0;Z)Z",
        "o",
        "g",
        "(Ll/cpe0;)Z",
        "Lorg/json/JSONArray;",
        "queue",
        "x",
        "(Lorg/json/JSONArray;)V",
        "listenerKey",
        "w",
        "(Ljava/lang/String;)V",
        "domainName",
        "E",
        "",
        "ts",
        "F",
        "(I)V",
        "spikyDomainName",
        "I",
        "mute",
        "muteExpiryMs",
        "G",
        "(ZLjava/lang/Long;)V",
        "Ll/wj20;",
        "listener",
        "d",
        "(Ll/wj20;)V",
        "i",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V",
        "k",
        "()I",
        "Ljava/lang/Runnable;",
        "handshakeSuccessCallback",
        "s",
        "(Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/Runnable;)V",
        "t",
        "(Lcom/clevertap/android/sdk/events/EventGroup;)Z",
        "z",
        "C",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Lorg/json/JSONArray;Ljava/lang/String;Z)Z",
        "url",
        "h",
        "c",
        "a",
        "Landroid/content/Context;",
        "b",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "Ll/uzd;",
        "Ll/bu9;",
        "Ll/w36;",
        "Ll/bj2;",
        "Ll/ch2;",
        "Ll/byb;",
        "Ll/sj20;",
        "j",
        "Ll/t1;",
        "Ll/tk20;",
        "Ll/hxb0;",
        "Ll/q95;",
        "Ll/axl;",
        "responseFailureCount",
        "networkRetryCount",
        "minDelayFrequency",
        "",
        "Ljava/util/List;",
        "mNetworkHeadersListeners",
        "currentRequestTimestamp",
        "Companion",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/clevertap/android/sdk/network/b$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/uzd;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ll/bu9;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ll/w36;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ll/bj2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Ll/ch2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final h:Ll/byb;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final i:Ll/sj20;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final j:Ll/t1;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final k:Ll/tk20;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final l:Ll/hxb0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final m:Ll/q95;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final n:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private o:I

.field private p:I

.field private q:I

.field private final r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wj20;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/network/b$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/network/b$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/network/b;->Companion:Lcom/clevertap/android/sdk/network/b$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/bu9;Ll/w36;Ll/bj2;Ll/ch2;Ll/byb;Ll/sj20;Ll/t1;Ll/tk20;Ll/hxb0;Ll/q95;Ll/axl;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/uzd;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/bu9;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/w36;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ll/bj2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Ll/ch2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Ll/byb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Ll/sj20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p10    # Ll/t1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p11    # Ll/tk20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p12    # Ll/hxb0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p13    # Ll/q95;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p14    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/b;->a:Landroid/content/Context;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 49
    .line 50
    iput-object p3, p0, Lcom/clevertap/android/sdk/network/b;->c:Ll/uzd;

    .line 51
    .line 52
    iput-object p4, p0, Lcom/clevertap/android/sdk/network/b;->d:Ll/bu9;

    .line 53
    .line 54
    iput-object p5, p0, Lcom/clevertap/android/sdk/network/b;->e:Ll/w36;

    .line 55
    .line 56
    iput-object p6, p0, Lcom/clevertap/android/sdk/network/b;->f:Ll/bj2;

    .line 57
    .line 58
    iput-object p7, p0, Lcom/clevertap/android/sdk/network/b;->g:Ll/ch2;

    .line 59
    .line 60
    iput-object p8, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 61
    .line 62
    iput-object p9, p0, Lcom/clevertap/android/sdk/network/b;->i:Ll/sj20;

    .line 63
    .line 64
    iput-object p10, p0, Lcom/clevertap/android/sdk/network/b;->j:Ll/t1;

    .line 65
    .line 66
    iput-object p11, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 67
    .line 68
    iput-object p12, p0, Lcom/clevertap/android/sdk/network/b;->l:Ll/hxb0;

    .line 69
    .line 70
    iput-object p13, p0, Lcom/clevertap/android/sdk/network/b;->m:Ll/q95;

    .line 71
    .line 72
    iput-object p14, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 73
    .line 74
    new-instance p1, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/b;->r:Ljava/util/List;

    .line 80
    .line 81
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/bu9;Ll/w36;Ll/bj2;Ll/ch2;Ll/byb;Ll/sj20;Ll/t1;Ll/tk20;Ll/hxb0;Ll/q95;Ll/axl;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 16

    move/from16 v0, p15

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    move-result-object v0

    move-object v15, v0

    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    goto :goto_1

    :cond_0
    move-object/from16 v15, p14

    goto :goto_0

    .line 83
    :goto_1
    invoke-direct/range {v1 .. v15}, Lcom/clevertap/android/sdk/network/b;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/bu9;Ll/w36;Ll/bj2;Ll/ch2;Ll/byb;Ll/sj20;Ll/t1;Ll/tk20;Ll/hxb0;Ll/q95;Ll/axl;)V

    return-void
.end method

.method private final A(Ll/j5d0;)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    const-string v0, "X-WZRK-RD"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "Getting domain from header - "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v1, "X-WZRK-SPIKY-RD"

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "Getting spiky domain from header - "

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    const/4 v2, 0x2

    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-static {p0, v1, v3, v2, v3}, Lcom/clevertap/android/sdk/network/b;->H(Lcom/clevertap/android/sdk/network/b;ZLjava/lang/Long;ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/b;->E(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v2, "Setting spiky domain from header as -"

    .line 68
    .line 69
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    if-nez p1, :cond_1

    .line 83
    .line 84
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/b;->I(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->I(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    return-void
.end method

.method private final B(Ll/cpe0;)Ll/j5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Ll/cpe0;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/yxb;->n(Ljava/lang/String;)Ll/j5d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private final D(Ll/cpe0;)Ll/j5d0;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isEncryptionInTransitEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->d:Ll/bu9;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/bu9;->I()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->i:Ll/sj20;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/cpe0;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/sj20;->c(Ljava/lang/String;)Ll/m1f;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->i:Ll/sj20;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/sj20;->d()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    instance-of v2, v0, Ll/n1f;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    new-instance p1, Ll/j1f;

    .line 38
    .line 39
    check-cast v0, Ll/n1f;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/n1f;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/n1f;->b()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p1, v2, v1, v0}, Ll/j1f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Ll/j1f;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v3, "Encrypted Request = "

    .line 70
    .line 71
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const/4 v0, 0x1

    .line 91
    invoke-virtual {p0, p1, v0}, Ll/yxb;->q(Ljava/lang/String;Z)Ll/j5d0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v3, "Normal Request cause encryption failed = "

    .line 107
    .line 108
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1}, Ll/cpe0;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const/4 v0, 0x2

    .line 132
    const/4 v1, 0x0

    .line 133
    const/4 v2, 0x0

    .line 134
    invoke-static {p0, p1, v2, v0, v1}, Ll/yxb;->r(Ll/yxb;Ljava/lang/String;ZILjava/lang/Object;)Ll/j5d0;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0
.end method

.method private final E(Ljava/lang/String;)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "Setting domain to "

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/tk20;->l(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/byb;->b()Ll/yxb;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p1}, Ll/yxb;->s(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->g:Ll/ch2;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ch2;->r()Ll/rsd0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private final F(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tk20;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/tk20;->m(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final G(ZLjava/lang/Long;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-virtual {p1, v0, v1}, Ll/tk20;->o(J)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p2, 0x1

    .line 16
    invoke-virtual {p1, p2}, Ll/tk20;->p(Z)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-virtual {p1, p2}, Ll/tk20;->l(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 26
    .line 27
    invoke-static {p1}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/lk20;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Ll/lk20;-><init>(Lcom/clevertap/android/sdk/network/b;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "CommsManager#setMuted"

    .line 41
    .line 42
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    invoke-virtual {p0, p1}, Ll/tk20;->p(Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic H(Lcom/clevertap/android/sdk/network/b;ZLjava/lang/Long;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/network/b;->G(ZLjava/lang/Long;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final I(Ljava/lang/String;)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "Setting spiky domain to "

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/tk20;->q(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1}, Ll/yxb;->t(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private final J(Ll/j5d0;)Z
    .locals 4

    .line 1
    const-string v0, "X-WZRK-MUTE"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-lez v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v0, v3

    .line 29
    :goto_0
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v2, "true"

    .line 32
    .line 33
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->y(Ll/j5d0;)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-direct {p0, v0, p1}, Lcom/clevertap/android/sdk/network/b;->G(ZLjava/lang/Long;)V

    .line 45
    .line 46
    .line 47
    return v0

    .line 48
    :cond_1
    const/4 p1, 0x2

    .line 49
    invoke-static {p0, v1, v3, p1, v3}, Lcom/clevertap/android/sdk/network/b;->H(Lcom/clevertap/android/sdk/network/b;ZLjava/lang/Long;ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return v1
.end method

.method public static a(Lcom/clevertap/android/sdk/network/b;Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/network/b;->v(Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static b(Lcom/clevertap/android/sdk/network/b;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->f:Ll/bj2;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ll/bj2;->b(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method private final e(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/network/EndpointId;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->r:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/wj20;

    .line 20
    .line 21
    invoke-interface {v0, p2}, Ll/wj20;->a(Lcom/clevertap/android/sdk/network/EndpointId;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/kx3;->g(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method private final f(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;)Ll/j5d0;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/network/b$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/network/b;->B(Ll/cpe0;)Ll/j5d0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/network/b;->D(Ll/cpe0;)Ll/j5d0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p2}, Ll/yxb;->e(Ll/cpe0;)Ll/j5d0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method private final g(Ll/cpe0;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/cpe0;->a()Lorg/json/JSONArray;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    :goto_0
    if-ge v1, p0, :cond_2

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p1}, Ll/cpe0;->a()Lorg/json/JSONArray;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "type"

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "event"

    .line 28
    .line 29
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    const-string v3, "evtName"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "App Launched"

    .line 42
    .line 43
    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_0

    .line 48
    .line 49
    const-string v3, "wzrk_fetch"

    .line 50
    .line 51
    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    :cond_0
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :catch_0
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    return v0
.end method

.method private final l(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->l:Ll/hxb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hxb0;->s(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final m(Ll/j5d0;)Z
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/j5d0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "Received error response code: "

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {v0, p0, p1}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_0
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/network/b;->c(Ll/j5d0;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->J(Ll/j5d0;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->A(Ll/j5d0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v2, "Push Impressions sent successfully"

    .line 63
    .line 64
    invoke-interface {v0, v1, v2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/b;->j()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Ll/tk20;->n(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/b;->j()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/b;->F(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v2, "Processing response : "

    .line 94
    .line 95
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p1}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-interface {v0, p0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x1

    .line 117
    return p0

    .line 118
    :cond_2
    :goto_0
    return v1
.end method

.method private final n(Ll/j5d0;ZLkotlin/jvm/functions/Function0;Z)Z
    .locals 6
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/j5d0;",
            "Z",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/j5d0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->o(Ll/j5d0;)V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/network/b;->c(Ll/j5d0;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_8

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->J(Ll/j5d0;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->d:Ll/bu9;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/bu9;->Y()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->A(Ll/j5d0;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v2, "Queue sent successfully"

    .line 46
    .line 47
    invoke-interface {p3, v0, v2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/b;->j()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p3, v0}, Ll/tk20;->n(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/b;->j()I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    invoke-direct {p0, p3}, Lcom/clevertap/android/sdk/network/b;->F(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-static {p3}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v5, "Processing response : "

    .line 85
    .line 86
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-interface {v2, v3, v4}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 v2, 0x1

    .line 100
    if-eqz p3, :cond_7

    .line 101
    .line 102
    invoke-static {p3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_2

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    if-nez v0, :cond_3

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    const-string v3, "X-CleverTap-Encryption-Enabled"

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->i:Ll/sj20;

    .line 125
    .line 126
    invoke-virtual {p1, p3}, Ll/sj20;->b(Ljava/lang/String;)Ll/m1f;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    instance-of p3, p1, Ll/k1f;

    .line 131
    .line 132
    if-eqz p3, :cond_4

    .line 133
    .line 134
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string p2, "Failed to decrypt response"

    .line 143
    .line 144
    invoke-interface {p1, p0, p2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return v1

    .line 148
    :cond_4
    instance-of p3, p1, Ll/n1f;

    .line 149
    .line 150
    if-eqz p3, :cond_5

    .line 151
    .line 152
    check-cast p1, Ll/n1f;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/n1f;->a()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    invoke-static {p3}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 163
    .line 164
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 165
    .line 166
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    new-instance v3, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v4, "Decrypted response = "

    .line 173
    .line 174
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-interface {p1, v1, v3}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_5
    invoke-static {}, Ll/nbr;->a()V

    .line 189
    .line 190
    .line 191
    return v1

    .line 192
    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->m:Ll/q95;

    .line 193
    .line 194
    invoke-virtual {p0, p2, v0, p3, p4}, Ll/q95;->a(ZLorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 195
    .line 196
    .line 197
    :cond_7
    :goto_1
    return v2

    .line 198
    :cond_8
    :goto_2
    return v1
.end method

.method private final o(Ll/j5d0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "Received error response code: "

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v0, v1, v2}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/16 v0, 0x192

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    if-eq p1, v0, :cond_1

    .line 38
    .line 39
    const/16 v0, 0x1a3

    .line 40
    .line 41
    if-eq p1, v0, :cond_0

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v2, "There is decryption failure on backend, disabling encrypted requests."

    .line 53
    .line 54
    invoke-interface {p1, v0, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->d:Ll/bu9;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ll/bu9;->i0(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v2, "Encryption in transit feature on not enabled for your account, please contact Clevertap support."

    .line 72
    .line 73
    invoke-interface {p1, v0, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->d:Ll/bu9;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/bu9;->i0(Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private final p(Ll/j5d0;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/j5d0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v4, "Processing variables response : "

    .line 26
    .line 27
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v1, v2, v3}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->j:Ll/t1;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->a:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {v1, v0, p1, p0}, Ll/t1;->a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const-string v0, "Variables"

    .line 50
    .line 51
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/network/b;->q(Ll/j5d0;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method private final q(Ll/j5d0;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x190

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 10
    .line 11
    const/16 v1, 0x191

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "Response code "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, " while syncing."

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p0, p2, p1}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const-string p1, "Unauthorized access from a non-test profile. Please mark this profile as a test profile from the CleverTap dashboard."

    .line 43
    .line 44
    invoke-interface {p0, p2, p1}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    const-string v0, "error"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 75
    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v1, "Error while syncing: "

    .line 79
    .line 80
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-interface {p0, p2, p1}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 95
    .line 96
    const-string p1, "Error while syncing."

    .line 97
    .line 98
    invoke-interface {p0, p2, p1}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private final r(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tk20;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method private final u(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;Lkotlin/jvm/functions/Function0;Z)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/events/EventGroup;",
            "Ll/cpe0;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/network/b;->f(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;)Ll/j5d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    iput v1, p0, Lcom/clevertap/android/sdk/network/b;->p:I

    .line 7
    .line 8
    sget-object v2, Lcom/clevertap/android/sdk/network/b$b;->a:[I

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    aget p1, v2, p1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eq p1, v2, :cond_4

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    if-eq p1, v3, :cond_2

    .line 21
    .line 22
    const/4 p2, 0x3

    .line 23
    if-ne p1, p2, :cond_1

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/b;->m(Ll/j5d0;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget p2, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 33
    .line 34
    add-int/lit8 v1, p2, 0x1

    .line 35
    .line 36
    :goto_0
    iput v1, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_3

    .line 41
    :cond_1
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    .line 42
    .line 43
    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_2
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/network/b;->g(Ll/cpe0;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-direct {p0, v0, p1, p3, p4}, Lcom/clevertap/android/sdk/network/b;->n(Ll/j5d0;ZLkotlin/jvm/functions/Function0;Z)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget p2, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 59
    .line 60
    add-int/lit8 v1, p2, 0x1

    .line 61
    .line 62
    :goto_1
    iput v1, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/b;->p(Ll/j5d0;)Z

    .line 66
    .line 67
    .line 68
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :goto_2
    const/4 p0, 0x0

    .line 70
    invoke-static {v0, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    return p1

    .line 74
    :goto_3
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    :catchall_1
    move-exception p1

    .line 76
    invoke-static {v0, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    throw p1
.end method

.method private final v(Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/cpe0;->b()Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->r:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/wj20;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/cpe0;->b()Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1, p2}, Ll/wj20;->b(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/network/EndpointId;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method private final w(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/clevertap/android/sdk/CleverTapAPI;->Q(Ljava/lang/String;)Lcom/clevertap/android/sdk/interfaces/NotificationRenderedListener;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v3, "notifying listener "

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, ", that push impression sent successfully"

    .line 26
    .line 27
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {v1, p0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    invoke-interface {v0, p0}, Lcom/clevertap/android/sdk/interfaces/NotificationRenderedListener;->onNotificationRendered(Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method private final x(Lorg/json/JSONArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-string v3, "evtData"

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-string v3, "wzrk_pid"

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "wzrk_acct_id"

    .line 27
    .line 28
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2, v3}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationUtil;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v2}, Lcom/clevertap/android/sdk/network/b;->w(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_3

    .line 43
    :catch_0
    move-exception v2

    .line 44
    goto :goto_1

    .line 45
    :catch_1
    move-exception v2

    .line 46
    goto :goto_2

    .line 47
    :goto_1
    iget-object v3, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 48
    .line 49
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    const-string v5, "Exception occurred while notifying push impression listeners"

    .line 56
    .line 57
    invoke-interface {v3, v4, v5, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    goto :goto_3

    .line 61
    :goto_2
    iget-object v3, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 62
    .line 63
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 64
    .line 65
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const-string v5, "Encountered an exception while parsing the push notification viewed event queue"

    .line 70
    .line 71
    invoke-interface {v3, v4, v5, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v0, "push notification viewed event sent successfully"

    .line 86
    .line 87
    invoke-interface {p1, p0, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private final y(Ll/j5d0;)Ljava/lang/Long;
    .locals 4

    .line 1
    const-string v0, "X-WZRK-MUTE-DURATION"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-static {p1}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-lez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object p1, v0

    .line 28
    :goto_0
    if-eqz p1, :cond_1

    .line 29
    .line 30
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return-object p0

    .line 39
    :catch_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v3, "Invalid X-WZRK-MUTE-DURATION value: "

    .line 50
    .line 51
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p1, ", falling back to default mute"

    .line 58
    .line 59
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {v1, p0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final C(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Lorg/json/JSONArray;Ljava/lang/String;Z)Z
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONArray;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p3, :cond_2

    .line 9
    .line 10
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-gtz v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->c:Ll/uzd;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/uzd;->E()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p2, "CleverTap Id not finalized, unable to send queue"

    .line 35
    .line 36
    invoke-interface {p1, p0, p2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :cond_1
    sget-object v1, Lcom/clevertap/android/sdk/network/EndpointId;->Companion:Lcom/clevertap/android/sdk/network/EndpointId$a;

    .line 41
    .line 42
    invoke-virtual {v1, p2}, Lcom/clevertap/android/sdk/network/EndpointId$a;->a(Lcom/clevertap/android/sdk/events/EventGroup;)Lcom/clevertap/android/sdk/network/EndpointId;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {p0, p4}, Lcom/clevertap/android/sdk/network/b;->l(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-direct {p0, p4, v1}, Lcom/clevertap/android/sdk/network/b;->e(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/network/EndpointId;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ll/cpe0;

    .line 54
    .line 55
    invoke-direct {v2, p4, p3}, Ll/cpe0;-><init>(Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    .line 56
    .line 57
    .line 58
    iget-object p4, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 61
    .line 62
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    new-instance v4, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v5, "Send queue contains "

    .line 69
    .line 70
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p3, " items: "

    .line 81
    .line 82
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    invoke-interface {p4, v3, p3}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :try_start_0
    new-instance p3, Ll/kk20;

    .line 96
    .line 97
    invoke-direct {p3, p0, v2, v1}, Ll/kk20;-><init>(Lcom/clevertap/android/sdk/network/b;Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, p2, v2, p3, p5}, Lcom/clevertap/android/sdk/network/b;->u(Lcom/clevertap/android/sdk/events/EventGroup;Ll/cpe0;Lkotlin/jvm/functions/Function0;Z)Z

    .line 101
    .line 102
    .line 103
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    return p0

    .line 105
    :catch_0
    move-exception p2

    .line 106
    iget p3, p0, Lcom/clevertap/android/sdk/network/b;->p:I

    .line 107
    .line 108
    add-int/lit8 p3, p3, 0x1

    .line 109
    .line 110
    iput p3, p0, Lcom/clevertap/android/sdk/network/b;->p:I

    .line 111
    .line 112
    iget p3, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 113
    .line 114
    add-int/lit8 p3, p3, 0x1

    .line 115
    .line 116
    iput p3, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 117
    .line 118
    iget-object p3, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 119
    .line 120
    iget-object p4, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 121
    .line 122
    invoke-virtual {p4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p4

    .line 126
    const-string p5, "An exception occurred while sending the queue, will retry: "

    .line 127
    .line 128
    invoke-interface {p3, p4, p5, p2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/clevertap/android/sdk/network/b;->g:Ll/ch2;

    .line 132
    .line 133
    invoke-virtual {p2}, Ll/ch2;->g()Ll/pxf;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    if-eqz p2, :cond_2

    .line 138
    .line 139
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->g:Ll/ch2;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/ch2;->g()Ll/pxf;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0, p1}, Ll/pxf;->a(Landroid/content/Context;)V

    .line 146
    .line 147
    .line 148
    :cond_2
    :goto_0
    return v0
.end method

.method public final c(Ll/j5d0;)Z
    .locals 3
    .param p1    # Ll/j5d0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "X-WZRK-RD"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/j5d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/kx3;->p(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->r(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->E(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "The domain has changed to "

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, ". The request will be retried shortly."

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {v0, p0, p1}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_0
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method public final d(Ll/wj20;)V
    .locals 0
    .param p1    # Ll/wj20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->r:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const-string v0, "Failed to fetch inapp payload. Response code: "

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/byb;->b()Ll/yxb;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2, p1}, Ll/yxb;->f(Ljava/lang/String;)Ll/j5d0;

    .line 14
    .line 15
    .line 16
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    :try_start_1
    invoke-virtual {p1}, Ll/j5d0;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/kx3;->x(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    :try_start_2
    invoke-static {p1, v1}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :catch_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    :try_start_3
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v2, v3, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    .line 65
    .line 66
    :try_start_4
    invoke-static {p1, v1}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 67
    .line 68
    .line 69
    return-object v1

    .line 70
    :goto_0
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 71
    :catchall_1
    move-exception v2

    .line 72
    :try_start_6
    invoke-static {p1, v0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 76
    :goto_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v2, "An exception occurred while fetching the inapp payload from URL"

    .line 85
    .line 86
    invoke-interface {v0, p0, v2, p1}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    return-object v1
.end method

.method public final i(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V
    .locals 11
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Starting queue flush to CleverTap servers"

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    const/4 v1, 0x0

    .line 26
    move v2, v0

    .line 27
    move v3, v1

    .line 28
    :goto_0
    if-eqz v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->f:Ll/bj2;

    .line 31
    .line 32
    const/16 v4, 0x32

    .line 33
    .line 34
    invoke-interface {v2, p1, v4, p2}, Ll/bj2;->d(Landroid/content/Context;ILcom/clevertap/android/sdk/events/EventGroup;)Ll/gxb0;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ll/gxb0;->e()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string p3, "No more events in queue"

    .line 57
    .line 58
    invoke-virtual {p1, p2, p3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    move-object v4, p0

    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :cond_1
    invoke-virtual {v2}, Ll/gxb0;->a()Lorg/json/JSONArray;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 73
    .line 74
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    iget-object v5, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 79
    .line 80
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    new-instance v6, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v8, "Processing batch of "

    .line 87
    .line 88
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v8, " events ("

    .line 95
    .line 96
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2}, Ll/gxb0;->b()Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v8, " from events, "

    .line 111
    .line 112
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ll/gxb0;->d()Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v8, " from profile)"

    .line 127
    .line 128
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-virtual {v4, v5, v6}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    move-object v4, p0

    .line 139
    move-object v5, p1

    .line 140
    move-object v6, p2

    .line 141
    move-object v8, p3

    .line 142
    move v9, p4

    .line 143
    invoke-virtual/range {v4 .. v9}, Lcom/clevertap/android/sdk/network/b;->C(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Lorg/json/JSONArray;Ljava/lang/String;Z)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-nez p0, :cond_2

    .line 148
    .line 149
    iget-object p0, v4, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    iget-object p1, v4, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string p2, "Failed to send batch - will retry later"

    .line 162
    .line 163
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, v4, Lcom/clevertap/android/sdk/network/b;->e:Ll/w36;

    .line 167
    .line 168
    invoke-virtual {p0}, Ll/w36;->n()V

    .line 169
    .line 170
    .line 171
    iget-object p0, v4, Lcom/clevertap/android/sdk/network/b;->e:Ll/w36;

    .line 172
    .line 173
    invoke-virtual {p0, v7, v1}, Ll/w36;->m(Lorg/json/JSONArray;Z)V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_2
    iget-object p0, v4, Lcom/clevertap/android/sdk/network/b;->e:Ll/w36;

    .line 178
    .line 179
    invoke-virtual {p0, v7, v0}, Ll/w36;->m(Lorg/json/JSONArray;Z)V

    .line 180
    .line 181
    .line 182
    add-int/2addr v3, v10

    .line 183
    sget-object p0, Lcom/clevertap/android/sdk/events/EventGroup;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 184
    .line 185
    iget-object p1, v4, Lcom/clevertap/android/sdk/network/b;->f:Ll/bj2;

    .line 186
    .line 187
    if-ne v6, p0, :cond_3

    .line 188
    .line 189
    invoke-virtual {v2}, Ll/gxb0;->b()Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-interface {p1, v5, p0}, Ll/bj2;->g(Landroid/content/Context;Ljava/util/List;)Z

    .line 194
    .line 195
    .line 196
    invoke-virtual {v2}, Ll/gxb0;->a()Lorg/json/JSONArray;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-direct {v4, p0}, Lcom/clevertap/android/sdk/network/b;->x(Lorg/json/JSONArray;)V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_3
    invoke-virtual {v2}, Ll/gxb0;->b()Ljava/util/List;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-virtual {v2}, Ll/gxb0;->d()Ljava/util/List;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-interface {p1, v5, p0, p2}, Ll/bj2;->e(Landroid/content/Context;Ljava/util/List;Ljava/util/List;)Z

    .line 213
    .line 214
    .line 215
    :goto_1
    invoke-virtual {v2}, Ll/gxb0;->c()Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    move-object p0, v4

    .line 220
    move-object p1, v5

    .line 221
    move-object p2, v6

    .line 222
    move-object p3, v8

    .line 223
    move p4, v9

    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :goto_2
    iget-object p0, v4, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    iget-object p1, v4, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    new-instance p2, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string p3, "Queue flush completed. Total events sent: "

    .line 241
    .line 242
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public final j()I
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/byb;->b()Ll/yxb;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/yxb;->h()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final k()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->k:Ll/tk20;

    .line 2
    .line 3
    iget v1, p0, Lcom/clevertap/android/sdk/network/b;->q:I

    .line 4
    .line 5
    iget v2, p0, Lcom/clevertap/android/sdk/network/b;->p:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/tk20;->g(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/clevertap/android/sdk/network/b;->q:I

    .line 12
    .line 13
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "Setting delay frequency to "

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v3, p0, Lcom/clevertap/android/sdk/network/b;->q:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v0, v1, v2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget p0, p0, Lcom/clevertap/android/sdk/network/b;->q:I

    .line 41
    .line 42
    return p0
.end method

.method public final s(Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/b;->z(Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final t(Lcom/clevertap/android/sdk/events/EventGroup;)Z
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 5
    .line 6
    sget-object v1, Lcom/clevertap/android/sdk/events/EventGroup;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne p1, v1, :cond_0

    .line 11
    .line 12
    move p1, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p1, v2

    .line 15
    :goto_0
    invoke-virtual {v0, p1}, Ll/byb;->c(Z)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget v0, p0, Lcom/clevertap/android/sdk/network/b;->o:I

    .line 20
    .line 21
    const/4 v1, 0x5

    .line 22
    if-le v0, v1, :cond_1

    .line 23
    .line 24
    move v0, v3

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_1
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0, v1}, Lcom/clevertap/android/sdk/network/b;->E(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    if-nez p1, :cond_4

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_3
    return v2

    .line 39
    :cond_4
    :goto_2
    return v3
.end method

.method public final z(Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/Runnable;)V
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    const-string v0, "Invalid HTTP status code received for handshake - "

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->h:Ll/byb;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/byb;->b()Ll/yxb;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/clevertap/android/sdk/events/EventGroup;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 16
    .line 17
    if-ne p1, v2, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    invoke-virtual {v1, p1}, Ll/yxb;->l(Z)Ll/j5d0;

    .line 23
    .line 24
    .line 25
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    :try_start_1
    invoke-virtual {p1}, Ll/j5d0;->n()Z

    .line 27
    .line 28
    .line 29
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    :try_start_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "Received success from handshake :)"

    .line 42
    .line 43
    invoke-interface {v2, v0, v1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->J(Ll/j5d0;)Z

    .line 47
    .line 48
    .line 49
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    :try_start_3
    invoke-static {p1, v3}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catch_0
    move-exception p1

    .line 57
    goto :goto_3

    .line 58
    :cond_1
    :try_start_4
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/b;->A(Ll/j5d0;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "We are not muted"

    .line 70
    .line 71
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catchall_0
    move-exception p2

    .line 79
    goto :goto_2

    .line 80
    :cond_2
    iget-object p2, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {v2, p2, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 106
    .line 107
    :try_start_5
    invoke-static {p1, v3}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :goto_2
    :try_start_6
    throw p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 112
    :catchall_1
    move-exception v0

    .line 113
    :try_start_7
    invoke-static {p1, p2}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    throw v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 117
    :goto_3
    iget-object p2, p0, Lcom/clevertap/android/sdk/network/b;->n:Ll/axl;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/b;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string v0, "Failed to perform handshake!"

    .line 126
    .line 127
    invoke-interface {p2, p0, v0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
