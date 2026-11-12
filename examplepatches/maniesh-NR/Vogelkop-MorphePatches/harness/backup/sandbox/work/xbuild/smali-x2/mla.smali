.class public final enum Lmla;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmla;

.field public static final synthetic b:[Lmla;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lmla;

    const-string v1, "UNDEFINED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lmla;

    const-string v2, "TEXT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmla;->a:Lmla;

    new-instance v2, Lmla;

    const-string v3, "VOICE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Lmla;

    move-result-object v0

    sput-object v0, Lmla;->b:[Lmla;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmla;
    .registers 2

    const-class v0, Lmla;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmla;

    return-object p0
.end method

.method public static values()[Lmla;
    .registers 1

    sget-object v0, Lmla;->b:[Lmla;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmla;

    return-object v0
.end method
