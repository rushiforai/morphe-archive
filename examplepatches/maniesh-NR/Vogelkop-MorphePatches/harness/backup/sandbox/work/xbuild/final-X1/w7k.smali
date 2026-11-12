.class public final enum Lw7k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lw7k;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Lw7k;

    const-string v1, "WALLPAPER"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw7k;

    const-string v2, "SUGGESTED_SITES"

    const/4 v4, 0x3

    invoke-direct {v1, v2, v3, v4}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw7k;

    const-string v3, "EXPLORE"

    const/4 v5, 0x2

    const/4 v6, 0x4

    invoke-direct {v2, v3, v5, v6}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lw7k;

    const-string v5, "LIVE_SCORES"

    const/4 v7, 0x5

    invoke-direct {v3, v5, v4, v7}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lw7k;

    const-string v5, "CUSTOMIZATION_SHORTCUT"

    const/16 v8, 0x8

    invoke-direct {v4, v5, v6, v8}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw7k;

    const-string v6, "OPERA_LOGO"

    const/16 v9, 0x9

    invoke-direct {v5, v6, v7, v9}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lw7k;

    const/4 v7, 0x6

    const/16 v10, 0xa

    const-string v11, "WEATHER"

    invoke-direct {v6, v11, v7, v10}, Lw7k;-><init>(Ljava/lang/String;II)V

    new-instance v7, Lw7k;

    const/4 v10, 0x7

    const/16 v11, 0xb

    const-string v12, "CONTINUE_BOOKING"

    invoke-direct {v7, v12, v10, v11}, Lw7k;-><init>(Ljava/lang/String;II)V

    move v10, v8

    new-instance v8, Lw7k;

    const-string v11, "SEARCH_SHORTCUTS"

    const/16 v12, 0xd

    invoke-direct {v8, v11, v10, v12}, Lw7k;-><init>(Ljava/lang/String;II)V

    move v10, v9

    new-instance v9, Lw7k;

    const-string v11, "SEARCH_SHORTCUTS_TABLET"

    const/16 v12, 0xe

    invoke-direct {v9, v11, v10, v12}, Lw7k;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v9}, [Lw7k;

    move-result-object v0

    sput-object v0, Lw7k;->a:[Lw7k;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw7k;
    .registers 2

    const-class v0, Lw7k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw7k;

    return-object p0
.end method

.method public static values()[Lw7k;
    .registers 1

    sget-object v0, Lw7k;->a:[Lw7k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw7k;

    return-object v0
.end method
