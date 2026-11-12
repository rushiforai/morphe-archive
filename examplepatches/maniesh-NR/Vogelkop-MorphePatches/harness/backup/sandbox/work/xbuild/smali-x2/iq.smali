.class public final enum Liq;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Liq;

.field public static final enum b:Liq;

.field public static final enum c:Liq;

.field public static final synthetic d:[Liq;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Liq;

    const-string v1, "FEED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Liq;->a:Liq;

    new-instance v1, Liq;

    const-string v2, "INTERSTITIAL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Liq;->b:Liq;

    new-instance v2, Liq;

    const-string v3, "MASTHEAD"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Liq;->c:Liq;

    filled-new-array {v0, v1, v2}, [Liq;

    move-result-object v0

    sput-object v0, Liq;->d:[Liq;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Liq;
    .registers 2

    const-class v0, Liq;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Liq;

    return-object p0
.end method

.method public static values()[Liq;
    .registers 1

    sget-object v0, Liq;->d:[Liq;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Liq;

    return-object v0
.end method
