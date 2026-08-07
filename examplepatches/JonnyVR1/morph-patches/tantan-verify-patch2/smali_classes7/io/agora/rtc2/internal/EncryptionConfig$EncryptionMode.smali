.class public final enum Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/EncryptionConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EncryptionMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_128_ECB:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_128_GCM:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_128_GCM2:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_128_XTS:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_256_GCM:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_256_GCM2:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum AES_256_XTS:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum MODE_END:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

.field public static final enum SM4_128_ECB:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    new-instance v0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v1, "AES_128_XTS"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_128_XTS:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v1, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v2, "AES_128_ECB"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_128_ECB:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v2, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v3, "AES_256_XTS"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_256_XTS:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v3, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v4, "SM4_128_ECB"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->SM4_128_ECB:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v4, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v5, "AES_128_GCM"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_128_GCM:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v5, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v6, "AES_256_GCM"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_256_GCM:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v6, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v7, "AES_128_GCM2"

    const/4 v9, 0x7

    invoke-direct {v6, v7, v8, v9}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_128_GCM2:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v7, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v8, "AES_256_GCM2"

    const/16 v10, 0x8

    invoke-direct {v7, v8, v9, v10}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_256_GCM2:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    new-instance v8, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const-string v9, "MODE_END"

    const/16 v11, 0x9

    invoke-direct {v8, v9, v10, v11}, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->MODE_END:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    filled-new-array/range {v0 .. v8}, [Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->$VALUES:[Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;
    .locals 1

    const-class v0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;
    .locals 1

    sget-object v0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->$VALUES:[Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    invoke-virtual {v0}, [Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->value:I

    return p0
.end method
