.class public final synthetic Ll/rjw;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/hellogroup/fep/base/FepLogModuleType;->values()[Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Ll/rjw;->a:[I

    .line 9
    .line 10
    sget-object v1, Lcom/hellogroup/fep/base/FepLogModuleType;->config:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    aput v2, v0, v1

    .line 18
    .line 19
    sget-object v1, Lcom/hellogroup/fep/base/FepLogModuleType;->offlinepkg:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v3, 0x2

    .line 26
    aput v3, v0, v1

    .line 27
    .line 28
    sget-object v1, Lcom/hellogroup/fep/base/FepLogModuleType;->grey:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v4, 0x3

    .line 35
    aput v4, v0, v1

    .line 36
    .line 37
    invoke-static {}, Lcom/hellogroup/fep/base/FepLogLevel;->values()[Lcom/hellogroup/fep/base/FepLogLevel;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    array-length v0, v0

    .line 42
    new-array v0, v0, [I

    .line 43
    .line 44
    sput-object v0, Ll/rjw;->b:[I

    .line 45
    .line 46
    sget-object v1, Lcom/hellogroup/fep/base/FepLogLevel;->info:Lcom/hellogroup/fep/base/FepLogLevel;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    aput v2, v0, v1

    .line 53
    .line 54
    sget-object v1, Lcom/hellogroup/fep/base/FepLogLevel;->warning:Lcom/hellogroup/fep/base/FepLogLevel;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    aput v3, v0, v1

    .line 61
    .line 62
    sget-object v1, Lcom/hellogroup/fep/base/FepLogLevel;->error:Lcom/hellogroup/fep/base/FepLogLevel;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    aput v4, v0, v1

    .line 69
    .line 70
    return-void
.end method
