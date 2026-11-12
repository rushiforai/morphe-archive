.class public final Lgs1;
.super Lvf5;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006\u00b2\u0006\u000c\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"
    }
    d2 = {
        "Lgs1;",
        "Lvf5;",
        "<init>",
        "()V",
        "Lks1;",
        "state",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lvf5;-><init>()V

    new-instance v0, Lt2;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lgs1;->a:Lzyk;

    return-void
.end method


# virtual methods
.method public final g0(Lkotlin/jvm/functions/Function0;Lih5;I)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move/from16 v7, p3

    move-object/from16 v5, p2

    check-cast v5, Lvt9;

    const v1, -0x2d6b791

    invoke-virtual {v5, v1}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {v5, v4}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    const/4 v8, 0x4

    if-eqz v1, :cond_19

    move v1, v8

    goto :goto_1a

    :cond_19
    const/4 v1, 0x2

    :goto_1a
    or-int/2addr v1, v7

    invoke-virtual {v5, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v2

    const/16 v3, 0x20

    if-eqz v2, :cond_25

    move v2, v3

    goto :goto_27

    :cond_25
    const/16 v2, 0x10

    :goto_27
    or-int/2addr v1, v2

    and-int/lit8 v2, v1, 0x13

    const/16 v6, 0x12

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eq v2, v6, :cond_32

    move v2, v10

    goto :goto_33

    :cond_32
    move v2, v9

    :goto_33
    and-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6, v2}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_ae

    iget-object v2, v0, Lgs1;->a:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lms1;

    iget-object v6, v6, Lms1;->f:Lrlh;

    invoke-static {v6, v5}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v6

    invoke-interface {v6}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lks1;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lms1;

    invoke-virtual {v5, v13}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v5}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v11

    sget-object v12, Lhh5;->a:Lzpa;

    if-nez v2, :cond_66

    if-eq v11, v12, :cond_66

    move-object v2, v12

    goto :goto_7a

    :cond_66
    new-instance v11, Lr2;

    const/16 v17, 0x0

    const/16 v18, 0x9

    move-object v2, v12

    const/4 v12, 0x1

    const-class v14, Lms1;

    const-string v15, "select"

    const-string v16, "select(Lcom/opera/android/settings/SettingsManager$AppFont;)V"

    invoke-direct/range {v11 .. v18}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v5, v11}, Lvt9;->g0(Ljava/lang/Object;)V

    :goto_7a
    check-cast v11, Lmtb;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    and-int/lit8 v12, v1, 0x70

    if-eq v12, v3, :cond_84

    move v3, v9

    goto :goto_85

    :cond_84
    move v3, v10

    :goto_85
    and-int/lit8 v12, v1, 0xe

    if-ne v12, v8, :cond_8a

    move v9, v10

    :cond_8a
    or-int/2addr v3, v9

    invoke-virtual {v5}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    if-nez v3, :cond_93

    if-ne v9, v2, :cond_9d

    :cond_93
    new-instance v9, Lx2;

    const/16 v2, 0xf

    invoke-direct {v9, v0, v4, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v9}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_9d
    move-object v3, v9

    check-cast v3, Lkotlin/jvm/functions/Function0;

    shl-int/lit8 v1, v1, 0x9

    and-int/lit16 v1, v1, 0x1c00

    const/16 v2, 0x8

    or-int/2addr v2, v1

    move-object v1, v6

    move v6, v2

    move-object v2, v11

    invoke-static/range {v1 .. v6}, Laib;->a(Lks1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_b1

    :cond_ae
    invoke-virtual {v5}, Lvt9;->Q()V

    :goto_b1
    invoke-virtual {v5}, Lvt9;->r()Lznh;

    move-result-object v1

    if-eqz v1, :cond_be

    new-instance v2, Lfx0;

    invoke-direct {v2, v0, v4, v7, v8}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v2, v1, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_be
    return-void
.end method
