.class public final enum Ljf3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ljf3;

.field public static final enum b:Ljf3;

.field public static final enum c:Ljf3;

.field public static final synthetic d:[Ljf3;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljf3;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljf3;->a:Ljf3;

    new-instance v1, Ljf3;

    const-string v2, "CANCELLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ljf3;->b:Ljf3;

    new-instance v2, Ljf3;

    const-string v3, "FAILURE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ljf3;->c:Ljf3;

    filled-new-array {v0, v1, v2}, [Ljf3;

    move-result-object v0

    sput-object v0, Ljf3;->d:[Ljf3;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljf3;
    .registers 2

    const-class v0, Ljf3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljf3;

    return-object p0
.end method

.method public static values()[Ljf3;
    .registers 1

    sget-object v0, Ljf3;->d:[Ljf3;

    invoke-virtual {v0}, [Ljf3;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljf3;

    return-object v0
.end method
