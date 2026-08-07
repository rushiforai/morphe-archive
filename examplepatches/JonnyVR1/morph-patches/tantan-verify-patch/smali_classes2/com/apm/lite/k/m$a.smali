.class final enum Lcom/apm/lite/k/m$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apm/lite/k/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/apm/lite/k/m$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/apm/lite/k/m$a;

.field public static final enum b:Lcom/apm/lite/k/m$a;

.field public static final enum c:Lcom/apm/lite/k/m$a;

.field public static final enum d:Lcom/apm/lite/k/m$a;

.field public static final enum e:Lcom/apm/lite/k/m$a;

.field public static final enum f:Lcom/apm/lite/k/m$a;

.field private static final synthetic g:[Lcom/apm/lite/k/m$a;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/apm/lite/k/m$a;

    const-string v1, "EMPTY_ARRAY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/apm/lite/k/m$a;->a:Lcom/apm/lite/k/m$a;

    new-instance v1, Lcom/apm/lite/k/m$a;

    const-string v2, "NONEMPTY_ARRAY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/apm/lite/k/m$a;->b:Lcom/apm/lite/k/m$a;

    new-instance v2, Lcom/apm/lite/k/m$a;

    const-string v3, "EMPTY_OBJECT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/apm/lite/k/m$a;->c:Lcom/apm/lite/k/m$a;

    new-instance v3, Lcom/apm/lite/k/m$a;

    const-string v4, "DANGLING_KEY"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/apm/lite/k/m$a;->d:Lcom/apm/lite/k/m$a;

    new-instance v4, Lcom/apm/lite/k/m$a;

    const-string v5, "NONEMPTY_OBJECT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/apm/lite/k/m$a;->e:Lcom/apm/lite/k/m$a;

    new-instance v5, Lcom/apm/lite/k/m$a;

    const-string v6, "NULL"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Lcom/apm/lite/k/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/apm/lite/k/m$a;->f:Lcom/apm/lite/k/m$a;

    filled-new-array/range {v0 .. v5}, [Lcom/apm/lite/k/m$a;

    move-result-object v0

    sput-object v0, Lcom/apm/lite/k/m$a;->g:[Lcom/apm/lite/k/m$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/apm/lite/k/m$a;
    .locals 1

    const-class v0, Lcom/apm/lite/k/m$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/apm/lite/k/m$a;

    return-object p0
.end method

.method public static values()[Lcom/apm/lite/k/m$a;
    .locals 1

    sget-object v0, Lcom/apm/lite/k/m$a;->g:[Lcom/apm/lite/k/m$a;

    invoke-virtual {v0}, [Lcom/apm/lite/k/m$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/apm/lite/k/m$a;

    return-object v0
.end method
