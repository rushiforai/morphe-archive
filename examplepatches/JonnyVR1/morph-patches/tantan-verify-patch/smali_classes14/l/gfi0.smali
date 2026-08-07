.class public final Ll/gfi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\'\u0010\r\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0003J\u0017\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0008R\u001c\u0010\u0015\u001a\n \u0012*\u0004\u0018\u00010\u00110\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u001c\u0010\u0017\u001a\n \u0012*\u0004\u0018\u00010\u00110\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0014R\u0014\u0010\u001b\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u0014R\u0016\u0010\u001e\u001a\u00020\u001c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/gfi0;",
        "",
        "<init>",
        "()V",
        "Landroid/app/Application;",
        "application",
        "",
        "g",
        "(Landroid/app/Application;)V",
        "Ll/ddi0;",
        "httpRequester",
        "Ll/zei0;",
        "router",
        "e",
        "(Landroid/app/Application;Ll/ddi0;Ll/zei0;)V",
        "f",
        "h",
        "",
        "kotlin.jvm.PlatformType",
        "a",
        "Ljava/lang/String;",
        "INTL_HOST",
        "b",
        "BASE_HOST",
        "c",
        "GET_WEB_CONFIG_URL",
        "d",
        "CHECKUPDATE_URL",
        "",
        "Z",
        "hadInit",
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


# static fields
.field public static final INSTANCE:Ll/gfi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ljava/lang/String;

.field public static final b:Ljava/lang/String;

.field public static final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static volatile e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/gfi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gfi0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gfi0;->INSTANCE:Ll/gfi0;

    .line 7
    .line 8
    const-string v0, "https://intl-fep-api.tantanapp.com"

    .line 9
    .line 10
    sput-object v0, Ll/gfi0;->a:Ljava/lang/String;

    .line 11
    .line 12
    sput-object v0, Ll/gfi0;->b:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "/v4/config/ext/getWebConfig"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sput-object v1, Ll/gfi0;->c:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, "/v4/config/ext/checkUpdate"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Ll/gfi0;->d:Ljava/lang/String;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/lang/Double;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method

.method public static b()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0

    .line 24
    :cond_0
    const-string v0, "1"

    .line 25
    .line 26
    return-object v0
.end method

.method public static c()Ljava/lang/Double;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    :cond_0
    return-object v0
.end method

