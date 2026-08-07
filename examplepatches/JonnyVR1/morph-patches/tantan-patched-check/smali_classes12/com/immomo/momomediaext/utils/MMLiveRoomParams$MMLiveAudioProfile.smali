.class public final enum Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MMLiveAudioProfile"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field public static final enum MMLiveAudioProfileHigh:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field public static final enum MMLiveAudioProfileLow:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field public static final enum MMLiveAudioProfileNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field public static final enum MMLiveAudioProfileStandard:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileLow:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileStandard:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 6
    .line 7
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileHigh:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "MMLiveAudioProfileNone"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 13
    .line 14
    const-string v1, "MMLiveAudioProfileLow"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileLow:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 23
    .line 24
    const-string v1, "MMLiveAudioProfileStandard"

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileStandard:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 31
    .line 32
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 33
    .line 34
    const-string v1, "MMLiveAudioProfileHigh"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileHigh:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 41
    .line 42
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->$values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 47
    .line 48
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
    iput p3, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->value:I

    .line 2
    .line 3
    return p0
.end method
