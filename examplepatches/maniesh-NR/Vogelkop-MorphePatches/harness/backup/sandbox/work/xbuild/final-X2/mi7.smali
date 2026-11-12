.class public final enum Lmi7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmi7;

.field public static final enum b:Lmi7;

.field public static final enum c:Lmi7;

.field public static final enum d:Lmi7;

.field public static final synthetic e:[Lmi7;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lmi7;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmi7;->a:Lmi7;

    new-instance v1, Lmi7;

    const-string v2, "ENTERING_ZONE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmi7;->b:Lmi7;

    new-instance v2, Lmi7;

    const-string v3, "LEAVING_ZONE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lmi7;->c:Lmi7;

    new-instance v3, Lmi7;

    const-string v4, "SLIDING"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lmi7;->d:Lmi7;

    filled-new-array {v0, v1, v2, v3}, [Lmi7;

    move-result-object v0

    sput-object v0, Lmi7;->e:[Lmi7;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmi7;
    .registers 2

    const-class v0, Lmi7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmi7;

    return-object p0
.end method

.method public static values()[Lmi7;
    .registers 1

    sget-object v0, Lmi7;->e:[Lmi7;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmi7;

    return-object v0
.end method
