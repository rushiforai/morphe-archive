.class public final enum Lo3i;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lo3i;

.field public static final enum c:Lo3i;

.field public static final enum d:Lo3i;

.field public static final enum e:Lo3i;

.field public static final enum f:Lo3i;

.field public static final synthetic g:[Lo3i;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lo3i;

    const/4 v1, 0x0

    const-string v2, "main_menu"

    const-string v3, "MAIN_MENU"

    invoke-direct {v0, v3, v1, v2}, Lo3i;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lo3i;->b:Lo3i;

    new-instance v1, Lo3i;

    const/4 v2, 0x1

    const-string v3, "deep_link"

    const-string v4, "DEEP_LINK"

    invoke-direct {v1, v4, v2, v3}, Lo3i;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lo3i;->c:Lo3i;

    new-instance v2, Lo3i;

    const/4 v3, 0x2

    const-string v4, "toolbar_shortcut"

    const-string v5, "TOOLBAR_SHORTCUT"

    invoke-direct {v2, v5, v3, v4}, Lo3i;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lo3i;->d:Lo3i;

    new-instance v3, Lo3i;

    const/4 v4, 0x3

    const-string v5, "wallpaper_gallery"

    const-string v6, "WALLPAPER_GALLERY"

    invoke-direct {v3, v6, v4, v5}, Lo3i;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lo3i;->e:Lo3i;

    new-instance v4, Lo3i;

    const/4 v5, 0x4

    const-string v6, "app_icon"

    const-string v7, "APP_ICON"

    invoke-direct {v4, v7, v5, v6}, Lo3i;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lo3i;->f:Lo3i;

    filled-new-array {v0, v1, v2, v3, v4}, [Lo3i;

    move-result-object v0

    sput-object v0, Lo3i;->g:[Lo3i;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lo3i;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lo3i;
    .registers 2

    const-class v0, Lo3i;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lo3i;

    return-object p0
.end method

.method public static values()[Lo3i;
    .registers 1

    sget-object v0, Lo3i;->g:[Lo3i;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lo3i;

    return-object v0
.end method
