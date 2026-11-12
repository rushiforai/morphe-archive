.class public final enum Lmnj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmnj;

.field public static final enum b:Lmnj;

.field public static final enum c:Lmnj;

.field public static final synthetic d:[Lmnj;

.field public static final synthetic e:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lmnj;

    const-string v1, "BOOKMARK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmnj;->a:Lmnj;

    new-instance v1, Lmnj;

    const-string v2, "PASSWORD"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmnj;->b:Lmnj;

    new-instance v2, Lmnj;

    const-string v3, "SPEED_DIAL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lmnj;->c:Lmnj;

    filled-new-array {v0, v1, v2}, [Lmnj;

    move-result-object v0

    sput-object v0, Lmnj;->d:[Lmnj;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lmnj;->e:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmnj;
    .registers 2

    const-class v0, Lmnj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmnj;

    return-object p0
.end method

.method public static values()[Lmnj;
    .registers 1

    sget-object v0, Lmnj;->d:[Lmnj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmnj;

    return-object v0
.end method
