.class public final enum Lsm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lsm;

.field public static final enum d:Lsm;

.field public static final enum e:Lsm;

.field public static final enum f:Lsm;

.field public static final enum g:Lsm;

.field public static final enum h:Lsm;

.field public static final synthetic i:[Lsm;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lsm;

    sget-object v1, Lfuo;->d:Lfuo;

    sget-object v2, Lfuo;->e:Lfuo;

    filled-new-array {v2, v1}, [Lfuo;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const-string v3, "NATIVE"

    const/4 v4, 0x0

    invoke-direct {v0, v4, v3, v2}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v0, Lsm;->c:Lsm;

    move-object v2, v1

    new-instance v1, Lsm;

    sget-object v3, Lfuo;->c:Lfuo;

    filled-new-array {v3, v2}, [Lfuo;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    const-string v5, "BANNER"

    const/4 v6, 0x1

    invoke-direct {v1, v6, v5, v4}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v1, Lsm;->d:Lsm;

    move-object v4, v2

    new-instance v2, Lsm;

    filled-new-array {v3, v4}, [Lfuo;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const-string v6, "INTERSTITIAL"

    const/4 v7, 0x2

    invoke-direct {v2, v7, v6, v5}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v2, Lsm;->e:Lsm;

    move-object v5, v3

    new-instance v3, Lsm;

    filled-new-array {v5, v4}, [Lfuo;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const-string v7, "REWARDED"

    const/4 v8, 0x3

    invoke-direct {v3, v8, v7, v6}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v3, Lsm;->f:Lsm;

    move-object v6, v4

    new-instance v4, Lsm;

    filled-new-array {v5, v6}, [Lfuo;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const-string v8, "REWARDED_INTERSTITIAL"

    const/4 v9, 0x4

    invoke-direct {v4, v9, v8, v7}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v4, Lsm;->g:Lsm;

    move-object v7, v5

    new-instance v5, Lsm;

    filled-new-array {v7, v6}, [Lfuo;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const-string v7, "APP_OPEN"

    const/4 v8, 0x5

    invoke-direct {v5, v8, v7, v6}, Lsm;-><init>(ILjava/lang/String;Ljava/util/List;)V

    sput-object v5, Lsm;->h:Lsm;

    filled-new-array/range {v0 .. v5}, [Lsm;

    move-result-object v0

    sput-object v0, Lsm;->i:[Lsm;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/util/List;)V
    .registers 4

    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lsm;->a:Ljava/util/List;

    new-instance p1, Lqm;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lqm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lsm;->b:Lzyk;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsm;
    .registers 2

    const-class v0, Lsm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsm;

    return-object p0
.end method

.method public static values()[Lsm;
    .registers 1

    sget-object v0, Lsm;->i:[Lsm;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsm;

    return-object v0
.end method


# virtual methods
.method public final d()Z
    .registers 3

    sget-object v0, Lpm;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_16

    const/4 v1, 0x2

    if-eq p0, v1, :cond_16

    const/4 v1, 0x3

    if-eq p0, v1, :cond_16

    const/4 v1, 0x4

    if-eq p0, v1, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    return v0
.end method
