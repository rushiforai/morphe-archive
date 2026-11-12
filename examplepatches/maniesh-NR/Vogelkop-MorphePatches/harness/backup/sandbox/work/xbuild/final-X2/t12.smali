.class public final enum Lt12;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lt12;

.field public static final enum b:Lt12;

.field public static final enum c:Lt12;

.field public static final enum d:Lt12;

.field public static final synthetic e:[Lt12;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lt12;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lt12;->a:Lt12;

    new-instance v1, Lt12;

    const-string v2, "FAILED_TO_DECODE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lt12;->b:Lt12;

    new-instance v2, Lt12;

    const-string v3, "IO_ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lt12;->c:Lt12;

    new-instance v3, Lt12;

    const-string v4, "UNKNOWN"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lt12;->d:Lt12;

    filled-new-array {v0, v1, v2, v3}, [Lt12;

    move-result-object v0

    sput-object v0, Lt12;->e:[Lt12;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lt12;
    .registers 2

    const-class v0, Lt12;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lt12;

    return-object p0
.end method

.method public static values()[Lt12;
    .registers 1

    sget-object v0, Lt12;->e:[Lt12;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lt12;

    return-object v0
.end method
