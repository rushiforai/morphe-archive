.class public final enum Ltrc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ltrc;

.field public static final enum b:Ltrc;

.field public static final enum c:Ltrc;

.field public static final synthetic d:[Ltrc;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ltrc;

    const-string v1, "WAITING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltrc;->a:Ltrc;

    new-instance v1, Ltrc;

    const-string v2, "LOADED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ltrc;->b:Ltrc;

    new-instance v2, Ltrc;

    const-string v3, "ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ltrc;->c:Ltrc;

    filled-new-array {v0, v1, v2}, [Ltrc;

    move-result-object v0

    sput-object v0, Ltrc;->d:[Ltrc;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltrc;
    .registers 2

    const-class v0, Ltrc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltrc;

    return-object p0
.end method

.method public static values()[Ltrc;
    .registers 1

    sget-object v0, Ltrc;->d:[Ltrc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltrc;

    return-object v0
.end method
