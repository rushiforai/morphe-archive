.class public final enum Lface/security/device/api/FaceSecDevice$DataSwitch;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lface/security/device/api/FaceSecDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DataSwitch"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lface/security/device/api/FaceSecDevice$DataSwitch;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lface/security/device/api/FaceSecDevice$DataSwitch;

.field public static final enum INIT_COLLECT_DATA:Lface/security/device/api/FaceSecDevice$DataSwitch;

.field public static final enum TOKEN_COLLECT_DATA:Lface/security/device/api/FaceSecDevice$DataSwitch;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 2
    .line 3
    const-string v1, "INIT_COLLECT_DATA"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lface/security/device/api/FaceSecDevice$DataSwitch;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lface/security/device/api/FaceSecDevice$DataSwitch;->INIT_COLLECT_DATA:Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 10
    .line 11
    new-instance v1, Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 12
    .line 13
    const-string v2, "TOKEN_COLLECT_DATA"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lface/security/device/api/FaceSecDevice$DataSwitch;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lface/security/device/api/FaceSecDevice$DataSwitch;->TOKEN_COLLECT_DATA:Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lface/security/device/api/FaceSecDevice$DataSwitch;->$VALUES:[Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lface/security/device/api/FaceSecDevice$DataSwitch;
    .locals 1

    .line 1
    const-class v0, Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lface/security/device/api/FaceSecDevice$DataSwitch;
    .locals 1

    .line 1
    sget-object v0, Lface/security/device/api/FaceSecDevice$DataSwitch;->$VALUES:[Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lface/security/device/api/FaceSecDevice$DataSwitch;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 8
    .line 9
    return-object v0
.end method
