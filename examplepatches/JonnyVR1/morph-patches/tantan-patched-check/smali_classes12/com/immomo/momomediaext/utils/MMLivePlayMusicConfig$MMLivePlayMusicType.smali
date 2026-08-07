.class public final enum Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MMLivePlayMusicType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

.field public static final enum MMLivePlayMusicTypePlayout:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

.field public static final enum MMLivePlayMusicTypePlayoutAndPublish:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayout:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayoutAndPublish:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 2
    .line 3
    const-string v1, "MMLivePlayMusicTypePlayout"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayout:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 12
    .line 13
    const-string v1, "MMLivePlayMusicTypePlayoutAndPublish"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayoutAndPublish:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 20
    .line 21
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->$values()[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 26
    .line 27
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
    iput p3, p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->value:I

    .line 2
    .line 3
    return p0
.end method
