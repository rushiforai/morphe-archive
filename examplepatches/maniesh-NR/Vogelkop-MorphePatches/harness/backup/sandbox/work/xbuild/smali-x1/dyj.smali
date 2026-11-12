.class public final enum Ldyj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ldyj;

.field public static final enum b:Ldyj;

.field public static final enum c:Ldyj;

.field public static final synthetic d:[Ldyj;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ldyj;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ldyj;->a:Ldyj;

    new-instance v1, Ldyj;

    const-string v2, "HEIGHT_COMPACT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ldyj;->b:Ldyj;

    new-instance v2, Ldyj;

    const-string v3, "GOOGLE_AI_MODE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ldyj;->c:Ldyj;

    filled-new-array {v0, v1, v2}, [Ldyj;

    move-result-object v0

    sput-object v0, Ldyj;->d:[Ldyj;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldyj;
    .registers 2

    const-class v0, Ldyj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldyj;

    return-object p0
.end method

.method public static values()[Ldyj;
    .registers 1

    sget-object v0, Ldyj;->d:[Ldyj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldyj;

    return-object v0
.end method
