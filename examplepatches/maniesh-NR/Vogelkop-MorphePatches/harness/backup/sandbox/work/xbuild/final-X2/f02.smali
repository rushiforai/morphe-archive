.class public final enum Lf02;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lf02;

.field public static final enum b:Lf02;

.field public static final enum c:Lf02;

.field public static final enum d:Lf02;

.field public static final enum e:Lf02;

.field public static final synthetic f:[Lf02;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lf02;

    const-string v1, "FIRST_RESPONSE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lf02;->a:Lf02;

    new-instance v1, Lf02;

    const-string v2, "COMPLETE_RESPONSE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lf02;->b:Lf02;

    new-instance v2, Lf02;

    const-string v3, "FIRST_PRINT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lf02;->c:Lf02;

    new-instance v3, Lf02;

    const-string v4, "COMPLETE_PRINT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lf02;->d:Lf02;

    new-instance v4, Lf02;

    const-string v5, "STOPPED_CHAT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lf02;->e:Lf02;

    filled-new-array {v0, v1, v2, v3, v4}, [Lf02;

    move-result-object v0

    sput-object v0, Lf02;->f:[Lf02;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf02;
    .registers 2

    const-class v0, Lf02;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf02;

    return-object p0
.end method

.method public static values()[Lf02;
    .registers 1

    sget-object v0, Lf02;->f:[Lf02;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf02;

    return-object v0
.end method
