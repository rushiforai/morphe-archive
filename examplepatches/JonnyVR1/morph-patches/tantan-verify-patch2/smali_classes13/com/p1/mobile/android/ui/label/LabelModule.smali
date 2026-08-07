.class public final enum Lcom/p1/mobile/android/ui/label/LabelModule;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/android/ui/label/LabelModule;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum ACCOUNT:Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum FEED:Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum LIVE:Lcom/p1/mobile/android/ui/label/LabelModule;

.field public static final enum UNKNOWN:Lcom/p1/mobile/android/ui/label/LabelModule;


# instance fields
.field private moduleKey:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->UNKNOWN:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/ui/label/LabelModule;->COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/android/ui/label/LabelModule;->LIVE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/android/ui/label/LabelModule;->FEED:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/android/ui/label/LabelModule;->ACCOUNT:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "UNKNOWN"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->UNKNOWN:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 13
    .line 14
    const-string v1, "COMMON"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 23
    .line 24
    const-string v1, "CORE"

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 33
    .line 34
    const-string v1, "LIVE"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->LIVE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 43
    .line 44
    const-string v1, "FEED"

    .line 45
    .line 46
    const/4 v3, 0x4

    .line 47
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->FEED:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 51
    .line 52
    new-instance v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 53
    .line 54
    const-string v1, "ACCOUNT"

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/android/ui/label/LabelModule;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->ACCOUNT:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/android/ui/label/LabelModule;->$values()[Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->$VALUES:[Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 67
    .line 68
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
    iput p3, p0, Lcom/p1/mobile/android/ui/label/LabelModule;->moduleKey:I

    .line 5
    .line 6
    return-void
.end method

.method public static getLabel(I)Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p0, v0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    const/4 v0, 0x2

    .line 13
    if-ne p0, v0, :cond_2

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->LIVE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const/4 v0, 0x3

    .line 19
    if-ne p0, v0, :cond_3

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->FEED:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_3
    const/4 v0, 0x4

    .line 25
    if-ne p0, v0, :cond_4

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->ACCOUNT:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_4
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->UNKNOWN:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 31
    .line 32
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->$VALUES:[Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/android/ui/label/LabelModule;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getModuleKey()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/ui/label/LabelModule;->moduleKey:I

    .line 2
    .line 3
    return p0
.end method
