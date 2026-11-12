.class public final enum Lcom/leanplum/LeanplumDeviceIdMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/LeanplumDeviceIdMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/LeanplumDeviceIdMode;

.field public static final enum ADVERTISING_ID:Lcom/leanplum/LeanplumDeviceIdMode;

.field public static final enum ANDROID_ID:Lcom/leanplum/LeanplumDeviceIdMode;

.field public static final enum MD5_MAC_ADDRESS:Lcom/leanplum/LeanplumDeviceIdMode;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/leanplum/LeanplumDeviceIdMode;

    const-string v1, "MD5_MAC_ADDRESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/leanplum/LeanplumDeviceIdMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/leanplum/LeanplumDeviceIdMode;->MD5_MAC_ADDRESS:Lcom/leanplum/LeanplumDeviceIdMode;

    new-instance v1, Lcom/leanplum/LeanplumDeviceIdMode;

    const-string v2, "ANDROID_ID"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/leanplum/LeanplumDeviceIdMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/leanplum/LeanplumDeviceIdMode;->ANDROID_ID:Lcom/leanplum/LeanplumDeviceIdMode;

    new-instance v2, Lcom/leanplum/LeanplumDeviceIdMode;

    const-string v3, "ADVERTISING_ID"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/leanplum/LeanplumDeviceIdMode;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/leanplum/LeanplumDeviceIdMode;->ADVERTISING_ID:Lcom/leanplum/LeanplumDeviceIdMode;

    filled-new-array {v0, v1, v2}, [Lcom/leanplum/LeanplumDeviceIdMode;

    move-result-object v0

    sput-object v0, Lcom/leanplum/LeanplumDeviceIdMode;->$VALUES:[Lcom/leanplum/LeanplumDeviceIdMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/LeanplumDeviceIdMode;
    .registers 2

    const-class v0, Lcom/leanplum/LeanplumDeviceIdMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/LeanplumDeviceIdMode;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/LeanplumDeviceIdMode;
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumDeviceIdMode;->$VALUES:[Lcom/leanplum/LeanplumDeviceIdMode;

    invoke-virtual {v0}, [Lcom/leanplum/LeanplumDeviceIdMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/LeanplumDeviceIdMode;

    return-object v0
.end method
