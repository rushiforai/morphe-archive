.class public final enum Lc8j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lc8j;

.field public static final enum b:Lc8j;

.field public static final enum c:Lc8j;

.field public static final enum d:Lc8j;

.field public static final enum e:Lc8j;

.field public static final synthetic f:[Lc8j;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lc8j;

    const-string v1, "SETTINGS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc8j;->a:Lc8j;

    new-instance v1, Lc8j;

    const-string v2, "SETTINGS_SEARCH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lc8j;->b:Lc8j;

    new-instance v2, Lc8j;

    const-string v3, "CUSTOMIZE_HOME_PAGE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lc8j;->c:Lc8j;

    new-instance v3, Lc8j;

    const-string v4, "WALLPAPER_DIALOG"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lc8j;->d:Lc8j;

    new-instance v4, Lc8j;

    const-string v5, "DEEP_LINK"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lc8j;->e:Lc8j;

    filled-new-array {v0, v1, v2, v3, v4}, [Lc8j;

    move-result-object v0

    sput-object v0, Lc8j;->f:[Lc8j;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc8j;
    .registers 2

    const-class v0, Lc8j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc8j;

    return-object p0
.end method

.method public static values()[Lc8j;
    .registers 1

    sget-object v0, Lc8j;->f:[Lc8j;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc8j;

    return-object v0
.end method
