.class public final enum Lxj5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lxj5;

.field public static final enum c:Lxj5;

.field public static final enum d:Lxj5;

.field public static final enum e:Lxj5;

.field public static final enum f:Lxj5;

.field public static final enum g:Lxj5;

.field public static final enum h:Lxj5;

.field public static final synthetic i:[Lxj5;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lxj5;

    const/4 v1, 0x0

    const v2, 0x7f140481

    const-string v3, "COLOR_THEME"

    invoke-direct {v0, v3, v1, v2}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lxj5;->b:Lxj5;

    new-instance v1, Lxj5;

    const/4 v2, 0x1

    const v3, 0x7f14145c

    const-string v4, "WALLPAPER"

    invoke-direct {v1, v4, v2, v3}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lxj5;->c:Lxj5;

    new-instance v2, Lxj5;

    const/4 v3, 0x2

    const v4, 0x7f1410aa

    const-string v5, "START_PAGE"

    invoke-direct {v2, v5, v3, v4}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lxj5;->d:Lxj5;

    new-instance v3, Lxj5;

    const/4 v4, 0x3

    const v5, 0x7f141173

    const-string v6, "SPEED_DIALS"

    invoke-direct {v3, v6, v4, v5}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lxj5;->e:Lxj5;

    new-instance v4, Lxj5;

    const/4 v5, 0x4

    const v6, 0x7f140946

    const-string v7, "LIVE_SCORES"

    invoke-direct {v4, v7, v5, v6}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lxj5;->f:Lxj5;

    new-instance v5, Lxj5;

    const/4 v6, 0x5

    const v7, 0x7f140b34

    const-string v8, "NEWS_FEED"

    invoke-direct {v5, v8, v6, v7}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lxj5;->g:Lxj5;

    new-instance v6, Lxj5;

    const/4 v7, 0x6

    const v8, 0x7f1412bb

    const-string v9, "SEARCH_ENGINES"

    invoke-direct {v6, v9, v7, v8}, Lxj5;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lxj5;->h:Lxj5;

    filled-new-array/range {v0 .. v6}, [Lxj5;

    move-result-object v0

    sput-object v0, Lxj5;->i:[Lxj5;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lxj5;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxj5;
    .registers 2

    const-class v0, Lxj5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxj5;

    return-object p0
.end method

.method public static values()[Lxj5;
    .registers 1

    sget-object v0, Lxj5;->i:[Lxj5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxj5;

    return-object v0
.end method
