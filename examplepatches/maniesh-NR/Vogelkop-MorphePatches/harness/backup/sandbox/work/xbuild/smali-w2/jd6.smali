.class public final enum Ljd6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ljd6;

.field public static final enum b:Ljd6;

.field public static final enum c:Ljd6;

.field public static final synthetic d:[Ljd6;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljd6;

    const-string v1, "INIT_TIMEOUT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljd6;->a:Ljd6;

    new-instance v1, Ljd6;

    const-string v2, "INIT_FAILED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ljd6;->b:Ljd6;

    new-instance v2, Ljd6;

    const-string v3, "CALLBACK_REPLACED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ljd6;->c:Ljd6;

    filled-new-array {v0, v1, v2}, [Ljd6;

    move-result-object v0

    sput-object v0, Ljd6;->d:[Ljd6;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljd6;
    .registers 2

    const-class v0, Ljd6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljd6;

    return-object p0
.end method

.method public static values()[Ljd6;
    .registers 1

    sget-object v0, Ljd6;->d:[Ljd6;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljd6;

    return-object v0
.end method
