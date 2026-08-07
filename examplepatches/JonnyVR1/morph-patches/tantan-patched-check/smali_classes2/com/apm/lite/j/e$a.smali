.class public final enum Lcom/apm/lite/j/e$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apm/lite/j/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/apm/lite/j/e$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/apm/lite/j/e$a;

.field public static final enum b:Lcom/apm/lite/j/e$a;

.field public static final enum c:Lcom/apm/lite/j/e$a;

.field private static final synthetic e:[Lcom/apm/lite/j/e$a;


# instance fields
.field final d:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/apm/lite/j/e$a;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/apm/lite/j/e$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apm/lite/j/e$a;->a:Lcom/apm/lite/j/e$a;

    new-instance v1, Lcom/apm/lite/j/e$a;

    const-string v2, "GZIP"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lcom/apm/lite/j/e$a;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/apm/lite/j/e$a;->b:Lcom/apm/lite/j/e$a;

    new-instance v2, Lcom/apm/lite/j/e$a;

    const-string v3, "DEFLATER"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lcom/apm/lite/j/e$a;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/apm/lite/j/e$a;->c:Lcom/apm/lite/j/e$a;

    filled-new-array {v0, v1, v2}, [Lcom/apm/lite/j/e$a;

    move-result-object v0

    sput-object v0, Lcom/apm/lite/j/e$a;->e:[Lcom/apm/lite/j/e$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/apm/lite/j/e$a;->d:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/apm/lite/j/e$a;
    .locals 1

    const-class v0, Lcom/apm/lite/j/e$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/apm/lite/j/e$a;

    return-object p0
.end method

.method public static values()[Lcom/apm/lite/j/e$a;
    .locals 1

    sget-object v0, Lcom/apm/lite/j/e$a;->e:[Lcom/apm/lite/j/e$a;

    invoke-virtual {v0}, [Lcom/apm/lite/j/e$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/apm/lite/j/e$a;

    return-object v0
.end method
