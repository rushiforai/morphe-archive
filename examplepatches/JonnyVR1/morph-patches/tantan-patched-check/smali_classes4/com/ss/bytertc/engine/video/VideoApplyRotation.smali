.class public final enum Lcom/ss/bytertc/engine/video/VideoApplyRotation;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/video/VideoApplyRotation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/video/VideoApplyRotation;

.field public static final enum DEFAULT:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

.field public static final enum DEGREE_0:Lcom/ss/bytertc/engine/video/VideoApplyRotation;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "DEFAULT"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/ss/bytertc/engine/video/VideoApplyRotation;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->DEFAULT:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 13
    .line 14
    const-string v2, "DEGREE_0"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v1, v2, v4, v3}, Lcom/ss/bytertc/engine/video/VideoApplyRotation;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->DEGREE_0:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->$VALUES:[Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 27
    .line 28
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
    iput p3, p0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static convertFromInt(I)Lcom/ss/bytertc/engine/video/VideoApplyRotation;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    sget-object p0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->DEGREE_0:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string v0, "VideoApplyRotation enum value invalidate: "

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->DEFAULT:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 17
    .line 18
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/video/VideoApplyRotation;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/video/VideoApplyRotation;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->$VALUES:[Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/video/VideoApplyRotation;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->value:I

    .line 2
    .line 3
    return p0
.end method
