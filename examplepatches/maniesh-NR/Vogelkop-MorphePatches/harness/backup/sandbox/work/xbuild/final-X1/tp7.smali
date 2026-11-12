.class public final synthetic Ltp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 9

    iput-byte p8, p0, Ltp7;->a:B

    iput-object p1, p0, Ltp7;->b:Ljava/lang/Object;

    iput-object p2, p0, Ltp7;->c:Ljava/lang/Object;

    iput-object p3, p0, Ltp7;->d:Ljava/lang/Object;

    iput-object p4, p0, Ltp7;->e:Ljava/lang/Object;

    iput-object p5, p0, Ltp7;->f:Ljava/lang/Object;

    iput-object p6, p0, Ltp7;->g:Ljava/lang/Object;

    iput-object p7, p0, Ltp7;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Ltp7;->a:B

    packed-switch v0, :pswitch_data_fe

    iget-object v0, p0, Ltp7;->b:Ljava/lang/Object;

    check-cast v0, Lrva;

    iget-object v1, p0, Ltp7;->c:Ljava/lang/Object;

    check-cast v1, Lqya;

    iget-object v2, p0, Ltp7;->d:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Landroid/graphics/Matrix;

    iget-object v2, p0, Ltp7;->e:Ljava/lang/Object;

    check-cast v2, Lqya;

    iget-object v3, p0, Ltp7;->f:Ljava/lang/Object;

    move-object v10, v3

    check-cast v10, Landroid/graphics/Rect;

    iget-object v3, p0, Ltp7;->g:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Llva;

    iget-object p0, p0, Ltp7;->h:Ljava/lang/Object;

    check-cast p0, Ll94;

    iget-boolean v3, v0, Lrva;->u:Z

    if-eqz v3, :cond_65

    invoke-interface {v1}, Lqya;->h1()Lsxa;

    move-result-object v3

    invoke-interface {v3}, Lsxa;->d()Lhbl;

    move-result-object v4

    invoke-interface {v1}, Lqya;->h1()Lsxa;

    move-result-object v3

    invoke-interface {v3}, Lsxa;->e()J

    move-result-wide v5

    iget-boolean v3, v0, Lrva;->e:Z

    if-eqz v3, :cond_3f

    const/4 v0, 0x0

    :goto_3d
    move v7, v0

    goto :goto_42

    :cond_3f
    iget v0, v0, Lrva;->b:I

    goto :goto_3d

    :goto_42
    invoke-interface {v1}, Lqya;->h1()Lsxa;

    move-result-object v0

    invoke-interface {v0}, Lsxa;->c()I

    move-result v9

    new-instance v3, Ltn2;

    invoke-direct/range {v3 .. v9}, Ltn2;-><init>(Lhbl;JILandroid/graphics/Matrix;I)V

    new-instance v0, Ld5j;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1, v3}, Ld5j;-><init>(Lqya;Landroid/util/Size;Lsxa;)V

    invoke-virtual {v10}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5e

    invoke-virtual {v0, v10}, Ld5j;->k(Landroid/graphics/Rect;)V

    :cond_5e
    invoke-interface {v11, v0}, Llva;->a(Ld5j;)V

    invoke-virtual {p0, v1}, Ll94;->b(Ljava/lang/Object;)Z

    goto :goto_6f

    :cond_65
    new-instance v0, Lcrf;

    const-string v1, "ImageAnalysis is detached"

    invoke-direct {v0, v1}, Lcrf;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ll94;->d(Ljava/lang/Throwable;)Z

    :goto_6f
    return-void

    :pswitch_70
    iget-object v0, p0, Ltp7;->b:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lga6;

    iget-object v0, p0, Ltp7;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Ltp7;->d:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lgb3;

    iget-object v1, p0, Ltp7;->e:Ljava/lang/Object;

    check-cast v1, Lgv3;

    iget-object v2, p0, Ltp7;->f:Ljava/lang/Object;

    check-cast v2, Lgv3;

    iget-object v3, p0, Ltp7;->g:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ltp7;->h:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {v4}, Lga6;->p()Z

    move-result v6

    if-eqz v6, :cond_f9

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v6, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v6}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_f9

    invoke-virtual {v1}, Lgv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz7f;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly7f;

    instance-of v1, v0, Lv7f;

    if-nez v1, :cond_b8

    invoke-virtual {v5}, Lgb3;->invoke()Ljava/lang/Object;

    goto :goto_fc

    :cond_b8
    iget-object v1, v2, Lgv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v1

    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v1

    if-eqz v1, :cond_ca

    iget-object v1, v1, Lr1;->a:Ljava/lang/String;

    if-eqz v1, :cond_ca

    :goto_c8
    move-object v6, v1

    goto :goto_cf

    :cond_ca
    check-cast v0, Lv7f;

    iget-object v1, v0, Lv7f;->b:Ljava/lang/String;

    goto :goto_c8

    :goto_cf
    if-eqz v6, :cond_f5

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_f5

    const-string v0, "wallpaper_current"

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e7

    invoke-virtual {v5}, Lgb3;->invoke()Ljava/lang/Object;

    goto :goto_fc

    :cond_e7
    new-instance v1, Lhd;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqln;

    move-object v2, v3

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Lhd;-><init>(Lcom/opera/android/settings/SettingsManager;Lqln;Lga6;Lgb3;Ljava/lang/String;)V

    goto :goto_fc

    :cond_f5
    invoke-virtual {v5}, Lgb3;->invoke()Ljava/lang/Object;

    goto :goto_fc

    :cond_f9
    invoke-virtual {v5}, Lgb3;->invoke()Ljava/lang/Object;

    :goto_fc
    return-void

    nop

    :pswitch_data_fe
    .packed-switch 0x0
        :pswitch_70
    .end packed-switch
.end method
