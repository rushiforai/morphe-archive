.class public final Lwoc;
.super Lwbh;
.source "SourceFile"


# instance fields
.field public final r:Lnrl;

.field public final s:Landroid/content/res/Resources;

.field public final t:Ljoc;

.field public final u:Landroid/net/Uri;

.field public final v:Landroid/net/Uri;

.field public w:Landroid/graphics/Bitmap;

.field public x:Landroid/graphics/Bitmap;

.field public final y:Lw1f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V
    .registers 10

    invoke-direct/range {p0 .. p5}, Lwbh;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lwoc;->s:Landroid/content/res/Resources;

    new-instance p2, Lnrl;

    const-string p3, "news_icon_fetch_failed"

    invoke-virtual {p4, p3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p3

    invoke-direct {p2, p1, p3}, Lnrl;-><init>(Ljava/lang/Object;Z)V

    iput-object p2, p0, Lwoc;->r:Lnrl;

    const-string p1, "home_team_logo"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 p3, 0x0

    if-nez p2, :cond_2c

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_2d

    :cond_2c
    move-object p1, p3

    :goto_2d
    iput-object p1, p0, Lwoc;->u:Landroid/net/Uri;

    const-string p1, "away_team_logo"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_40

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_41

    :cond_40
    move-object p1, p3

    :goto_41
    iput-object p1, p0, Lwoc;->v:Landroid/net/Uri;

    const-string p1, "match_id"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_90

    const-wide/16 v0, -0x1

    invoke-virtual {p4, p1, v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p2, v2, v0

    if-eqz p2, :cond_8a

    const-string p1, "match_type"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_84

    :try_start_61
    invoke-static {p2}, Lzi4;->M(Ljava/lang/String;)Lapc;

    move-result-object p1
    :try_end_65
    .catch Ljava/lang/IllegalArgumentException; {:try_start_61 .. :try_end_65} :catch_7c

    new-instance p2, Ljoc;

    invoke-direct {p2, v2, v3, p1}, Ljoc;-><init>(JLapc;)V

    iput-object p2, p0, Lwoc;->t:Ljoc;

    new-instance p1, Lw1f;

    invoke-static {p2}, Lsgb;->v(Ljoc;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2}, Lsgb;->t(Ljoc;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p3, p2}, Lw1f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lwoc;->y:Lw1f;

    return-void

    :catch_7c
    move-exception v0

    move-object p0, v0

    new-instance p2, Ldjb;

    invoke-direct {p2, p1, p0}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :cond_84
    new-instance p0, Ldjb;

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8a
    new-instance p0, Ldjb;

    invoke-direct {p0, p1, p3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_90
    new-instance p0, Ldjb;

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final a()V
    .registers 5

    const/high16 v0, 0x42000000    # 32.0f

    iget-object v1, p0, Lwoc;->s:Landroid/content/res/Resources;

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    const/4 v1, 0x0

    iget-object v2, p0, Lwoc;->r:Lnrl;

    iget-object v3, p0, Lwoc;->u:Landroid/net/Uri;

    if-eqz v3, :cond_14

    invoke-virtual {v2, v3, v0, v0}, Lnrl;->l(Landroid/net/Uri;II)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_15

    :cond_14
    move-object v3, v1

    :goto_15
    iput-object v3, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lwoc;->v:Landroid/net/Uri;

    if-eqz v3, :cond_1f

    invoke-virtual {v2, v3, v0, v0}, Lnrl;->l(Landroid/net/Uri;II)Landroid/graphics/Bitmap;

    move-result-object v1

    :cond_1f
    iput-object v1, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    return-void
.end method

.method public final b()Ljava/lang/Boolean;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()Lua7;
    .registers 9

    invoke-super {p0}, Lwbh;->d()Lua7;

    move-result-object v0

    iget-object v1, p0, Lwbh;->g:Ljava/lang/String;

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    new-instance v3, Lg1f;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ln1f;-><init>(B)V

    invoke-static {v1}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v3, Lg1f;->e:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ll1f;->j(Ln1f;)V

    iget-object v1, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    if-eqz v1, :cond_73

    iget-object v4, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_73

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v4, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ne v1, v4, :cond_73

    iget-object v1, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v4, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ne v1, v4, :cond_73

    iget-object v1, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v4, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v1, v4, :cond_73

    iget-object v1, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v4, v1

    const v5, 0x3f19999a    # 0.6f

    mul-float/2addr v5, v4

    float-to-int v4, v5

    add-int/2addr v4, v1

    sub-int v1, v4, v1

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v4, v5}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_73

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v6, p0, Lwoc;->w:Landroid/graphics/Bitmap;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v7, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    iget-object p0, p0, Lwoc;->x:Landroid/graphics/Bitmap;

    int-to-float v1, v1

    invoke-virtual {v5, p0, v1, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    move-object v3, v4

    :cond_73
    if-nez v3, :cond_76

    return-object v0

    :cond_76
    invoke-virtual {v2, v3}, Ll1f;->i(Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method public final i()Lzn0;
    .registers 2

    iget-object p0, p0, Lwoc;->t:Ljoc;

    iget-object p0, p0, Ljoc;->b:Lapc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_17

    const/4 v0, 0x1

    if-ne p0, v0, :cond_10

    sget-object p0, Lzn0;->l:Lzn0;

    return-object p0

    :cond_10
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_17
    sget-object p0, Lzn0;->j:Lzn0;

    return-object p0
.end method

.method public final n()Lw1f;
    .registers 1

    iget-object p0, p0, Lwoc;->y:Lw1f;

    return-object p0
.end method

.method public final q(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    const-string p0, "title"

    const-string v0, ""

    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final r(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 2

    const-string p0, "news_header_title"

    invoke-virtual {p1, p0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final s(JZ)V
    .registers 11

    invoke-super {p0, p1, p2, p3}, Lwbh;->s(JZ)V

    invoke-virtual {p0}, Lwoc;->i()Lzn0;

    move-result-object p1

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object p2

    iget-object v2, p0, Lwbh;->k:Ljava/lang/String;

    sget-object p3, Lhd;->h:Lhd;

    if-nez p3, :cond_12

    return-void

    :cond_12
    sget-object v0, Lyn0;->f:Lyn0;

    if-ne v0, p2, :cond_26

    sget-object p2, Lzn0;->d:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->e:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->j:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->l:Lzn0;

    if-eq p1, p2, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    new-instance v0, Lgse;

    const-string v1, "firebase"

    iget-object v3, p0, Lwbh;->l:Ljava/lang/String;

    const-string v4, "click"

    invoke-direct/range {v0 .. v6}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v0

    :goto_38
    invoke-virtual {p3, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public final u()V
    .registers 11

    invoke-super {p0}, Lwbh;->u()V

    invoke-virtual {p0}, Lwoc;->i()Lzn0;

    move-result-object v0

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object v1

    iget-object v4, p0, Lwbh;->k:Ljava/lang/String;

    sget-object v9, Lhd;->h:Lhd;

    if-nez v9, :cond_12

    return-void

    :cond_12
    sget-object v2, Lyn0;->f:Lyn0;

    if-ne v2, v1, :cond_26

    sget-object v1, Lzn0;->d:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->e:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->j:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->l:Lzn0;

    if-eq v0, v1, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    new-instance v2, Lgse;

    const-string v3, "firebase"

    iget-object v5, p0, Lwbh;->l:Ljava/lang/String;

    const-string v6, "receive"

    invoke-direct/range {v2 .. v8}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v2

    :goto_38
    invoke-virtual {v9, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public final v(Z)V
    .registers 11

    invoke-super {p0, p1}, Lwbh;->v(Z)V

    invoke-virtual {p0}, Lwoc;->i()Lzn0;

    move-result-object p1

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object v0

    iget-object v3, p0, Lwbh;->k:Ljava/lang/String;

    sget-object v8, Lhd;->h:Lhd;

    if-nez v8, :cond_12

    return-void

    :cond_12
    sget-object v1, Lyn0;->f:Lyn0;

    if-ne v1, v0, :cond_26

    sget-object v0, Lzn0;->d:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->e:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->j:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->l:Lzn0;

    if-eq p1, v0, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    new-instance v1, Lgse;

    const-string v2, "firebase"

    iget-object v4, p0, Lwbh;->l:Ljava/lang/String;

    const-string v5, "show"

    invoke-direct/range {v1 .. v7}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v1

    :goto_38
    invoke-virtual {v8, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public final w()Z
    .registers 5

    iget-object v0, p0, Lwbh;->a:Landroid/content/Context;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnh;

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Lwnh;->b(I)Z

    move-result v1

    sget-object v2, Lvn0;->s:Lvn0;

    const/4 v3, 0x1

    if-nez v1, :cond_1b

    invoke-virtual {p0, v2}, Lwbh;->t(Lvn0;)V

    return v3

    :cond_1b
    iget-object v1, p0, Lwoc;->t:Ljoc;

    iget-object v1, v1, Ljoc;->b:Lapc;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_32

    if-ne v1, v3, :cond_2b

    invoke-virtual {p0, v2}, Lwbh;->t(Lvn0;)V

    return v3

    :cond_2b
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_32
    const-string v1, "livescore"

    invoke-static {v0, v1}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v3, :cond_40

    sget-object v0, Lvn0;->q:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    return v3

    :cond_40
    sget-object v1, Lloc;->c:Lnx1;

    invoke-virtual {v1, v0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lloc;

    iget-object v1, p0, Lwbh;->l:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lloc;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_56

    sget-object v0, Lvn0;->i:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    return v3

    :cond_56
    const/4 p0, 0x0

    return p0
.end method
