.class public final enum Lw0f;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lw0f;

.field public static final enum b:Lw0f;

.field public static final enum c:Lw0f;

.field public static final synthetic d:[Lw0f;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lw0f;

    const-string v1, "ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lw0f;->a:Lw0f;

    new-instance v1, Lw0f;

    const-string v2, "NONE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lw0f;->b:Lw0f;

    new-instance v2, Lw0f;

    const-string v3, "SOME"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lw0f;->c:Lw0f;

    filled-new-array {v0, v1, v2}, [Lw0f;

    move-result-object v0

    sput-object v0, Lw0f;->d:[Lw0f;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw0f;
    .registers 2

    const-class v0, Lw0f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw0f;

    return-object p0
.end method

.method public static values()[Lw0f;
    .registers 1

    sget-object v0, Lw0f;->d:[Lw0f;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw0f;

    return-object v0
.end method