.method public static final g(Landroid/app/Application;)V
    .locals 3
    .param p0    # Landroid/app/Application;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Ll/gfi0;->e:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    sput-boolean v0, Ll/gfi0;->e:Z

    .line 11
    .line 12
    invoke-static {p0}, Ll/lv0;->e(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/hellogroup/common/file/FileUtil$StorageMode;->SDCARD_INNER:Lcom/hellogroup/common/file/FileUtil$StorageMode;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->t(Lcom/hellogroup/common/file/FileUtil$StorageMode;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/gfi0;->INSTANCE:Ll/gfi0;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/gfi0;->h(Landroid/app/Application;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/ddi0;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/ddi0;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/zei0;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Ll/zei0;-><init>(Ll/ivl;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p0, v1, v2}, Ll/gfi0;->e(Landroid/app/Application;Ll/ddi0;Ll/zei0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/gfi0;->f()V

    .line 39
    .line 40
    .line 41
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 42
    .line 43
    invoke-virtual {v0, p0, v2}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->d(Landroid/app/Application;Ll/ojw;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Ll/vlg;->INSTANCE:Ll/vlg;

    .line 47
    .line 48
    new-instance v0, Ll/gfi0$d;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/gfi0$d;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/vlg;->a(Ll/pzl;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final e(Landroid/app/Application;Ll/ddi0;Ll/zei0;)V
    .locals 8

    .line 1
    :try_start_0
    new-instance v0, Ll/wfi;

    .line 2
    .line 3
    sget p0, Ll/uqb0;->t:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "intltantan"

    .line 10
    .line 11
    new-instance v3, Ll/cfi0;

    .line 12
    .line 13
    invoke-direct {v3}, Ll/cfi0;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ll/dfi0;

    .line 17
    .line 18
    invoke-direct {v4}, Ll/dfi0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v5, Ll/efi0;

    .line 22
    .line 23
    invoke-direct {v5}, Ll/efi0;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v6, Ll/ffi0;

    .line 27
    .line 28
    invoke-direct {v6}, Ll/ffi0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-direct/range {v0 .. v6}, Ll/wfi;-><init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3}, Ll/zei0;->I()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "mkHome"

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    move-object v1, v0

    .line 61
    new-instance v0, Ll/fgi;

    .line 62
    .line 63
    sget-object v2, Ll/gfi0;->c:Ljava/lang/String;

    .line 64
    .line 65
    sget-object v4, Ll/gfi0;->d:Ljava/lang/String;

    .line 66
    .line 67
    const/16 v6, 0x10

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    const/4 v5, 0x0

    .line 71
    invoke-direct/range {v0 .. v7}, Ll/fgi;-><init>(Ll/wfi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 72
    .line 73
    .line 74
    new-instance p0, Ll/qhi;

    .line 75
    .line 76
    new-instance p3, Ll/gfi0$a;

    .line 77
    .line 78
    invoke-direct {p3, p2}, Ll/gfi0$a;-><init>(Ll/ddi0;)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/gfi0$b;

    .line 82
    .line 83
    invoke-direct {p2}, Ll/gfi0$b;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, p3, p2}, Ll/qhi;-><init>(Ll/rk20;Ll/pyj0;)V

    .line 87
    .line 88
    .line 89
    sget-object p2, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const/4 p3, 0x0

    .line 96
    invoke-virtual {p2, p1, p3, v0, p0}, Lcom/hellogroup/fep/base/core/FepManager;->y(Landroid/content/Context;ZLl/fgi;Ll/qhi;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :catchall_0
    move-exception v0

    .line 101
    move-object p0, v0

    .line 102
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final f()V
    .locals 8

    .line 1
    :try_start_0
    new-instance p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 2
    .line 3
    new-instance v0, Ll/okw;

    .line 4
    .line 5
    const/16 v6, 0xf

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const-wide/16 v4, 0x0

    .line 12
    .line 13
    invoke-direct/range {v0 .. v7}, Ll/okw;-><init>(ZZZDILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/gfi0$c;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/gfi0$c;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0, v1}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;-><init>(Ll/okw;Ll/pkw;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->j(Lcom/hellogroup/mk/core/log/core/MKLogReporter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    move-object p0, v0

    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final h(Landroid/app/Application;)V
    .locals 5

    .line 1
    new-instance p0, Ll/fqw$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fqw$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "tantan"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/fqw$a;->a(Ljava/lang/String;)Ll/fqw$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "a45d4c0e-b117-3f"

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/fqw$a;->g(Ljava/lang/String;)Ll/fqw$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v1}, Ll/fqw$a;->e(Z)Ll/fqw$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v2, Ll/gfi0$e;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/gfi0$e;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v2}, Ll/fqw$a;->d(Ll/tof0;)Ll/fqw$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v2, Ll/qai0;

    .line 33
    .line 34
    invoke-direct {v2, v0}, Ll/qai0;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/qai0;

    .line 38
    .line 39
    const-string v3, "momo-basic"

    .line 40
    .line 41
    invoke-direct {v0, v3}, Ll/qai0;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/qai0;

    .line 45
    .line 46
    const-string v4, "momo-web"

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ll/qai0;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    new-array v4, v4, [Ll/ywl;

    .line 53
    .line 54
    aput-object v2, v4, v1

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    aput-object v0, v4, v1

    .line 58
    .line 59
    const/4 v0, 0x2

    .line 60
    aput-object v3, v4, v0

    .line 61
    .line 62
    invoke-virtual {p0, v4}, Ll/fqw$a;->c([Ll/ywl;)Ll/fqw$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v0, Ll/gfi0$f;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/gfi0$f;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/fqw$a;->f(Ll/xxl;)Ll/fqw$a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Ll/fqw$a;->b()Ll/fqw;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p1, p0}, Ll/eqw;->b(Landroid/app/Application;Ll/fqw;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
