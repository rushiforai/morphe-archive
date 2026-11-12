.class public final enum Lsu1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Lydp;

.field public static final synthetic d:[Lsu1;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 15

    new-instance v0, Lsu1;

    const-string v1, "theme"

    const v2, 0x7f0a0a13

    const-string v3, "THEME"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v1, Lsu1;

    const-string v2, "themeaccent"

    const v3, 0x7f0a0a12

    const-string v4, "THEME_ACCENT"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v2, Lsu1;

    const-string v3, "wallpaper"

    const v4, 0x7f0a0a1b

    const-string v5, "WALLPAPER"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v3, Lsu1;

    const-string v4, "nightmode"

    const v5, 0x7f0a09de

    const-string v6, "NIGHT_MODE"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v4, v5}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v4, Lsu1;

    const-string v5, "darkwebpages"

    const v6, 0x7f0a09c6

    const-string v7, "DARK_WEBPAGES"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v5, Lsu1;

    const-string v6, "tabbar"

    const v7, 0x7f0a09f7

    const-string v8, "TAB_BAR"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v6, v7}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v6, Lsu1;

    const-string v7, "addressbar"

    const v8, 0x7f0a099f

    const-string v9, "ADDRESS_BAR"

    const/4 v10, 0x6

    invoke-direct {v6, v9, v10, v7, v8}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v7, Lsu1;

    const-string v8, "scrollbehavior"

    const v9, 0x7f0a0a15

    const-string v10, "SCROLLING_BEHAVIOR"

    const/4 v11, 0x7

    invoke-direct {v7, v10, v11, v8, v9}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v8, Lsu1;

    const-string v9, "edittoolbar"

    const v10, 0x7f0a09aa

    const-string v11, "EDIT_TOOLBAR"

    const/16 v12, 0x8

    invoke-direct {v8, v11, v12, v9, v10}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v9, Lsu1;

    const-string v10, "accessibility"

    const v11, 0x7f0a0996

    const-string v12, "ACCESSIBILITY"

    const/16 v13, 0x9

    invoke-direct {v9, v12, v13, v10, v11}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v10, Lsu1;

    const-string v11, "gestures"

    const v12, 0x7f0a09c8

    const-string v13, "GESTURES"

    const/16 v14, 0xa

    invoke-direct {v10, v13, v14, v11, v12}, Lsu1;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    filled-new-array/range {v0 .. v10}, [Lsu1;

    move-result-object v0

    sput-object v0, Lsu1;->d:[Lsu1;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lsu1;->e:Lh58;

    new-instance v0, Lydp;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    sput-object v0, Lsu1;->c:Lydp;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lsu1;->a:Ljava/lang/String;

    iput p4, p0, Lsu1;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsu1;
    .registers 2

    const-class v0, Lsu1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsu1;

    return-object p0
.end method

.method public static values()[Lsu1;
    .registers 1

    sget-object v0, Lsu1;->d:[Lsu1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsu1;

    return-object v0
.end method
