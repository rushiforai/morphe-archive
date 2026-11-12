.class public final enum Lcom/leanplum/LeanplumLocationAccuracyType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/LeanplumLocationAccuracyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/LeanplumLocationAccuracyType;

.field public static final enum CELL:Lcom/leanplum/LeanplumLocationAccuracyType;

.field public static final enum GPS:Lcom/leanplum/LeanplumLocationAccuracyType;

.field public static final enum IP:Lcom/leanplum/LeanplumLocationAccuracyType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/leanplum/LeanplumLocationAccuracyType;

    const-string v1, "IP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/leanplum/LeanplumLocationAccuracyType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/leanplum/LeanplumLocationAccuracyType;->IP:Lcom/leanplum/LeanplumLocationAccuracyType;

    new-instance v1, Lcom/leanplum/LeanplumLocationAccuracyType;

    const-string v2, "CELL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lcom/leanplum/LeanplumLocationAccuracyType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/leanplum/LeanplumLocationAccuracyType;->CELL:Lcom/leanplum/LeanplumLocationAccuracyType;

    new-instance v2, Lcom/leanplum/LeanplumLocationAccuracyType;

    const-string v3, "GPS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lcom/leanplum/LeanplumLocationAccuracyType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/leanplum/LeanplumLocationAccuracyType;->GPS:Lcom/leanplum/LeanplumLocationAccuracyType;

    filled-new-array {v0, v1, v2}, [Lcom/leanplum/LeanplumLocationAccuracyType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/LeanplumLocationAccuracyType;->$VALUES:[Lcom/leanplum/LeanplumLocationAccuracyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/leanplum/LeanplumLocationAccuracyType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/LeanplumLocationAccuracyType;
    .registers 2

    const-class v0, Lcom/leanplum/LeanplumLocationAccuracyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/LeanplumLocationAccuracyType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/LeanplumLocationAccuracyType;
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumLocationAccuracyType;->$VALUES:[Lcom/leanplum/LeanplumLocationAccuracyType;

    invoke-virtual {v0}, [Lcom/leanplum/LeanplumLocationAccuracyType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/LeanplumLocationAccuracyType;

    return-object v0
.end method


# virtual methods
.method public value()I
    .registers 1

    iget p0, p0, Lcom/leanplum/LeanplumLocationAccuracyType;->value:I

    return p0
.end method
