.class public final enum Losn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Losn;

.field public static final enum b:Losn;

.field public static final enum c:Losn;

.field public static final synthetic d:[Losn;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Losn;

    const-string v1, "HIDDEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Losn;->a:Losn;

    new-instance v1, Losn;

    const-string v2, "DISABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Losn;->b:Losn;

    new-instance v2, Losn;

    const-string v3, "ENABLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Losn;->c:Losn;

    filled-new-array {v0, v1, v2}, [Losn;

    move-result-object v0

    sput-object v0, Losn;->d:[Losn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Losn;
    .registers 2

    const-class v0, Losn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Losn;

    return-object p0
.end method

.method public static values()[Losn;
    .registers 1

    sget-object v0, Losn;->d:[Losn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Losn;

    return-object v0
.end method
