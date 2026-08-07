.class public final Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J!\u0010\u0007\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u000b\u001a\u00020\n2\u0008\u0010\t\u001a\u0004\u0018\u00010\u0004H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\u000e\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0004H\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000cR\u0014\u0010\u0011\u001a\u00020\u00048\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010R!\u0010\u0013\u001a\u00020\n8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008\u000e\u0010\u0012\u0012\u0004\u0008\u0015\u0010\u0003\u001a\u0004\u0008\u0013\u0010\u0014R!\u0010\u0018\u001a\u00020\n8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u0012\u0012\u0004\u0008\u0017\u0010\u0003\u001a\u0004\u0008\u0016\u0010\u0014R!\u0010\u001a\u001a\u00020\n8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\u0012\u0012\u0004\u0008\u001b\u0010\u0003\u001a\u0004\u0008\u001a\u0010\u0014R!\u0010\u001e\u001a\u00020\n8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008\u0007\u0010\u0012\u0012\u0004\u0008\u001d\u0010\u0003\u001a\u0004\u0008\u001c\u0010\u0014R\u001b\u0010!\u001a\u00020\u001f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0012\u001a\u0004\u0008\u0019\u0010 \u00a8\u0006\""
    }
    d2 = {
        "Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;",
        "",
        "<init>",
        "()V",
        "",
        "jsonStr",
        "defaultValue",
        "e",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        "url",
        "",
        "c",
        "(Ljava/lang/String;)Z",
        "host",
        "b",
        "a",
        "Ljava/lang/String;",
        "TAG",
        "Lkotlin/Lazy;",
        "isAndroidDisableJsLocationReplace",
        "()Z",
        "isAndroidDisableJsLocationReplace$annotations",
        "f",
        "isAndroidUseNewCleanWebview$annotations",
        "isAndroidUseNewCleanWebview",
        "d",
        "isAndroidDisableCheckUrlOnNewCleanWebview",
        "isAndroidDisableCheckUrlOnNewCleanWebview$annotations",
        "g",
        "isUseDnsDefaultWhiteHosts$annotations",
        "isUseDnsDefaultWhiteHosts",
        "Ll/e7e;",
        "()Ll/e7e;",
        "mkDefaultWhiteHosts",
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
.field public static final INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;

# The value of this static final field might be set in the static constructor
.field private static final a:Ljava/lang/String; = "FepConfigControlHelper"

.field private static final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final f:Lkotlin/Lazy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;

    .line 7
    .line 8
    const-string v0, "FepConfigControlHelper"

    .line 9
    .line 10
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->a:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->b:Lkotlin/Lazy;

    .line 19
    .line 20
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidUseNewCleanWebview$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidUseNewCleanWebview$2;

    .line 21
    .line 22
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->c:Lkotlin/Lazy;

    .line 27
    .line 28
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableCheckUrlOnNewCleanWebview$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableCheckUrlOnNewCleanWebview$2;

    .line 29
    .line 30
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->d:Lkotlin/Lazy;

    .line 35
    .line 36
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isUseDnsDefaultWhiteHosts$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isUseDnsDefaultWhiteHosts$2;

    .line 37
    .line 38
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->e:Lkotlin/Lazy;

    .line 43
    .line 44
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$mkDefaultWhiteHosts$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$mkDefaultWhiteHosts$2;

    .line 45
    .line 46
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->f:Lkotlin/Lazy;

    .line 51
    .line 52
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

.method public static final synthetic a(Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final b(Ljava/lang/String;)Z
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_8

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_3

    .line 11
    .line 12
    :cond_0
    invoke-static {}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->g()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/xjw;->a()Ll/xjw;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Ll/xjw;->e(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-interface {v1, p0}, Ll/yym;->a(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-ne v1, v2, :cond_2

    .line 39
    .line 40
    return v2

    .line 41
    :cond_2
    sget-object v1, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->d()Ll/e7e;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, p0}, Ll/e7e;->a(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    return v2

    .line 54
    :cond_3
    :try_start_0
    invoke-static {}, Ll/xjw;->a()Ll/xjw;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, p0, v0}, Ll/xjw;->c(Ljava/lang/String;Z)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    new-instance v3, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    array-length v4, v1

    .line 71
    move v5, v0

    .line 72
    :goto_0
    if-ge v5, v4, :cond_7

    .line 73
    .line 74
    aget-object v6, v1, v5

    .line 75
    .line 76
    if-eqz v6, :cond_6

    .line 77
    .line 78
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-nez v7, :cond_4

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    invoke-static {v6, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    if-eqz v7, :cond_5

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_5
    invoke-interface {v3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :catch_0
    move-exception p0

    .line 97
    goto :goto_2

    .line 98
    :cond_6
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_7
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    xor-int/2addr p0, v2

    .line 106
    return p0

    .line 107
    :goto_2
    sget-object v1, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->a:Ljava/lang/String;

    .line 108
    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v3, "checkWebDnsEnabled error: "

    .line 112
    .line 113
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {v1, p0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_8
    :goto_3
    return v0
.end method

.method public static final c(Ljava/lang/String;)Z
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/sjw;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->b(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final d()Ll/e7e;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->f:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/e7e;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->a:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "getSafeJsonString error: "

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v0, p0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-object p1
.end method

.method public static final f()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->c:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static final g()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->e:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method
