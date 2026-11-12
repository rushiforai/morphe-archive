.class public final enum Lsf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lsf;

.field public static final enum b:Lsf;

.field public static final enum c:Lsf;

.field public static final synthetic d:[Lsf;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lsf;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsf;->a:Lsf;

    new-instance v1, Lsf;

    const-string v2, "VIABLE_TARGET"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lsf;->b:Lsf;

    new-instance v2, Lsf;

    const-string v3, "ACTIVE_TARGET"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lsf;->c:Lsf;

    filled-new-array {v0, v1, v2}, [Lsf;

    move-result-object v0

    sput-object v0, Lsf;->d:[Lsf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsf;
    .registers 2

    const-class v0, Lsf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsf;

    return-object p0
.end method

.method public static values()[Lsf;
    .registers 1

    sget-object v0, Lsf;->d:[Lsf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsf;

    return-object v0
.end method
