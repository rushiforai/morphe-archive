.class public final enum Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "LOCAL_ONLY",
        "NO_UPDATE",
        "NORMAL",
        "FORCE_UPDATE",
        "LOCAL_NO_VISITOR",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

.field public static final enum FORCE_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

.field public static final enum LOCAL_NO_VISITOR:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

.field public static final enum LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

.field public static final enum NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

.field public static final enum NO_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 2
    .line 3
    const-string v1, "LOCAL_ONLY"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 11
    .line 12
    new-instance v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 13
    .line 14
    const-string v4, "NO_UPDATE"

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x3

    .line 18
    invoke-direct {v1, v4, v5, v6}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NO_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 22
    .line 23
    new-instance v4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 24
    .line 25
    const-string v7, "NORMAL"

    .line 26
    .line 27
    invoke-direct {v4, v7, v3, v2}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 31
    .line 32
    new-instance v2, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 33
    .line 34
    const-string v3, "FORCE_UPDATE"

    .line 35
    .line 36
    const/4 v7, 0x4

    .line 37
    invoke-direct {v2, v3, v6, v7}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v2, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->FORCE_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 41
    .line 42
    new-instance v3, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 43
    .line 44
    const-string v6, "LOCAL_NO_VISITOR"

    .line 45
    .line 46
    invoke-direct {v3, v6, v7, v5}, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v3, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_NO_VISITOR:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 50
    .line 51
    filled-new-array {v0, v1, v4, v2, v3}, [Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->$VALUES:[Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 56
    .line 57
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
    .locals 1

    const-class v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
    .locals 1

    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->$VALUES:[Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    invoke-virtual {v0}, [Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->value:I

    .line 2
    .line 3
    return p0
.end method
