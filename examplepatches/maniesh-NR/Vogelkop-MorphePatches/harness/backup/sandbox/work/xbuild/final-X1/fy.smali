.class public final enum Lfy;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lfy;

.field public static final enum b:Lfy;

.field public static final enum c:Lfy;

.field public static final synthetic d:[Lfy;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lfy;

    const-string v1, "BIG_CARD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lfy;->a:Lfy;

    new-instance v1, Lfy;

    const-string v2, "SMALL_CARD"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lfy;->b:Lfy;

    new-instance v2, Lfy;

    const-string v3, "MODAL_DIALOG"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lfy;->c:Lfy;

    filled-new-array {v0, v1, v2}, [Lfy;

    move-result-object v0

    sput-object v0, Lfy;->d:[Lfy;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfy;
    .registers 2

    const-class v0, Lfy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfy;

    return-object p0
.end method

.method public static values()[Lfy;
    .registers 1

    sget-object v0, Lfy;->d:[Lfy;

    invoke-virtual {v0}, [Lfy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfy;

    return-object v0
.end method
