.class public final enum Ldol;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ldol;

.field public static final enum b:Ldol;

.field public static final enum c:Ldol;

.field public static final enum d:Ldol;

.field public static final enum e:Ldol;

.field public static final synthetic f:[Ldol;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ldol;

    const-string v1, "SITE_ICON"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ldol;->a:Ldol;

    new-instance v1, Ldol;

    const-string v2, "SITE_IMAGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ldol;->b:Ldol;

    new-instance v2, Ldol;

    const-string v3, "SITE_IMAGE_SKIP_LOGOS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ldol;->c:Ldol;

    new-instance v3, Ldol;

    const-string v4, "SCREENSHOT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ldol;->d:Ldol;

    new-instance v4, Ldol;

    const-string v5, "WALLPAPER"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Ldol;->e:Ldol;

    filled-new-array {v0, v1, v2, v3, v4}, [Ldol;

    move-result-object v0

    sput-object v0, Ldol;->f:[Ldol;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldol;
    .registers 2

    const-class v0, Ldol;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldol;

    return-object p0
.end method

.method public static values()[Ldol;
    .registers 1

    sget-object v0, Ldol;->f:[Ldol;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldol;

    return-object v0
.end method
