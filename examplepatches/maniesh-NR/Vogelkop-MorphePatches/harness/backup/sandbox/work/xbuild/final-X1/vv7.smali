.class public final enum Lvv7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lvv7;

.field public static final enum b:Lvv7;

.field public static final enum c:Lvv7;

.field public static final enum d:Lvv7;

.field public static final synthetic e:[Lvv7;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lvv7;

    const-string v1, "GO_TO_WEBSITE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lvv7;->a:Lvv7;

    new-instance v1, Lvv7;

    const-string v2, "NONE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lvv7;->b:Lvv7;

    new-instance v2, Lvv7;

    const-string v3, "SEARCH_ENGINE_SEARCH"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lvv7;->c:Lvv7;

    new-instance v3, Lvv7;

    const-string v4, "SEARCH_ENGINE_SEARCH_AI_MODE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v4, Lvv7;

    const-string v5, "SUBMIT_TO_ARIA"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lvv7;->d:Lvv7;

    filled-new-array {v0, v1, v2, v3, v4}, [Lvv7;

    move-result-object v0

    sput-object v0, Lvv7;->e:[Lvv7;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvv7;
    .registers 2

    const-class v0, Lvv7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvv7;

    return-object p0
.end method

.method public static values()[Lvv7;
    .registers 1

    sget-object v0, Lvv7;->e:[Lvv7;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvv7;

    return-object v0
.end method
