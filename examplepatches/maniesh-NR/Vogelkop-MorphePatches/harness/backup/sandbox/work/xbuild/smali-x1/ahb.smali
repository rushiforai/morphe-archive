.class public final enum Lahb;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lahb;

.field public static final enum b:Lahb;

.field public static final enum c:Lahb;

.field public static final synthetic d:[Lahb;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lahb;

    const-string v1, "STATIC"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lahb;->a:Lahb;

    new-instance v1, Lahb;

    const-string v2, "MANUAL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lahb;->b:Lahb;

    new-instance v2, Lahb;

    const-string v3, "SKIP"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lahb;->c:Lahb;

    filled-new-array {v0, v1, v2}, [Lahb;

    move-result-object v0

    sput-object v0, Lahb;->d:[Lahb;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lahb;
    .registers 2

    const-class v0, Lahb;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lahb;

    return-object p0
.end method

.method public static values()[Lahb;
    .registers 1

    sget-object v0, Lahb;->d:[Lahb;

    invoke-virtual {v0}, [Lahb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lahb;

    return-object v0
.end method
