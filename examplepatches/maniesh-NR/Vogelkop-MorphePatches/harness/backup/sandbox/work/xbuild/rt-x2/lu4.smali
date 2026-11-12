.class public final enum Llu4;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llu4;

.field public static final enum b:Llu4;

.field public static final enum c:Llu4;

.field public static final enum d:Llu4;

.field public static final synthetic e:[Llu4;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Llu4;

    const-string v1, "APP_DISCLAMER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llu4;->a:Llu4;

    new-instance v1, Llu4;

    const-string v2, "APP_RESPONSE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llu4;->b:Llu4;

    new-instance v2, Llu4;

    const-string v3, "USER"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Llu4;->c:Llu4;

    new-instance v3, Llu4;

    const-string v4, "ASSISTANT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Llu4;->d:Llu4;

    filled-new-array {v0, v1, v2, v3}, [Llu4;

    move-result-object v0

    sput-object v0, Llu4;->e:[Llu4;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llu4;
    .registers 2

    const-class v0, Llu4;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llu4;

    return-object p0
.end method

.method public static values()[Llu4;
    .registers 1

    sget-object v0, Llu4;->e:[Llu4;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llu4;

    return-object v0
.end method
