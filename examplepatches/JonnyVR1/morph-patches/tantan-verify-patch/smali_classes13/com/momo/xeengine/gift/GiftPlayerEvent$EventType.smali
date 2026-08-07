.class public final enum Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/GiftPlayerEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EventType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

.field public static final enum Downgrade:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

.field public static final enum Goto:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

.field public static final enum None:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 2
    .line 3
    const-string v1, "None"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->None:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 12
    .line 13
    const-string v2, "Goto"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->Goto:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    const/4 v4, 0x3

    .line 25
    const-string v5, "Downgrade"

    .line 26
    .line 27
    invoke-direct {v2, v5, v3, v4}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->Downgrade:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 31
    .line 32
    filled-new-array {v0, v1, v2}, [Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->$VALUES:[Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 37
    .line 38
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
    iput p3, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->values()[Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

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
    iget v4, v3, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->value:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->None:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->$VALUES:[Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->value:I

    .line 2
    .line 3
    return p0
.end method
