.class public final enum Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

.field public static final enum OFF:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

.field public static final enum ON:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 2
    .line 3
    const-string v1, "ON"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->ON:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 13
    .line 14
    const-string v2, "OFF"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->OFF:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->$VALUES:[Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

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
    iput p3, p0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static convertFromInt(I)Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->OFF:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string v0, "VideoSinkMirrorType enum value invalidate: "

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->ON:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 18
    .line 19
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->$VALUES:[Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->value:I

    .line 2
    .line 3
    return p0
.end method
