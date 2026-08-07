.class public final enum Lorg/spongycastle/crypto/util/DERMacData$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/util/DERMacData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/spongycastle/crypto/util/DERMacData$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/spongycastle/crypto/util/DERMacData$Type;

.field public static final enum BILATERALU:Lorg/spongycastle/crypto/util/DERMacData$Type;

.field public static final enum BILATERALV:Lorg/spongycastle/crypto/util/DERMacData$Type;

.field public static final enum UNILATERALU:Lorg/spongycastle/crypto/util/DERMacData$Type;

.field public static final enum UNILATERALV:Lorg/spongycastle/crypto/util/DERMacData$Type;


# instance fields
.field private final enc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "KC_1_U"

    .line 5
    .line 6
    const-string v3, "UNILATERALU"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lorg/spongycastle/crypto/util/DERMacData$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/spongycastle/crypto/util/DERMacData$Type;->UNILATERALU:Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 12
    .line 13
    new-instance v1, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "KC_1_V"

    .line 17
    .line 18
    const-string v4, "UNILATERALV"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/crypto/util/DERMacData$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lorg/spongycastle/crypto/util/DERMacData$Type;->UNILATERALV:Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 24
    .line 25
    new-instance v2, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "KC_2_U"

    .line 29
    .line 30
    const-string v5, "BILATERALU"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lorg/spongycastle/crypto/util/DERMacData$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lorg/spongycastle/crypto/util/DERMacData$Type;->BILATERALU:Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 36
    .line 37
    new-instance v3, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "KC_2_V"

    .line 41
    .line 42
    const-string v6, "BILATERALV"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lorg/spongycastle/crypto/util/DERMacData$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lorg/spongycastle/crypto/util/DERMacData$Type;->BILATERALV:Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 48
    .line 49
    filled-new-array {v0, v1, v2, v3}, [Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lorg/spongycastle/crypto/util/DERMacData$Type;->$VALUES:[Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 54
    .line 55
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/spongycastle/crypto/util/DERMacData$Type;->enc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/spongycastle/crypto/util/DERMacData$Type;
    .locals 1

    .line 1
    const-class v0, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/spongycastle/crypto/util/DERMacData$Type;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/util/DERMacData$Type;->$VALUES:[Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/spongycastle/crypto/util/DERMacData$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/spongycastle/crypto/util/DERMacData$Type;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getHeader()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/util/DERMacData$Type;->enc:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
