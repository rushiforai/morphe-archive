.class public final enum Loy1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Loy1;

.field public static final enum b:Loy1;

.field public static final enum c:Loy1;

.field public static final synthetic d:[Loy1;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Loy1;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Loy1;->a:Loy1;

    new-instance v1, Loy1;

    const-string v2, "FAILED_TO_DECODE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Loy1;

    const-string v3, "IO_ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Loy1;->b:Loy1;

    new-instance v3, Loy1;

    const-string v4, "UNKNOWN"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Loy1;->c:Loy1;

    filled-new-array {v0, v1, v2, v3}, [Loy1;

    move-result-object v0

    sput-object v0, Loy1;->d:[Loy1;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Loy1;
    .registers 2

    const-class v0, Loy1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Loy1;

    return-object p0
.end method

.method public static values()[Loy1;
    .registers 1

    sget-object v0, Loy1;->d:[Loy1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Loy1;

    return-object v0
.end method
