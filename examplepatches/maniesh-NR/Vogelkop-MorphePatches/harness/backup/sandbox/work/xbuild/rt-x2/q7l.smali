.class public final synthetic Lq7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lc8l;

.field public final synthetic c:Lx7l;

.field public final synthetic d:Lrg;


# direct methods
.method public synthetic constructor <init>(Lc8l;Lx7l;Lrg;B)V
    .registers 5

    iput-byte p4, p0, Lq7l;->a:B

    iput-object p1, p0, Lq7l;->b:Lc8l;

    iput-object p2, p0, Lq7l;->c:Lx7l;

    iput-object p3, p0, Lq7l;->d:Lrg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lq7l;->a:B

    iget-object v1, p0, Lq7l;->d:Lrg;

    iget-object v2, p0, Lq7l;->c:Lx7l;

    iget-object p0, p0, Lq7l;->b:Lc8l;

    packed-switch v0, :pswitch_data_b2

    check-cast p1, Lm7l;

    iget-object p0, p0, Lc8l;->h:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    if-eqz p1, :cond_1a

    new-instance p0, La8l;

    invoke-direct {p0, p1}, La8l;-><init>(Lm7l;)V

    goto :goto_1c

    :cond_1a
    sget-object p0, Lz7l;->a:Lz7l;

    :goto_1c
    invoke-virtual {v1, p0}, Lrg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22
    iget-object v0, v2, Lx7l;->c:Lm7l;

    iget-object v3, v2, Lx7l;->a:Lmcj;

    check-cast p1, Lkotlin/Unit;

    const/4 p1, 0x1

    :try_start_29
    sget-object v4, Lt0i;->b:Lp0i;

    iget-object v4, v2, Lx7l;->b:Lyni;

    iget-object v5, v0, Lm7l;->b:Ll7l;

    iget-object v4, v4, Lyni;->a:Landroid/graphics/Bitmap;

    iget-object v6, v0, Lm7l;->c:Ll7l;

    iget v7, v5, Ll7l;->b:I

    iget v8, v5, Ll7l;->c:I

    invoke-static {v4, v7, v8, p1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    iget-object v7, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast v7, Lf7l;

    iget-object v5, v5, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v7, v5, v4}, Lf7l;->i(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    iget v5, v6, Ll7l;->b:I

    iget v7, v6, Ll7l;->c:I

    invoke-static {v4, v5, v7, p1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    iget-object v7, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast v7, Lf7l;

    iget-object v6, v6, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v7, v6, v5}, Lf7l;->i(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_5d
    .catchall {:try_start_29 .. :try_end_5d} :catchall_5e

    goto :goto_67

    :catchall_5e
    move-exception v4

    sget-object v5, Lt0i;->b:Lp0i;

    new-instance v5, Lq0i;

    invoke-direct {v5, v4}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v4, v5

    :goto_67
    instance-of v4, v4, Lq0i;

    if-nez v4, :cond_7a

    iget-object v3, v3, Lmcj;->b:Ljava/lang/Object;

    check-cast v3, Lo7l;

    new-instance v4, Lq7l;

    invoke-direct {v4, p0, v2, v1, p1}, Lq7l;-><init>(Lc8l;Lx7l;Lrg;B)V

    invoke-interface {v3, v0, v4}, Lo7l;->g(Lm7l;Lq7l;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_b0

    :cond_7a
    :try_start_7a
    iget-object p1, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast p1, Lf7l;

    iget-object v4, v0, Lm7l;->b:Ll7l;

    iget-object v4, v4, Ll7l;->a:Ljava/lang/String;

    invoke-interface {p1, v4}, Lf7l;->remove(Ljava/lang/String;)V

    iget-object p1, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast p1, Lf7l;

    iget-object v0, v0, Lm7l;->c:Ll7l;

    iget-object v0, v0, Ll7l;->a:Ljava/lang/String;

    invoke-interface {p1, v0}, Lf7l;->remove(Ljava/lang/String;)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_92
    .catchall {:try_start_7a .. :try_end_92} :catchall_93

    goto :goto_9c

    :catchall_93
    move-exception p1

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_9c
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_a4

    check-cast p1, Lkotlin/Unit;

    :cond_a4
    iget-object p1, p0, Lc8l;->b:Lumi;

    new-instance v0, Luef;

    const/4 v3, 0x6

    invoke-direct {v0, p0, v2, v1, v3}, Luef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lfac;->C(Lumi;Lkotlin/jvm/functions/Function0;)Loml;

    move-result-object p0

    :goto_b0
    return-object p0

    nop

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
