.class public final enum Lbp9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lbp9;

.field public static final enum b:Lbp9;

.field public static final enum c:Lbp9;

.field public static final enum d:Lbp9;

.field public static final synthetic e:[Lbp9;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lbp9;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbp9;->a:Lbp9;

    new-instance v1, Lbp9;

    const-string v2, "ELIGIBLE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbp9;->b:Lbp9;

    new-instance v2, Lbp9;

    const-string v3, "ALREADY_CLAIMED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lbp9;->c:Lbp9;

    new-instance v3, Lbp9;

    const-string v4, "NOT_COVERED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lbp9;->d:Lbp9;

    filled-new-array {v0, v1, v2, v3}, [Lbp9;

    move-result-object v0

    sput-object v0, Lbp9;->e:[Lbp9;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbp9;
    .registers 2

    const-class v0, Lbp9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbp9;

    return-object p0
.end method

.method public static values()[Lbp9;
    .registers 1

    sget-object v0, Lbp9;->e:[Lbp9;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbp9;

    return-object v0
.end method
