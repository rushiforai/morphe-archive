.class public final enum Lwln;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lwln;

.field public static final enum b:Lwln;

.field public static final enum c:Lwln;

.field public static final enum d:Lwln;

.field public static final enum e:Lwln;

.field public static final enum f:Lwln;

.field public static final enum g:Lwln;

.field public static final enum h:Lwln;

.field public static final synthetic i:[Lwln;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lwln;

    const-string v1, "WALLPAPER_GALLERY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lwln;->a:Lwln;

    new-instance v1, Lwln;

    const-string v2, "CUSTOMIZE_HOME_PAGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lwln;->b:Lwln;

    new-instance v2, Lwln;

    const-string v3, "WALLPAPER_LONGPRESS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lwln;->c:Lwln;

    new-instance v3, Lwln;

    const-string v4, "IMAGE_MENU_SHEET"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lwln;->d:Lwln;

    new-instance v4, Lwln;

    const-string v5, "FAVORITES_GALLERY"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lwln;->e:Lwln;

    new-instance v5, Lwln;

    const-string v6, "MY_PHOTOS_GALLERY"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lwln;->f:Lwln;

    new-instance v6, Lwln;

    const-string v7, "STORE"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lwln;->g:Lwln;

    new-instance v7, Lwln;

    const-string v8, "ARIA_IMAGE_MENU_SHEET"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lwln;->h:Lwln;

    filled-new-array/range {v0 .. v7}, [Lwln;

    move-result-object v0

    sput-object v0, Lwln;->i:[Lwln;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwln;
    .registers 2

    const-class v0, Lwln;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwln;

    return-object p0
.end method

.method public static values()[Lwln;
    .registers 1

    sget-object v0, Lwln;->i:[Lwln;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwln;

    return-object v0
.end method
