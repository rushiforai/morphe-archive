.class public final enum Ldja;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ldja;

.field public static final synthetic c:[Ldja;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    new-instance v0, Ldja;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Ldja;->b:Ldja;

    new-instance v1, Ldja;

    const/4 v2, 0x1

    const-string v3, "copy"

    const-string v4, "COPY"

    invoke-direct {v1, v4, v2, v3}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Ldja;

    const/4 v3, 0x2

    const-string v4, "download"

    const-string v5, "DOWNLOAD"

    invoke-direct {v2, v5, v3, v4}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Ldja;

    const/4 v4, 0x3

    const-string v5, "share"

    const-string v6, "SHARE"

    invoke-direct {v3, v6, v4, v5}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Ldja;

    const/4 v5, 0x4

    const-string v6, "open_in_new_tab"

    const-string v7, "OPEN_IN_NEW_TAB"

    invoke-direct {v4, v7, v5, v6}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Ldja;

    const/4 v6, 0x5

    const-string v7, "set_wallpaper"

    const-string v8, "SET_WALLPAPER"

    invoke-direct {v5, v8, v6, v7}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Ldja;

    const/4 v7, 0x6

    const-string v8, "add_to_favorites"

    const-string v9, "ADD_TO_FAVORITES"

    invoke-direct {v6, v9, v7, v8}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v7, Ldja;

    const/4 v8, 0x7

    const-string v9, "tap_menu"

    const-string v10, "TAP_MENU"

    invoke-direct {v7, v10, v8, v9}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v8, Ldja;

    const/16 v9, 0x8

    const-string v10, "like"

    const-string v11, "LIKE"

    invoke-direct {v8, v11, v9, v10}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v9, Ldja;

    const/16 v10, 0x9

    const-string v11, "dislike"

    const-string v12, "DISLIKE"

    invoke-direct {v9, v12, v10, v11}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v10, Ldja;

    const/16 v11, 0xa

    const-string v12, "read_aloud"

    const-string v13, "READ_ALOUD"

    invoke-direct {v10, v13, v11, v12}, Ldja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v10}, [Ldja;

    move-result-object v0

    sput-object v0, Ldja;->c:[Ldja;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ldja;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldja;
    .registers 2

    const-class v0, Ldja;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldja;

    return-object p0
.end method

.method public static values()[Ldja;
    .registers 1

    sget-object v0, Ldja;->c:[Ldja;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldja;

    return-object v0
.end method
