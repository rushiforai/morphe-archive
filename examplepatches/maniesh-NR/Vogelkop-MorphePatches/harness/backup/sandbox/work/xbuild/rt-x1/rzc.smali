.class public final enum Lrzc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lrzc;

.field public static final enum b:Lrzc;

.field public static final enum c:Lrzc;

.field public static final enum d:Lrzc;

.field public static final synthetic e:[Lrzc;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lrzc;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lrzc;->a:Lrzc;

    new-instance v1, Lrzc;

    const-string v2, "CONSTRAINT_VIOLATION"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lrzc;->b:Lrzc;

    new-instance v2, Lrzc;

    const-string v3, "ENCRYPTION_SERVICE_VIOLATION"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lrzc;->c:Lrzc;

    new-instance v3, Lrzc;

    const-string v4, "DB_ERROR"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lrzc;->d:Lrzc;

    filled-new-array {v0, v1, v2, v3}, [Lrzc;

    move-result-object v0

    sput-object v0, Lrzc;->e:[Lrzc;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrzc;
    .registers 2

    const-class v0, Lrzc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrzc;

    return-object p0
.end method

.method public static values()[Lrzc;
    .registers 1

    sget-object v0, Lrzc;->e:[Lrzc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrzc;

    return-object v0
.end method
