.class public final enum Lx1f;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lx1f;

.field public static final enum b:Lx1f;

.field public static final enum c:Lx1f;

.field public static final enum d:Lx1f;

.field public static final synthetic e:[Lx1f;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lx1f;

    const-string v1, "SHOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lx1f;->a:Lx1f;

    new-instance v1, Lx1f;

    const-string v2, "DISABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lx1f;->b:Lx1f;

    new-instance v2, Lx1f;

    const-string v3, "REJECTED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lx1f;->c:Lx1f;

    new-instance v3, Lx1f;

    const-string v4, "CANNOT_SHOW_NOW"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lx1f;->d:Lx1f;

    filled-new-array {v0, v1, v2, v3}, [Lx1f;

    move-result-object v0

    sput-object v0, Lx1f;->e:[Lx1f;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lx1f;
    .registers 2

    const-class v0, Lx1f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lx1f;

    return-object p0
.end method

.method public static values()[Lx1f;
    .registers 1

    sget-object v0, Lx1f;->e:[Lx1f;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lx1f;

    return-object v0
.end method
