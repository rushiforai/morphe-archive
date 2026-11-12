.class public final enum Lf0d;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lf0d;

.field public static final enum b:Lf0d;

.field public static final enum c:Lf0d;

.field public static final synthetic d:[Lf0d;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lf0d;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lf0d;->a:Lf0d;

    new-instance v1, Lf0d;

    const-string v2, "NO_REMOVED_RECORDS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lf0d;->b:Lf0d;

    new-instance v2, Lf0d;

    const-string v3, "DB_ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lf0d;->c:Lf0d;

    filled-new-array {v0, v1, v2}, [Lf0d;

    move-result-object v0

    sput-object v0, Lf0d;->d:[Lf0d;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf0d;
    .registers 2

    const-class v0, Lf0d;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf0d;

    return-object p0
.end method

.method public static values()[Lf0d;
    .registers 1

    sget-object v0, Lf0d;->d:[Lf0d;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf0d;

    return-object v0
.end method
