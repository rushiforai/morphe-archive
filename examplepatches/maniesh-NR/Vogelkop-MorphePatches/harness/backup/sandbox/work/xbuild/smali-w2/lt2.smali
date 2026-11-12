.class public final synthetic Llt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILeme;Lot2;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Llt2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Llt2;->b:I

    iput-object p2, p0, Llt2;->c:Ljava/lang/Object;

    iput-object p3, p0, Llt2;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Letc;Lrc5;Landroid/content/Context;I)V
    .registers 5

    .line 14
    const/4 p2, 0x1

    iput-byte p2, p0, Llt2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llt2;->c:Ljava/lang/Object;

    iput-object p3, p0, Llt2;->d:Ljava/lang/Object;

    iput p4, p0, Llt2;->b:I

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;B)V
    .registers 5

    .line 15
    iput-byte p4, p0, Llt2;->a:B

    iput-object p1, p0, Llt2;->c:Ljava/lang/Object;

    iput p2, p0, Llt2;->b:I

    iput-object p3, p0, Llt2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lrg;Landroid/content/Context;I)V
    .registers 5

    .line 13
    const/4 v0, 0x2

    iput-byte v0, p0, Llt2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llt2;->c:Ljava/lang/Object;

    iput-object p2, p0, Llt2;->d:Ljava/lang/Object;

    iput p3, p0, Llt2;->b:I

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Llt2;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_114

    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    check-cast v0, Lami;

    iget v1, p0, Llt2;->b:I

    iget-object p0, p0, Llt2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    check-cast p1, Laln;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_1e

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1e

    invoke-virtual {v0, p1}, Lami;->D(Laln;)V

    :cond_1e
    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_22
    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/ArrayList;

    iget v0, p0, Llt2;->b:I

    iget-object p0, p0, Llt2;->d:Ljava/lang/Object;

    check-cast p0, Lvr9;

    check-cast p1, Lkln;

    monitor-enter v2

    :try_start_30
    invoke-virtual {v2, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lvr9;->run()V

    monitor-exit v2

    return-void

    :goto_38
    monitor-exit v2
    :try_end_39
    .catchall {:try_start_30 .. :try_end_39} :catchall_3a

    throw p0

    :catchall_3a
    move-exception v0

    move-object p0, v0

    goto :goto_38

    :pswitch_3d
    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget v2, p0, Llt2;->b:I

    iget-object p0, p0, Llt2;->d:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p1, v2}, Leti;->b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_54
    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    check-cast v0, Lzzb;

    iget v1, p0, Llt2;->b:I

    iget-object p0, p0, Llt2;->d:Ljava/lang/Object;

    check-cast p0, Ltzb;

    check-cast p1, Ljava/lang/String;

    iget v2, v0, Lzzb;->d:I

    if-ne v2, v1, :cond_89

    invoke-virtual {v0}, Lzzb;->H()V

    const-string v1, "Failed to install language"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object p0, p0, Ltzb;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "language: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", reason: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lzzb;->I()V

    :cond_89
    return-void

    :pswitch_8a
    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    check-cast v0, Lrg;

    iget-object v1, p0, Llt2;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget p0, p0, Llt2;->b:I

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v1, p1, p0}, Leti;->b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_9e
    iget-object v0, p0, Llt2;->c:Ljava/lang/Object;

    check-cast v0, Letc;

    iget-object v2, p0, Llt2;->d:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget p0, p0, Llt2;->b:I

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_c1

    new-instance v3, Lhq4;

    const/4 v4, -0x1

    invoke-direct {v3, p1, v4}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    invoke-static {v3, v2, p0}, Lrc5;->Z(Landroid/graphics/drawable/Drawable;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iget-object p0, v0, Letc;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_c1
    return-void

    :pswitch_c2
    iget v0, p0, Llt2;->b:I

    iget-object v1, p0, Llt2;->c:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Leme;

    iget-object p0, p0, Llt2;->d:Ljava/lang/Object;

    check-cast p0, Lot2;

    move-object v3, p1

    check-cast v3, La4g;

    invoke-virtual {v3, v0}, La4g;->b(I)Lw3g;

    move-result-object v4

    if-eqz v4, :cond_112

    new-instance v2, Lq4g;

    iget-object p1, p0, Lot2;->j:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    iget-object p1, p0, Lot2;->i:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v10, p1

    check-cast v10, Lyu2;

    iget-object p1, p0, Lot2;->d:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lx5g;

    iget-object v11, p1, Lx5g;->d:Lw4g;

    iget-object p1, p0, Lot2;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqim;

    iget-object v12, p1, Lqim;->c:Lz77;

    const/4 v5, 0x0

    const v6, 0x7f140efb

    const v8, 0x7f140c58

    const v9, 0x7f140567

    invoke-direct/range {v2 .. v12}, Lq4g;-><init>(La4g;Lw3g;ZILp4g;IILyu2;Lw4g;Lz77;)V

    const/16 p1, 0x1003

    invoke-static {v2, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    :cond_112
    return-void

    nop

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_c2
        :pswitch_9e
        :pswitch_8a
        :pswitch_54
        :pswitch_3d
        :pswitch_22
    .end packed-switch
.end method
