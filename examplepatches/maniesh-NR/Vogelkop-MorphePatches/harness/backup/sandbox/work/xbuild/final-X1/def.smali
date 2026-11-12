.class public final enum Ldef;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ldef;

.field public static final enum b:Ldef;

.field public static final enum c:Ldef;

.field public static final enum d:Ldef;

.field public static final synthetic e:[Ldef;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ldef;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ldef;->a:Ldef;

    new-instance v1, Ldef;

    const-string v2, "UNKNOWN"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ldef;->b:Ldef;

    new-instance v2, Ldef;

    const-string v3, "FREE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ldef;->c:Ldef;

    new-instance v3, Ldef;

    const-string v4, "PAID"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ldef;->d:Ldef;

    filled-new-array {v0, v1, v2, v3}, [Ldef;

    move-result-object v0

    sput-object v0, Ldef;->e:[Ldef;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldef;
    .registers 2

    const-class v0, Ldef;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldef;

    return-object p0
.end method

.method public static values()[Ldef;
    .registers 1

    sget-object v0, Ldef;->e:[Ldef;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldef;

    return-object v0
.end method
