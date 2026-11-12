.class public final enum Lap7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lap7;

.field public static final enum b:Lap7;

.field public static final enum c:Lap7;

.field public static final synthetic d:[Lap7;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lap7;

    const-string v1, "INACTIVE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lap7;->a:Lap7;

    new-instance v1, Lap7;

    const-string v2, "INSTALLING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lap7;->b:Lap7;

    new-instance v2, Lap7;

    const-string v3, "INSTALLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lap7;->c:Lap7;

    filled-new-array {v0, v1, v2}, [Lap7;

    move-result-object v0

    sput-object v0, Lap7;->d:[Lap7;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lap7;
    .registers 2

    const-class v0, Lap7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lap7;

    return-object p0
.end method

.method public static values()[Lap7;
    .registers 1

    sget-object v0, Lap7;->d:[Lap7;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lap7;

    return-object v0
.end method
