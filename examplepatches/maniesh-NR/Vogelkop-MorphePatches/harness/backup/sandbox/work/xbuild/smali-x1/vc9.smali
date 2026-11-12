.class public final enum Lvc9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lvc9;

.field public static final synthetic b:[Lvc9;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lvc9;

    const-string v1, "NO_FAILURE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lvc9;->a:Lvc9;

    new-instance v1, Lvc9;

    const-string v2, "PASSIVE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1}, [Lvc9;

    move-result-object v0

    sput-object v0, Lvc9;->b:[Lvc9;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvc9;
    .registers 2

    const-class v0, Lvc9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvc9;

    return-object p0
.end method

.method public static values()[Lvc9;
    .registers 1

    sget-object v0, Lvc9;->b:[Lvc9;

    invoke-virtual {v0}, [Lvc9;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvc9;

    return-object v0
.end method
