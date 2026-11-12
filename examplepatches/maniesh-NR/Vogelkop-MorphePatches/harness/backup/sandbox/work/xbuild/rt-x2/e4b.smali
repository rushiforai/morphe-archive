.class public final enum Le4b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Le4b;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Le4b;

    const-string v1, "BUILD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Le4b;

    const-string v2, "DIALOG_NOT_SHOWN"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Le4b;

    const-string v3, "ALREADY_RATED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v3, Le4b;

    const-string v4, "NOT_ENOUGH_TIME"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2, v3}, [Le4b;

    move-result-object v0

    sput-object v0, Le4b;->a:[Le4b;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Le4b;
    .registers 2

    const-class v0, Le4b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Le4b;

    return-object p0
.end method

.method public static values()[Le4b;
    .registers 1

    sget-object v0, Le4b;->a:[Le4b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Le4b;

    return-object v0
.end method
