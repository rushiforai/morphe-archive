.class public final synthetic Ll/dhi;
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


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->values()[Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

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
    sput-object v0, Ll/dhi;->a:[I

    .line 9
    .line 10
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

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
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NO_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x2

    .line 26
    aput v2, v0, v1

    .line 27
    .line 28
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x3

    .line 35
    aput v2, v0, v1

    .line 36
    .line 37
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->FORCE_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x4

    .line 44
    aput v2, v0, v1

    .line 45
    .line 46
    return-void
.end method
