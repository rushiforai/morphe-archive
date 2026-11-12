.class public final enum Lz4m;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lz4m;

.field public static final synthetic c:[Lz4m;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lz4m;

    const-string v1, "OPERA"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lz4m;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lz4m;->b:Lz4m;

    new-instance v1, Lz4m;

    const-string v4, "SEARCH_ENGINE"

    invoke-direct {v1, v4, v3, v2}, Lz4m;-><init>(Ljava/lang/String;IZ)V

    filled-new-array {v0, v1}, [Lz4m;

    move-result-object v0

    sput-object v0, Lz4m;->c:[Lz4m;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lz4m;->a:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lz4m;
    .registers 2

    const-class v0, Lz4m;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lz4m;

    return-object p0
.end method

.method public static values()[Lz4m;
    .registers 1

    sget-object v0, Lz4m;->c:[Lz4m;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lz4m;

    return-object v0
.end method


# virtual methods
.method public final d(Lq6e;Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_25

    const/4 v0, 0x1

    if-ne p0, v0, :cond_20

    invoke-static {p1, p2}, Lp8f;->H(Lq6e;Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_1d

    sget-object p0, Lszb;->k:Lszb;

    invoke-static {p2}, Lybh;->h(Landroid/content/Context;)Lszb;

    move-result-object p1

    if-ne p1, p0, :cond_1a

    const-string p0, "\u042f\u043d\u0434\u0435\u043a\u0441"

    return-object p0

    :cond_1a
    const-string p0, "Yandex"

    return-object p0

    :cond_1d
    const-string p0, "Google"

    return-object p0

    :cond_20
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_25
    const-string p0, "Opera"

    return-object p0
.end method
