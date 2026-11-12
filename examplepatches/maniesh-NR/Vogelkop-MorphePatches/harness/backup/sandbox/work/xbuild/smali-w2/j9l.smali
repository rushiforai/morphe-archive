.class public final enum Lj9l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lj9l;

.field public static final enum b:Lj9l;

.field public static final enum c:Lj9l;

.field public static final enum d:Lj9l;

.field public static final synthetic e:[Lj9l;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lj9l;

    const-string v1, "SHOWING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lj9l;->a:Lj9l;

    new-instance v1, Lj9l;

    const-string v2, "ANIMATIONS_BEFORE_HIDING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lj9l;->b:Lj9l;

    new-instance v2, Lj9l;

    const-string v3, "HIDING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lj9l;->c:Lj9l;

    new-instance v3, Lj9l;

    const-string v4, "HIDDEN"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lj9l;->d:Lj9l;

    filled-new-array {v0, v1, v2, v3}, [Lj9l;

    move-result-object v0

    sput-object v0, Lj9l;->e:[Lj9l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lj9l;
    .registers 2

    const-class v0, Lj9l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lj9l;

    return-object p0
.end method

.method public static values()[Lj9l;
    .registers 1

    sget-object v0, Lj9l;->e:[Lj9l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lj9l;

    return-object v0
.end method
