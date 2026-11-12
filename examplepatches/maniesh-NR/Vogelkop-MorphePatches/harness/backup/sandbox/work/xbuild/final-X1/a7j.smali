.class public final enum La7j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:La7j;

.field public static final enum b:La7j;

.field public static final enum c:La7j;

.field public static final synthetic d:[La7j;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, La7j;

    const-string v1, "BALANCED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, La7j;->a:La7j;

    new-instance v1, La7j;

    const-string v2, "ENHANCED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, La7j;->b:La7j;

    new-instance v2, La7j;

    const-string v3, "CUSTOM"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, La7j;->c:La7j;

    filled-new-array {v0, v1, v2}, [La7j;

    move-result-object v0

    sput-object v0, La7j;->d:[La7j;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)La7j;
    .registers 2

    const-class v0, La7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, La7j;

    return-object p0
.end method

.method public static values()[La7j;
    .registers 1

    sget-object v0, La7j;->d:[La7j;

    invoke-virtual {v0}, [La7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [La7j;

    return-object v0
.end method
