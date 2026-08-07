.class public final Lcom/hellogroup/fep/base/core/FepManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;,
        Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver;,
        Lcom/hellogroup/fep/base/core/FepManager$InternalFepGreyObserver;,
        Lcom/hellogroup/fep/base/core/FepManager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000~\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010$\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 O2\u00020\u0001:\u0004LPQRB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J-\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000eJ#\u0010\u0012\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0010\u001a\u00020\u000f2\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u0014\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J#\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0018\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ/\u0010\u001f\u001a\u0004\u0018\u00010\u001b2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008\u001f\u0010 J;\u0010\"\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u001e\u001a\u00020\u000f2\n\u0008\u0002\u0010!\u001a\u0004\u0018\u00010\u000f2\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u000f2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008\"\u0010#J-\u0010%\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u001e\u001a\u00020\u000f2\u0008\u0010$\u001a\u0004\u0018\u00010\u000f2\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u0008%\u0010&J!\u0010(\u001a\u00020\'2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u0008(\u0010)J)\u0010-\u001a\u00020\u000c2\u001a\u0010,\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u000f\u0012\u0006\u0012\u0004\u0018\u00010\u00010+0*\u00a2\u0006\u0004\u0008-\u0010.J+\u00101\u001a\u0004\u0018\u0001002\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u0010/\u001a\u00020\u000f\u00a2\u0006\u0004\u00081\u00102J#\u00103\u001a\u0004\u0018\u0001002\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u00083\u00104J;\u00108\u001a\u00020\u00062\u0006\u00105\u001a\u00020\u000f2\u0006\u0010\u001e\u001a\u00020\u000f2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u00106\u001a\u00020\u000f2\n\u0008\u0002\u00107\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u00088\u00109J\u0017\u0010;\u001a\u00020\u00062\u0008\u0010:\u001a\u0004\u0018\u00010\u001b\u00a2\u0006\u0004\u0008;\u0010<J!\u0010=\u001a\u00020\u000c2\u0006\u0010\u001e\u001a\u00020\u000f2\n\u0008\u0002\u0010!\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u0008=\u0010>J\u0017\u0010@\u001a\u00020\u000c2\u0008\u0010?\u001a\u0004\u0018\u00010\u001b\u00a2\u0006\u0004\u0008@\u0010AJ\r\u0010B\u001a\u00020\u000c\u00a2\u0006\u0004\u0008B\u0010\u0003J\u0015\u0010E\u001a\u00020\u000c2\u0006\u0010D\u001a\u00020C\u00a2\u0006\u0004\u0008E\u0010FJ\u0015\u0010H\u001a\u00020\u000c2\u0006\u0010D\u001a\u00020G\u00a2\u0006\u0004\u0008H\u0010IJ\u0015\u0010J\u001a\u00020\u000c2\u0006\u0010D\u001a\u00020G\u00a2\u0006\u0004\u0008J\u0010IR\u001a\u0010N\u001a\u0008\u0012\u0004\u0012\u00020C0K8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008L\u0010M\u00a8\u0006S"
    }
    d2 = {
        "Lcom/hellogroup/fep/base/core/FepManager;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "",
        "debugMode",
        "Ll/fgi;",
        "configuration",
        "Ll/qhi;",
        "providers",
        "",
        "y",
        "(Landroid/content/Context;ZLl/fgi;Ll/qhi;)V",
        "",
        "key",
        "defaultValue",
        "j",
        "(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;",
        "Lcom/hellogroup/fep/config/model/FepConfigFetchType;",
        "type",
        "f",
        "(Lcom/hellogroup/fep/config/model/FepConfigFetchType;)V",
        "url",
        "Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;",
        "checkPolicy",
        "Ll/zgi;",
        "l",
        "(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "bid",
        "p",
        "(Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "baseVersion",
        "n",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "baseVer",
        "h",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;",
        "",
        "i",
        "(Ljava/lang/String;Ljava/lang/String;)J",
        "",
        "",
        "packageConfs",
        "s",
        "(Ljava/util/List;)V",
        "customVer",
        "Ljava/io/File;",
        "g",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;",
        "q",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;",
        "zipPath",
        "version",
        "prefix",
        "r",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z",
        "offlineInfo",
        "d",
        "(Ll/zgi;)Z",
        "w",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "packageInfo",
        "t",
        "(Ll/zgi;)V",
        "e",
        "Ll/rgi;",
        "observer",
        "u",
        "(Ll/rgi;)V",
        "Ll/ehi;",
        "v",
        "(Ll/ehi;)V",
        "x",
        "Ll/tl5;",
        "a",
        "Ll/tl5;",
        "observerManager",
        "Companion",
        "InternalFepConfigObserver",
        "InternalFepGreyObserver",
        "InternalFepPackageObserver",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

.field private static volatile b:Lcom/hellogroup/fep/base/core/FepManager;


# instance fields
.field private final a:Ll/tl5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tl5<",
            "Ll/rgi;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/fep/base/core/FepManager$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/fep/base/core/FepManager$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tl5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/tl5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/fep/base/core/FepManager;->a:Ll/tl5;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/hellogroup/fep/base/core/FepManager;-><init>()V

    return-void
.end method

.method public static final synthetic a()Lcom/hellogroup/fep/base/core/FepManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/fep/base/core/FepManager;->b:Lcom/hellogroup/fep/base/core/FepManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(Lcom/hellogroup/fep/base/core/FepManager;)Ll/tl5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager;->a:Ll/tl5;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/hellogroup/fep/base/core/FepManager;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/hellogroup/fep/base/core/FepManager;->b:Lcom/hellogroup/fep/base/core/FepManager;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic m(Lcom/hellogroup/fep/base/core/FepManager;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;ILjava/lang/Object;)Ll/zgi;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    sget-object p2, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/base/core/FepManager;->l(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic o(Lcom/hellogroup/fep/base/core/FepManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;ILjava/lang/Object;)Ll/zgi;
    .locals 1

    .line 1
    and-int/lit8 p6, p5, 0x2

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p6, :cond_0

    .line 5
    .line 6
    move-object p2, v0

    .line 7
    :cond_0
    and-int/lit8 p6, p5, 0x4

    .line 8
    .line 9
    if-eqz p6, :cond_1

    .line 10
    .line 11
    move-object p3, v0

    .line 12
    :cond_1
    and-int/lit8 p5, p5, 0x8

    .line 13
    .line 14
    if-eqz p5, :cond_2

    .line 15
    .line 16
    sget-object p4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 17
    .line 18
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/hellogroup/fep/base/core/FepManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static final z()Lcom/hellogroup/fep/base/core/FepManager;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    invoke-virtual {v0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final d(Ll/zgi;)Z
    .locals 0
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->c(Ll/zgi;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final e()V
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->d()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f(Lcom/hellogroup/fep/config/model/FepConfigFetchType;)V
    .locals 0
    .param p1    # Lcom/hellogroup/fep/config/model/FepConfigFetchType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/config/core/FepConfigManager;->Companion:Lcom/hellogroup/fep/config/core/FepConfigManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/config/core/FepConfigManager;->h(Lcom/hellogroup/fep/config/model/FepConfigFetchType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {p3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v0, p0

    .line 29
    :goto_0
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-static {p3}, Lkotlin/text/StringsKt;->p(Ljava/lang/String;)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    new-instance p0, Ljava/io/File;

    .line 42
    .line 43
    invoke-direct {p0, v0, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-eqz p3, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    const-wide/16 v5, 0x0

    .line 57
    .line 58
    cmp-long p3, v3, v5

    .line 59
    .line 60
    if-lez p3, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    if-eqz p3, :cond_1

    .line 73
    .line 74
    array-length p3, p3

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    const/4 p3, 0x0

    .line 77
    :goto_1
    if-lez p3, :cond_2

    .line 78
    .line 79
    sget-object p3, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 80
    .line 81
    invoke-virtual {p3}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-virtual {p3, p1, p2, v1, v2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-object p0
.end method

.method public final h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;)J
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->l(Ljava/lang/String;Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public final j(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/config/core/FepConfigManager;->Companion:Lcom/hellogroup/fep/config/core/FepConfigManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager;->k(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final k(Ljava/lang/String;)Ll/zgi;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-static {p0, p1, v0, v1, v0}, Lcom/hellogroup/fep/base/core/FepManager;->m(Lcom/hellogroup/fep/base/core/FepManager;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;ILjava/lang/Object;)Ll/zgi;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final l(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
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
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->m(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    .param p4    # Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final p(Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Ll/a6k0;->b(Ljava/lang/String;Ljava/lang/String;)Lkotlin/Pair;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    sget-object v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p2, p0, p1, p3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
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
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->j()Ll/bhi;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v1, p1

    .line 17
    move-object v2, p2

    .line 18
    move-object v3, p3

    .line 19
    move-object v4, p4

    .line 20
    move-object v5, p5

    .line 21
    invoke-virtual/range {v0 .. v5}, Ll/bhi;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public final s(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->p(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final t(Ll/zgi;)V
    .locals 0
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->q(Ll/zgi;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final u(Ll/rgi;)V
    .locals 0
    .param p1    # Ll/rgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager;->a:Ll/tl5;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tl5;->a(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final v(Ll/ehi;)V
    .locals 0
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->r(Ll/ehi;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final x(Ll/ehi;)V
    .locals 0
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->t(Ll/ehi;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final y(Landroid/content/Context;ZLl/fgi;Ll/qhi;)V
    .locals 11
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/fgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/qhi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/lv0;->e(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/xfi;

    .line 18
    .line 19
    invoke-virtual {p3}, Ll/fgi;->a()Ll/wfi;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p3}, Ll/fgi;->b()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v0, v1, v2}, Ll/xfi;-><init>(Ll/wfi;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Lcom/hellogroup/fep/base/core/a;

    .line 31
    .line 32
    invoke-virtual {p4}, Ll/qhi;->a()Ll/rk20;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v1, v2}, Lcom/hellogroup/fep/base/core/a;-><init>(Ll/rk20;)V

    .line 37
    .line 38
    .line 39
    sget-object v2, Lcom/hellogroup/fep/config/core/FepConfigManager;->Companion:Lcom/hellogroup/fep/config/core/FepConfigManager$a;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3, p1, p2, v0, v1}, Lcom/hellogroup/fep/config/core/FepConfigManager;->p(Landroid/content/Context;ZLl/xfi;Ll/agi;)V

    .line 46
    .line 47
    .line 48
    new-instance p1, Lcom/hellogroup/fep/base/core/b;

    .line 49
    .line 50
    invoke-direct {p1}, Lcom/hellogroup/fep/base/core/b;-><init>()V

    .line 51
    .line 52
    .line 53
    sget-object v0, Ll/hgi;->Companion:Ll/hgi$a;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/hgi$a;->a()Ll/hgi;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, p2, p1}, Ll/hgi;->g(ZLl/jgi;)V

    .line 60
    .line 61
    .line 62
    new-instance v3, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;

    .line 63
    .line 64
    invoke-virtual {p3}, Ll/fgi;->a()Ll/wfi;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {p3}, Ll/fgi;->e()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {p3}, Ll/fgi;->d()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {p3}, Ll/fgi;->c()Ljava/util/Map;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    const/16 v9, 0x8

    .line 81
    .line 82
    const/4 v10, 0x0

    .line 83
    const/4 v7, 0x0

    .line 84
    invoke-direct/range {v3 .. v10}, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;-><init>(Ll/wfi;Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 85
    .line 86
    .line 87
    new-instance p1, Ll/tc60;

    .line 88
    .line 89
    invoke-virtual {p4}, Ll/qhi;->a()Ll/rk20;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-virtual {p4}, Ll/qhi;->b()Ll/pyj0;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-direct {p1, p3, p4}, Ll/tc60;-><init>(Ll/rk20;Ll/pyj0;)V

    .line 98
    .line 99
    .line 100
    sget-object p3, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 101
    .line 102
    invoke-virtual {p3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 103
    .line 104
    .line 105
    move-result-object p4

    .line 106
    invoke-virtual {p4, p2, v3, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->u(ZLcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;Ll/tc60;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance p2, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;

    .line 114
    .line 115
    invoke-direct {p2, p0}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;-><init>(Lcom/hellogroup/fep/base/core/FepManager;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager;->o(Ll/bgi;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance p2, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver;-><init>(Lcom/hellogroup/fep/base/core/FepManager;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->r(Ll/ehi;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ll/hgi$a;->a()Ll/hgi;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    new-instance p2, Lcom/hellogroup/fep/base/core/FepManager$InternalFepGreyObserver;

    .line 138
    .line 139
    invoke-direct {p2, p0}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepGreyObserver;-><init>(Lcom/hellogroup/fep/base/core/FepManager;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1, p2}, Ll/hgi;->f(Ll/igi;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method
