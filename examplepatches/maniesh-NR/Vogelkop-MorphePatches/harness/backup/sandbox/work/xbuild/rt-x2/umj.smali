.class public final enum Lumj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lumj;

.field public static final enum b:Lumj;

.field public static final enum c:Lumj;

.field public static final enum d:Lumj;

.field public static final synthetic e:[Lumj;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lumj;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lumj;->a:Lumj;

    new-instance v1, Lumj;

    const-string v2, "FAVORITE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lumj;->b:Lumj;

    new-instance v2, Lumj;

    const-string v3, "CIRCLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lumj;->c:Lumj;

    new-instance v3, Lumj;

    const-string v4, "SQUIRCLE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lumj;->d:Lumj;

    filled-new-array {v0, v1, v2, v3}, [Lumj;

    move-result-object v0

    sput-object v0, Lumj;->e:[Lumj;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lumj;
    .registers 2

    const-class v0, Lumj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lumj;

    return-object p0
.end method

.method public static values()[Lumj;
    .registers 1

    sget-object v0, Lumj;->e:[Lumj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lumj;

    return-object v0
.end method
