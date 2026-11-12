.class public final enum Lux1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lux1;

.field public static final enum b:Lux1;

.field public static final enum c:Lux1;

.field public static final synthetic d:[Lux1;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lux1;

    const-string v1, "USER_PICKED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lux1;->a:Lux1;

    new-instance v1, Lux1;

    const-string v2, "ASK_ARIA"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lux1;->b:Lux1;

    new-instance v2, Lux1;

    const-string v3, "CONVERSATION_CHIP"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lux1;->c:Lux1;

    filled-new-array {v0, v1, v2}, [Lux1;

    move-result-object v0

    sput-object v0, Lux1;->d:[Lux1;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lux1;
    .registers 2

    const-class v0, Lux1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lux1;

    return-object p0
.end method

.method public static values()[Lux1;
    .registers 1

    sget-object v0, Lux1;->d:[Lux1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lux1;

    return-object v0
.end method
