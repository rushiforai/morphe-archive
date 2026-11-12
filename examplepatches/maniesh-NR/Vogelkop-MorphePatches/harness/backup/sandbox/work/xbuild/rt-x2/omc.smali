.class public final enum Lomc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lomc;

.field public static final enum b:Lomc;

.field public static final synthetic c:[Lomc;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lomc;

    const-string v1, "ENABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lomc;->a:Lomc;

    new-instance v1, Lomc;

    const-string v2, "DISABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lomc;->b:Lomc;

    filled-new-array {v0, v1}, [Lomc;

    move-result-object v0

    sput-object v0, Lomc;->c:[Lomc;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lomc;
    .registers 2

    const-class v0, Lomc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lomc;

    return-object p0
.end method

.method public static values()[Lomc;
    .registers 1

    sget-object v0, Lomc;->c:[Lomc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lomc;

    return-object v0
.end method
