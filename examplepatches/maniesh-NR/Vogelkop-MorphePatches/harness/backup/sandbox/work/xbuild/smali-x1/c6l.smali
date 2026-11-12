.class public final enum Lc6l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lc6l;

.field public static final enum b:Lc6l;

.field public static final enum c:Lc6l;

.field public static final enum d:Lc6l;

.field public static final synthetic e:[Lc6l;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lc6l;

    const-string v1, "DRAG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc6l;->a:Lc6l;

    new-instance v1, Lc6l;

    const-string v2, "MOVE_ANIMATION"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lc6l;->b:Lc6l;

    new-instance v2, Lc6l;

    const-string v3, "SCROLL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lc6l;->c:Lc6l;

    new-instance v3, Lc6l;

    const-string v4, "SWIPE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lc6l;->d:Lc6l;

    filled-new-array {v0, v1, v2, v3}, [Lc6l;

    move-result-object v0

    sput-object v0, Lc6l;->e:[Lc6l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc6l;
    .registers 2

    const-class v0, Lc6l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc6l;

    return-object p0
.end method

.method public static values()[Lc6l;
    .registers 1

    sget-object v0, Lc6l;->e:[Lc6l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc6l;

    return-object v0
.end method
