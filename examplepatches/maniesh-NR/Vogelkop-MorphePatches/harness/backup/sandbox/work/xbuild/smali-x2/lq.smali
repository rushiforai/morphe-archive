.class public final enum Llq;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llq;

.field public static final enum b:Llq;

.field public static final enum c:Llq;

.field public static final enum d:Llq;

.field public static final synthetic e:[Llq;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Llq;

    const-string v1, "New"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llq;->a:Llq;

    new-instance v1, Llq;

    const-string v2, "Visible"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llq;->b:Llq;

    new-instance v2, Llq;

    const-string v3, "VisibleAndReplaceable"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Llq;->c:Llq;

    new-instance v3, Llq;

    const-string v4, "Replaced"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Llq;->d:Llq;

    filled-new-array {v0, v1, v2, v3}, [Llq;

    move-result-object v0

    sput-object v0, Llq;->e:[Llq;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llq;
    .registers 2

    const-class v0, Llq;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llq;

    return-object p0
.end method

.method public static values()[Llq;
    .registers 1

    sget-object v0, Llq;->e:[Llq;

    invoke-virtual {v0}, [Llq;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llq;

    return-object v0
.end method
