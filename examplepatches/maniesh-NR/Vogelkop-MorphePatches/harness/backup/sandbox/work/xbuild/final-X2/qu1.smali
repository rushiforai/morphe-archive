.class public final enum Lqu1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lqu1;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Lqu1;

    const-string v1, "WALLPAPER"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lqu1;

    const-string v2, "FORCE_DARK_WEB_PAGE"

    const/4 v4, 0x3

    invoke-direct {v1, v2, v3, v4}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lqu1;

    const-string v3, "SHOW_TAB_BAR"

    const/4 v5, 0x2

    const/4 v6, 0x4

    invoke-direct {v2, v3, v5, v6}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lqu1;

    const-string v5, "ADDRESS_BAR"

    const/4 v7, 0x5

    invoke-direct {v3, v5, v4, v7}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lqu1;

    const-string v5, "TOOLBARS"

    const/4 v8, 0x6

    invoke-direct {v4, v5, v6, v8}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lqu1;

    const-string v6, "THEME"

    const/4 v9, 0x7

    invoke-direct {v5, v6, v7, v9}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lqu1;

    const-string v7, "APP_ICON"

    const/16 v10, 0x8

    invoke-direct {v6, v7, v8, v10}, Lqu1;-><init>(Ljava/lang/String;II)V

    new-instance v7, Lqu1;

    const-string v8, "APP_FONT"

    const/16 v10, 0x9

    invoke-direct {v7, v8, v9, v10}, Lqu1;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v7}, [Lqu1;

    move-result-object v0

    sput-object v0, Lqu1;->a:[Lqu1;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lqu1;
    .registers 2

    const-class v0, Lqu1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lqu1;

    return-object p0
.end method

.method public static values()[Lqu1;
    .registers 1

    sget-object v0, Lqu1;->a:[Lqu1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lqu1;

    return-object v0
.end method
