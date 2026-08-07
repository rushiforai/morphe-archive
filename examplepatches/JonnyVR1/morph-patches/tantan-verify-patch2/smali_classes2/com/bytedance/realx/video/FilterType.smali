.class public final enum Lcom/bytedance/realx/video/FilterType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/FilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/FilterType;

.field public static final enum BOX:Lcom/bytedance/realx/video/FilterType;

.field public static final enum Bicubic:Lcom/bytedance/realx/video/FilterType;

.field public static final enum Bilinear:Lcom/bytedance/realx/video/FilterType;

.field public static final enum Origin:Lcom/bytedance/realx/video/FilterType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x9

    .line 5
    .line 6
    const-string v3, "Origin"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/bytedance/realx/video/FilterType;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 12
    .line 13
    new-instance v1, Lcom/bytedance/realx/video/FilterType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/16 v3, 0xa

    .line 17
    .line 18
    const-string v4, "Bilinear"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/bytedance/realx/video/FilterType;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/bytedance/realx/video/FilterType;->Bilinear:Lcom/bytedance/realx/video/FilterType;

    .line 24
    .line 25
    new-instance v2, Lcom/bytedance/realx/video/FilterType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const/16 v4, 0xb

    .line 29
    .line 30
    const-string v5, "Bicubic"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/bytedance/realx/video/FilterType;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/bytedance/realx/video/FilterType;->Bicubic:Lcom/bytedance/realx/video/FilterType;

    .line 36
    .line 37
    new-instance v3, Lcom/bytedance/realx/video/FilterType;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const/16 v5, 0xc

    .line 41
    .line 42
    const-string v6, "BOX"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/bytedance/realx/video/FilterType;-><init>(Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/bytedance/realx/video/FilterType;->BOX:Lcom/bytedance/realx/video/FilterType;

    .line 48
    .line 49
    filled-new-array {v0, v1, v2, v3}, [Lcom/bytedance/realx/video/FilterType;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/bytedance/realx/video/FilterType;->$VALUES:[Lcom/bytedance/realx/video/FilterType;

    .line 54
    .line 55
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
    iput p3, p0, Lcom/bytedance/realx/video/FilterType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/bytedance/realx/video/FilterType;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->BOX:Lcom/bytedance/realx/video/FilterType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->Bicubic:Lcom/bytedance/realx/video/FilterType;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->Bilinear:Lcom/bytedance/realx/video/FilterType;

    .line 14
    .line 15
    return-object p0

    .line 16
    nop

    .line 17
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/FilterType;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/FilterType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/FilterType;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/FilterType;->$VALUES:[Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/FilterType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/FilterType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toInt()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/FilterType;->value:I

    .line 2
    .line 3
    return p0
.end method
