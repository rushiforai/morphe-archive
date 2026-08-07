.class public final Lcom/immomo/android/network/metrics/NetworkTrackInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\t\n\u0002\u0008D\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u0090\u00012\u00020\u0001:\u0001\u0015B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0013\u0010\u0013\u001a\u00020\t*\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0017\u001a\u00020\t8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\"\u0010\u001e\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\u0007\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\"\u0010\"\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001f\u0010\u0007\u001a\u0004\u0008 \u0010\u001b\"\u0004\u0008!\u0010\u001dR\"\u0010&\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008#\u0010\u0007\u001a\u0004\u0008$\u0010\u001b\"\u0004\u0008%\u0010\u001dR\"\u0010*\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\'\u0010\u0007\u001a\u0004\u0008(\u0010\u001b\"\u0004\u0008)\u0010\u001dR\"\u0010.\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008+\u0010\u0007\u001a\u0004\u0008,\u0010\u001b\"\u0004\u0008-\u0010\u001dR\"\u00101\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008/\u0010\u0007\u001a\u0004\u0008/\u0010\u001b\"\u0004\u00080\u0010\u001dR\"\u00105\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00082\u0010\u0007\u001a\u0004\u00083\u0010\u001b\"\u0004\u00084\u0010\u001dR\"\u00108\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010\u0007\u001a\u0004\u00086\u0010\u001b\"\u0004\u00087\u0010\u001dR\"\u0010:\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008,\u0010\u0007\u001a\u0004\u0008+\u0010\u001b\"\u0004\u00089\u0010\u001dR\"\u0010<\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008(\u0010\u0007\u001a\u0004\u00082\u0010\u001b\"\u0004\u0008;\u0010\u001dR\"\u0010@\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008=\u0010\u0007\u001a\u0004\u0008>\u0010\u001b\"\u0004\u0008?\u0010\u001dR\"\u0010C\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008A\u0010\u0007\u001a\u0004\u0008A\u0010\u001b\"\u0004\u0008B\u0010\u001dR\"\u0010F\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008 \u0010\u0007\u001a\u0004\u0008D\u0010\u001b\"\u0004\u0008E\u0010\u001dR\"\u0010J\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008G\u0010\u0007\u001a\u0004\u0008H\u0010\u001b\"\u0004\u0008I\u0010\u001dR\"\u0010N\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008K\u0010\u0007\u001a\u0004\u0008L\u0010\u001b\"\u0004\u0008M\u0010\u001dR\"\u0010R\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008O\u0010\u0007\u001a\u0004\u0008P\u0010\u001b\"\u0004\u0008Q\u0010\u001dR\"\u0010T\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008P\u0010\u0007\u001a\u0004\u0008O\u0010\u001b\"\u0004\u0008S\u0010\u001dR\"\u0010V\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00086\u0010\u0007\u001a\u0004\u0008K\u0010\u001b\"\u0004\u0008U\u0010\u001dR\"\u0010Y\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00083\u0010\u0007\u001a\u0004\u0008W\u0010\u001b\"\u0004\u0008X\u0010\u001dR\"\u0010\\\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008Z\u0010\u0007\u001a\u0004\u0008=\u0010\u001b\"\u0004\u0008[\u0010\u001dR$\u0010d\u001a\u0004\u0018\u00010]8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008^\u0010_\u001a\u0004\u0008`\u0010a\"\u0004\u0008b\u0010cR\u0018\u0010e\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0016R\u0018\u0010\n\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010\u0016R$\u0010i\u001a\u00020f2\u0006\u0010g\u001a\u00020f8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008%\u0010h\u001a\u0004\u0008i\u0010jR.\u0010l\u001a\u0004\u0018\u00010k2\u0008\u0010l\u001a\u0004\u0018\u00010k8\u0006@FX\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00089\u0010m\u001a\u0004\u0008n\u0010o\"\u0004\u0008p\u0010qR\"\u0010t\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u0007\u001a\u0004\u0008r\u0010\u001b\"\u0004\u0008s\u0010\u001dR\"\u0010w\u001a\u00020\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00080\u0010\u0007\u001a\u0004\u0008u\u0010\u001b\"\u0004\u0008v\u0010\u001dR\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008p\u0010xR$\u0010{\u001a\u0004\u0018\u00010\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008;\u0010\u0016\u001a\u0004\u0008y\u0010\u000e\"\u0004\u0008z\u0010\u000cR\u0018\u0010|\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u0016R\u0018\u0010}\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u0010\u0016R\u0018\u0010~\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008)\u0010\u0016R4\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u007f2\t\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u007f8\u0006@FX\u0086\u000e\u00a2\u0006\u0016\n\u0005\u0008[\u0010\u0081\u0001\u001a\u0005\u0008G\u0010\u0082\u0001\"\u0006\u0008\u0083\u0001\u0010\u0084\u0001R\u0019\u0010\u0085\u0001\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008b\u0010\u0016R*\u0010\u008b\u0001\u001a\u0005\u0018\u00010\u0086\u00018\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0016\n\u0005\u0008\u0007\u0010\u0087\u0001\u001a\u0005\u0008Z\u0010\u0088\u0001\"\u0006\u0008\u0089\u0001\u0010\u008a\u0001R-\u0010\u008f\u0001\u001a\u0005\u0018\u00010\u008c\u00012\t\u0010g\u001a\u0005\u0018\u00010\u008c\u00018\u0006@BX\u0086\u000e\u00a2\u0006\u000e\n\u0005\u0008I\u0010\u008d\u0001\u001a\u0005\u0008^\u0010\u008e\u0001\u00a8\u0006\u0091\u0001"
    }
    d2 = {
        "Lcom/immomo/android/network/metrics/NetworkTrackInfo;",
        "",
        "<init>",
        "()V",
        "Ll/x1d0;",
        "request",
        "",
        "J",
        "(Ll/x1d0;)V",
        "",
        "connectIp",
        "A",
        "(Ljava/lang/String;)V",
        "toString",
        "()Ljava/lang/String;",
        "Ll/ry3;",
        "call",
        "Y",
        "(Ll/ry3;)V",
        "w",
        "(Ljava/lang/String;)Ljava/lang/String;",
        "a",
        "Ljava/lang/String;",
        "TAG",
        "",
        "b",
        "i",
        "()J",
        "E",
        "(J)V",
        "createTime",
        "c",
        "n",
        "O",
        "requestTimestamp",
        "d",
        "getCallStartTime",
        "y",
        "callStartTime",
        "e",
        "k",
        "G",
        "dnsStartTime",
        "f",
        "j",
        "F",
        "dnsEndTime",
        "g",
        "B",
        "connectStartTime",
        "h",
        "t",
        "W",
        "secureConnectStartTime",
        "s",
        "V",
        "secureConnectEndTime",
        "z",
        "connectEndTime",
        "D",
        "connectionAcquiredTime",
        "l",
        "getRequestHeadersStartTime",
        "N",
        "requestHeadersStartTime",
        "m",
        "M",
        "requestHeadersEndTime",
        "getRequestBodyStartTime",
        "L",
        "requestBodyStartTime",
        "o",
        "getRequestBodyEndTime",
        "K",
        "requestBodyEndTime",
        "p",
        "getResponseHeadersStartTime",
        "U",
        "responseHeadersStartTime",
        "q",
        "r",
        "T",
        "responseHeadersEndTime",
        "S",
        "responseBodyStartTime",
        "R",
        "responseBodyEndTime",
        "getCallEndTime",
        "x",
        "callEndTime",
        "u",
        "H",
        "finishTime",
        "Ljava/net/InetSocketAddress;",
        "v",
        "Ljava/net/InetSocketAddress;",
        "getInetSocketAddress",
        "()Ljava/net/InetSocketAddress;",
        "I",
        "(Ljava/net/InetSocketAddress;)V",
        "inetSocketAddress",
        "clientIp",
        "",
        "<set-?>",
        "Z",
        "isHttpDns",
        "()Z",
        "Ll/bx5;",
        "connection",
        "Ll/bx5;",
        "getConnection",
        "()Ll/bx5;",
        "C",
        "(Ll/bx5;)V",
        "getRequestBodyByteCount",
        "setRequestBodyByteCount",
        "requestBodyByteCount",
        "getResponseBodyByteCount",
        "Q",
        "responseBodyByteCount",
        "Ll/x1d0;",
        "getUrl",
        "setUrl",
        "url",
        "requestSize",
        "requestHeaderSize",
        "requestBodySize",
        "Ll/i5d0;",
        "response",
        "Ll/i5d0;",
        "()Ll/i5d0;",
        "P",
        "(Ll/i5d0;)V",
        "responseCode",
        "",
        "Ljava/lang/Throwable;",
        "()Ljava/lang/Throwable;",
        "X",
        "(Ljava/lang/Throwable;)V",
        "throwable",
        "Lokhttp3/TlsVersion;",
        "Lokhttp3/TlsVersion;",
        "()Lokhttp3/TlsVersion;",
        "tlsVersion",
        "Companion",
        "sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;


# instance fields
.field private A:J

.field private B:J

.field private C:Ll/x1d0;

.field private D:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private E:Ljava/lang/String;

.field private F:Ljava/lang/String;

.field private G:Ljava/lang/String;

.field private H:Ll/i5d0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private I:Ljava/lang/String;

.field private J:Ljava/lang/Throwable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private K:Lokhttp3/TlsVersion;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final a:Ljava/lang/String;

.field private b:J

.field private c:J

.field private d:J

.field private e:J

.field private f:J

.field private g:J

.field private h:J

.field private i:J

.field private j:J

.field private k:J

.field private l:J

.field private m:J

.field private n:J

.field private o:J

.field private p:J

.field private q:J

.field private r:J

.field private s:J

.field private t:J

.field private u:J

.field private v:Ljava/net/InetSocketAddress;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private w:Ljava/lang/String;

.field private x:Ljava/lang/String;

.field private y:Z

.field private z:Ll/bx5;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->Companion:Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "NetworkTrackInfo"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->x:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->C:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->G:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->E:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->I:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->x:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final B(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->g:J

    .line 2
    .line 3
    return-void
.end method

.method public final C(Ll/bx5;)V
    .locals 1
    .param p1    # Ll/bx5;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->z:Ll/bx5;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    :try_start_0
    invoke-interface {p1}, Ll/bx5;->c()Ll/txk;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/txk;->g()Lokhttp3/TlsVersion;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->K:Lokhttp3/TlsVersion;

    .line 16
    .line 17
    :cond_0
    invoke-interface {p1}, Ll/bx5;->b()Ll/nnd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->x:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p1}, Ll/bx5;->d()Ljava/net/Socket;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->C:Ll/x1d0;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 v0, 0x0

    .line 77
    :goto_0
    invoke-interface {p1}, Ll/bx5;->b()Ll/nnd0;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    xor-int/lit8 p1, p1, 0x1

    .line 97
    .line 98
    iput-boolean p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->y:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    :catch_0
    :cond_2
    return-void
.end method

.method public final D(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->k:J

    .line 2
    .line 3
    return-void
.end method

.method public final E(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b:J

    .line 2
    .line 3
    return-void
.end method

.method public final F(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->f:J

    .line 2
    .line 3
    return-void
.end method

.method public final G(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->e:J

    .line 2
    .line 3
    return-void
.end method

.method public final H(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u:J

    .line 2
    .line 3
    return-void
.end method

.method public final I(Ljava/net/InetSocketAddress;)V
    .locals 0
    .param p1    # Ljava/net/InetSocketAddress;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->v:Ljava/net/InetSocketAddress;

    .line 2
    .line 3
    return-void
.end method

.method public final J(Ll/x1d0;)V
    .locals 5
    .param p1    # Ll/x1d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->C:Ll/x1d0;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/rnl;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->D:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/x1d0;->e()Ll/e0l;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/e0l;->a()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->F:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ll/rnl;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    long-to-int v3, v0

    .line 67
    add-int/2addr v2, v3

    .line 68
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    if-nez p1, :cond_0

    .line 79
    .line 80
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 81
    .line 82
    .line 83
    :cond_0
    invoke-virtual {p1}, Ll/z1d0;->contentLength()J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    long-to-int p1, v3

    .line 88
    add-int/2addr v2, p1

    .line 89
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->E:Ljava/lang/String;

    .line 96
    .line 97
    int-to-long v2, v2

    .line 98
    sub-long/2addr v2, v0

    .line 99
    const-wide/16 v0, 0x0

    .line 100
    .line 101
    invoke-static {v2, v3, v0, v1}, Lkotlin/ranges/a;->c(JJ)J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->G:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    :catch_0
    :cond_2
    return-void
.end method

.method public final K(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->o:J

    .line 2
    .line 3
    return-void
.end method

.method public final L(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->n:J

    .line 2
    .line 3
    return-void
.end method

.method public final M(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->m:J

    .line 2
    .line 3
    return-void
.end method

.method public final N(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->l:J

    .line 2
    .line 3
    return-void
.end method

.method public final O(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->c:J

    .line 2
    .line 3
    return-void
.end method

.method public final P(Ll/i5d0;)V
    .locals 0
    .param p1    # Ll/i5d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->H:Ll/i5d0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->I:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final Q(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->B:J

    .line 2
    .line 3
    return-void
.end method

.method public final R(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->s:J

    .line 2
    .line 3
    return-void
.end method

.method public final S(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->r:J

    .line 2
    .line 3
    return-void
.end method

.method public final T(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->q:J

    .line 2
    .line 3
    return-void
.end method

.method public final U(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->p:J

    .line 2
    .line 3
    return-void
.end method

.method public final V(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->i:J

    .line 2
    .line 3
    return-void
.end method

.method public final W(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->h:J

    .line 2
    .line 3
    return-void
.end method

.method public final X(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->J:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-void
.end method

.method public final Y(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;-><init>(Lcom/immomo/android/network/metrics/NetworkTrackInfo;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final k()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final l()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final o()Ll/i5d0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->H:Ll/i5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->s:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final q()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->r:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final r()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final s()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final t()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "NetworkTrackInfo{requestTimestamp="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->c:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "createTime="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isHttpDns="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->y:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", requestBodyByteCount="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->A:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", responseBodyByteCount="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-wide v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->B:J

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", url=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->D:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", requestHeaderSize=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->F:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", responseCode=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->I:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", throwable="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->J:Ljava/lang/Throwable;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const/16 p0, 0x7d

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method

.method public final u()Ljava/lang/Throwable;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->J:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final v()Lokhttp3/TlsVersion;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->K:Lokhttp3/TlsVersion;

    .line 2
    .line 3
    return-object p0
.end method

.method public final w(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    const-string p0, ""

    .line 5
    .line 6
    return-object p0
.end method

.method public final x(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->t:J

    .line 2
    .line 3
    return-void
.end method

.method public final y(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->d:J

    .line 2
    .line 3
    return-void
.end method

.method public final z(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->j:J

    .line 2
    .line 3
    return-void
.end method
