.class public final enum Lvln;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lvln;

.field public static final enum b:Lvln;

.field public static final enum c:Lvln;

.field public static final enum d:Lvln;

.field public static final enum e:Lvln;

.field public static final enum f:Lvln;

.field public static final synthetic g:[Lvln;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lvln;

    const-string v1, "APPEARANCE_SETTINGS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lvln;->a:Lvln;

    new-instance v1, Lvln;

    const-string v2, "CUSTOMIZE_HOME_PAGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lvln;->b:Lvln;

    new-instance v2, Lvln;

    const-string v3, "WALLPAPER_ONBOARDING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lvln;->c:Lvln;

    new-instance v3, Lvln;

    const-string v4, "IN_APP"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lvln;->d:Lvln;

    new-instance v4, Lvln;

    const-string v5, "DEEP_LINK"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lvln;->e:Lvln;

    new-instance v5, Lvln;

    const-string v6, "WALLPAPER_LONGPRESS"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lvln;->f:Lvln;

    filled-new-array/range {v0 .. v5}, [Lvln;

    move-result-object v0

    sput-object v0, Lvln;->g:[Lvln;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvln;
    .registers 2

    const-class v0, Lvln;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvln;

    return-object p0
.end method

.method public static values()[Lvln;
    .registers 1

    sget-object v0, Lvln;->g:[Lvln;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvln;

    return-object v0
.end method
