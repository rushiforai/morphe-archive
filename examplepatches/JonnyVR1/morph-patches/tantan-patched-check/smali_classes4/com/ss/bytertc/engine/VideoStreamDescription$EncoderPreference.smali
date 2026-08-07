.class public final enum Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/VideoStreamDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EncoderPreference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

.field public static final enum Balance:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

.field public static final enum Disabled:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

.field public static final enum MaintainFramerate:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

.field public static final enum MaintainQuality:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 2
    .line 3
    const-string v1, "Disabled"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->Disabled:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 12
    .line 13
    const-string v2, "MaintainFramerate"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->MaintainFramerate:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 22
    .line 23
    const-string v3, "MaintainQuality"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->MaintainQuality:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 32
    .line 33
    const-string v4, "Balance"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->Balance:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->$VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 46
    .line 47
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
    iput p3, p0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static convertFromInt(I)Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->values()[Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    aget-object p0, v0, p0

    .line 6
    .line 7
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->$VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->value:I

    .line 2
    .line 3
    return p0
.end method
