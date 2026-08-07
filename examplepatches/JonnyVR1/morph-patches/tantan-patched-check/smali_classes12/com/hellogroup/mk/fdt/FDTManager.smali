.class public final Lcom/hellogroup/mk/fdt/FDTManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/fdt/FDTManager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\u0014B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000c\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001f\u0010\u0012\u001a\u00020\u00082\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001f\u0010\u0014\u001a\u00020\u00082\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0014\u0010\u0013J\r\u0010\u0015\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0015\u0010\u0003J\r\u0010\u0016\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0016\u0010\u0003J\u0015\u0010\u0017\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\r\u0010\u0019\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0019\u0010\u0003J\r\u0010\u001a\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001e\u001a\u00020\u00082\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u00a2\u0006\u0004\u0008\u001e\u0010\u001fR\"\u0010&\u001a\u00020 8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010!\u001a\u0004\u0008\"\u0010#\"\u0004\u0008$\u0010%R\u001b\u0010+\u001a\u00020\'8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010(\u001a\u0004\u0008)\u0010*R\u0018\u0010.\u001a\u0004\u0018\u00010,8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010-R\u0018\u00101\u001a\u0004\u0018\u00010/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\t\u00100R\u0018\u00103\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u00102R\u0018\u00105\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00084\u00102R\u0016\u00107\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u00106R\u0016\u00108\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008)\u00106R\"\u0010<\u001a\u00020 8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00089\u0010!\u001a\u0004\u0008:\u0010#\"\u0004\u0008;\u0010%R\"\u0010>\u001a\u00020 8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000c\u0010!\u001a\u0004\u00084\u0010#\"\u0004\u0008=\u0010%R(\u0010D\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00068\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008:\u0010?\u001a\u0004\u0008@\u0010A\"\u0004\u0008B\u0010CR\u001b\u0010G\u001a\u00020E8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010(\u001a\u0004\u00089\u0010F\u00a8\u0006H"
    }
    d2 = {
        "Lcom/hellogroup/mk/fdt/FDTManager;",
        "",
        "<init>",
        "()V",
        "",
        "token",
        "",
        "actions",
        "",
        "d",
        "(Ljava/lang/String;Ljava/util/List;)V",
        "encryptToken",
        "j",
        "(Ljava/lang/String;)Ljava/lang/String;",
        "Lorg/json/JSONObject;",
        "params",
        "Lcom/hellogroup/mk/fdt/FDTManager$a;",
        "listener",
        "m",
        "(Lorg/json/JSONObject;Lcom/hellogroup/mk/fdt/FDTManager$a;)V",
        "a",
        "n",
        "b",
        "c",
        "(Lcom/hellogroup/mk/fdt/FDTManager$a;)V",
        "e",
        "g",
        "()Ljava/lang/String;",
        "Landroid/app/Activity;",
        "activity",
        "l",
        "(Landroid/app/Activity;)V",
        "",
        "Z",
        "getTrustLocalHostUrl",
        "()Z",
        "setTrustLocalHostUrl",
        "(Z)V",
        "trustLocalHostUrl",
        "Ll/etl;",
        "Lkotlin/Lazy;",
        "h",
        "()Ll/etl;",
        "mIFDTRepository",
        "Ll/r0w;",
        "Ll/r0w;",
        "mLoginFDTUseCase",
        "Ll/s35;",
        "Ll/s35;",
        "mCheckFDTTokenUseCase",
        "Lcom/hellogroup/mk/fdt/FDTManager$a;",
        "mLoginListener",
        "f",
        "mActionListener",
        "Ljava/lang/String;",
        "mFDTIp",
        "mFDTMacAddress",
        "i",
        "k",
        "setWebViewDebug",
        "webViewDebug",
        "setAuthDevice",
        "authDevice",
        "Ljava/util/List;",
        "getMInjectWebViewIdList",
        "()Ljava/util/List;",
        "setMInjectWebViewIdList",
        "(Ljava/util/List;)V",
        "mInjectWebViewIdList",
        "Ll/buf;",
        "()Ll/buf;",
        "mPageStore",
        "MKFDT_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

.field private static a:Z

.field private static final b:Lkotlin/Lazy;

.field private static c:Ll/r0w;

.field private static d:Ll/s35;

.field private static e:Lcom/hellogroup/mk/fdt/FDTManager$a;

.field private static f:Lcom/hellogroup/mk/fdt/FDTManager$a;

.field private static g:Ljava/lang/String;

.field private static h:Ljava/lang/String;

.field private static i:Z

.field private static j:Z

.field private static k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final l:Lkotlin/Lazy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/fdt/FDTManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/mk/fdt/FDTManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 7
    .line 8
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager$mIFDTRepository$2;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager$mIFDTRepository$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->b:Lkotlin/Lazy;

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 19
    .line 20
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->h:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->k:Ljava/util/List;

    .line 28
    .line 29
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager$mPageStore$2;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager$mPageStore$2;

    .line 30
    .line 31
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->l:Lkotlin/Lazy;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final d(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FDTManager checkToken token:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "FDTManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->d:Ll/s35;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/b6k0;->c()V

    .line 25
    .line 26
    .line 27
    :cond_0
    new-instance v0, Ll/s35;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/hellogroup/mk/fdt/FDTManager;->h()Ll/etl;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Ll/s35;-><init>(Ll/etl;)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->d:Ll/s35;

    .line 37
    .line 38
    new-instance p0, Lcom/hellogroup/mk/fdt/FDTManager$b;

    .line 39
    .line 40
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/fdt/FDTManager$b;-><init>(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    check-cast p0, Lorg/reactivestreams/Subscriber;

    .line 44
    .line 45
    invoke-virtual {v0, p0, p1}, Ll/b6k0;->d(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private final h()Ll/etl;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/etl;

    .line 8
    .line 9
    return-object p0
.end method

.method private final i()Ll/buf;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->l:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/buf;

    .line 8
    .line 9
    return-object p0
.end method

.method private final j(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Ll/wic0;->INSTANCE:Ll/wic0;

    .line 2
    .line 3
    const-string v0, "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJt7+MOonQ4fsTsXWrNwLm1j9iSec4AXc0MGO2dSvWxzcsL4EXbQuJEUfxTmhfkBWZ4Fgjxv9PTH7Bw+RotXBRcCAwEAAQ=="

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/wic0;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "\u89e3\u5bc6 token \u5931\u8d25:"

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "FDTManager"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string p0, ""

    .line 35
    .line 36
    return-object p0
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;Lcom/hellogroup/mk/fdt/FDTManager$a;)V
    .locals 8
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/fdt/FDTManager$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "FDTManager bridgeAction params:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "FDTManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, ""

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string v2, "codef"

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v2, v0

    .line 37
    :goto_0
    if-eqz p1, :cond_1

    .line 38
    .line 39
    const-string v3, "codee"

    .line 40
    .line 41
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move-object v3, v0

    .line 49
    :goto_1
    const/4 v4, 0x0

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    const-string v5, "action"

    .line 53
    .line 54
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    move-object v5, v4

    .line 60
    :goto_2
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const-string v6, "fdtIp"

    .line 63
    .line 64
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    if-eqz v6, :cond_3

    .line 69
    .line 70
    move-object v0, v6

    .line 71
    :cond_3
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-lez v6, :cond_4

    .line 76
    .line 77
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 78
    .line 79
    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    if-eqz v5, :cond_6

    .line 85
    .line 86
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-lez v6, :cond_5

    .line 91
    .line 92
    move-object v4, v5

    .line 93
    :cond_5
    if-eqz v4, :cond_6

    .line 94
    .line 95
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    const/4 v6, 0x0

    .line 100
    :goto_3
    if-ge v6, v5, :cond_6

    .line 101
    .line 102
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    add-int/lit8 v6, v6, 0x1

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v5, "FDTManager executeAction actions:"

    .line 115
    .line 116
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v5, ", encryptToken:"

    .line 123
    .line 124
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-static {v1, v4}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sput-object p2, Lcom/hellogroup/mk/fdt/FDTManager;->f:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 138
    .line 139
    invoke-direct {p0, v2}, Lcom/hellogroup/mk/fdt/FDTManager;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v4, "FDTManager executeAction token:"

    .line 146
    .line 147
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v1, v2}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    if-nez v2, :cond_7

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_9

    .line 172
    .line 173
    :goto_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string p2, "FDTManager executeAction \u53c2\u6570\u9519\u8bef params:"

    .line 176
    .line 177
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {v1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->e:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 191
    .line 192
    if-eqz p0, :cond_8

    .line 193
    .line 194
    const/4 p1, 0x3

    .line 195
    const-string p2, "\u53c2\u6570\u9519\u8bef"

    .line 196
    .line 197
    invoke-interface {p0, p1, p2}, Lcom/hellogroup/mk/fdt/FDTManager$a;->a(ILjava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_8
    return-void

    .line 201
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/fdt/FDTManager;->d(Ljava/lang/String;Ljava/util/List;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->e:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 3
    .line 4
    sput-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->f:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 5
    .line 6
    return-void
.end method

.method public final c(Lcom/hellogroup/mk/fdt/FDTManager$a;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/fdt/FDTManager$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean p0, Lcom/hellogroup/mk/fdt/FDTManager;->a:Z

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u5df2\u8fde\u63a5"

    .line 10
    .line 11
    invoke-interface {p1, v0, p0}, Lcom/hellogroup/mk/fdt/FDTManager$a;->a(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    const-string v0, "\u672a\u8fde\u63a5"

    .line 17
    .line 18
    invoke-interface {p1, p0, v0}, Lcom/hellogroup/mk/fdt/FDTManager$a;->a(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/fdt/FDTManager;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/hellogroup/mk/fdt/FDTManager;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/hellogroup/mk/fdt/FDTManager;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final l(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 p1, 0x80

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final m(Lorg/json/JSONObject;Lcom/hellogroup/mk/fdt/FDTManager$a;)V
    .locals 3
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/fdt/FDTManager$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "FDTManager login params:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "FDTManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, ""

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string v2, "ip"

    .line 28
    .line 29
    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v2, v0

    .line 37
    :goto_0
    sput-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const-string v2, "mac_address"

    .line 42
    .line 43
    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    move-object v0, v2

    .line 50
    :cond_1
    sput-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->h:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "FDTManager login ip:"

    .line 55
    .line 56
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v2, ", mac:"

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    sget-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v1, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sput-object p2, Lcom/hellogroup/mk/fdt/FDTManager;->e:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 82
    .line 83
    sget-object p2, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 84
    .line 85
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-nez p2, :cond_2

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    sget-object p2, Lcom/hellogroup/mk/fdt/FDTManager;->h:Ljava/lang/String;

    .line 93
    .line 94
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-nez p2, :cond_4

    .line 99
    .line 100
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string p2, "FDTManager login \u53c2\u6570\u9519\u8bef params:"

    .line 103
    .line 104
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {v1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->e:Lcom/hellogroup/mk/fdt/FDTManager$a;

    .line 118
    .line 119
    if-eqz p0, :cond_3

    .line 120
    .line 121
    const/4 p1, 0x3

    .line 122
    const-string p2, "\u53c2\u6570\u9519\u8bef"

    .line 123
    .line 124
    invoke-interface {p0, p1, p2}, Lcom/hellogroup/mk/fdt/FDTManager$a;->a(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void

    .line 128
    :cond_4
    sget-object p1, Lcom/hellogroup/mk/fdt/FDTManager;->c:Ll/r0w;

    .line 129
    .line 130
    if-eqz p1, :cond_5

    .line 131
    .line 132
    invoke-virtual {p1}, Ll/b6k0;->c()V

    .line 133
    .line 134
    .line 135
    :cond_5
    new-instance p1, Ll/r0w;

    .line 136
    .line 137
    invoke-direct {p0}, Lcom/hellogroup/mk/fdt/FDTManager;->h()Ll/etl;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-direct {p1, p0}, Ll/r0w;-><init>(Ll/etl;)V

    .line 142
    .line 143
    .line 144
    sput-object p1, Lcom/hellogroup/mk/fdt/FDTManager;->c:Ll/r0w;

    .line 145
    .line 146
    new-instance p0, Lcom/hellogroup/mk/fdt/FDTManager$c;

    .line 147
    .line 148
    invoke-direct {p0}, Lcom/hellogroup/mk/fdt/FDTManager$c;-><init>()V

    .line 149
    .line 150
    .line 151
    check-cast p0, Lorg/reactivestreams/Subscriber;

    .line 152
    .line 153
    sget-object p2, Lcom/hellogroup/mk/fdt/FDTManager;->h:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p1, p0, p2}, Ll/b6k0;->d(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/hellogroup/mk/fdt/FDTManager;->j:Z

    .line 3
    .line 4
    const-string v1, "FDTManager"

    .line 5
    .line 6
    const-string v2, "reset"

    .line 7
    .line 8
    invoke-static {v1, v2}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Ll/auf;->INSTANCE:Ll/auf;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Ll/auf;->k(Ll/auf$a;)V

    .line 15
    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    sput-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->g:Ljava/lang/String;

    .line 20
    .line 21
    sput-boolean v0, Lcom/hellogroup/mk/fdt/FDTManager;->i:Z

    .line 22
    .line 23
    sget-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->c:Ll/r0w;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/b6k0;->c()V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object v2, Lcom/hellogroup/mk/fdt/FDTManager;->d:Ll/s35;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/b6k0;->c()V

    .line 35
    .line 36
    .line 37
    :cond_1
    sput-boolean v0, Lcom/hellogroup/mk/fdt/FDTManager;->a:Z

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ll/auf;->l(Z)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/euf;->INSTANCE:Ll/euf;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/euf;->a()V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Lcom/hellogroup/mk/fdt/FDTManager;->i()Ll/buf;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/buf;->a()V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->k:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->b()Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

    .line 64
    .line 65
    const-string v1, "fdt_disconnect"

    .line 66
    .line 67
    invoke-direct {v0, v1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string v1, "native"

    .line 71
    .line 72
    filled-new-array {v1}, [Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;->c([Ljava/lang/String;)Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->d(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
