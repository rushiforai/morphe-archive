.class public final synthetic Lcw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lcw3;->a:B

    iput-object p1, p0, Lcw3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lcw3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcw3;->b:Ltw3;

    packed-switch v0, :pswitch_data_c6

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->g:Loz3;

    return-object p0

    :pswitch_12
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_23
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_2a
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    return-object p0

    :pswitch_34
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->d:Lnej;

    return-object p0

    :pswitch_3e
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object p0

    return-object p0

    :pswitch_4d
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->v0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv9l;

    if-eqz v0, :cond_62

    iget-object v0, v0, Lv9l;->v:Lr9l;

    if-eqz v0, :cond_62

    new-instance v1, Loji;

    invoke-direct {v1, v0}, Loji;-><init>(Ljava/lang/Object;)V

    :cond_62
    if-nez v1, :cond_66

    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->W0:Lvu3;

    :cond_66
    return-object v1

    :pswitch_67
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    :pswitch_6e
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->b0:Lyqa;

    return-object p0

    :pswitch_73
    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->s:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu4l;

    return-object p0

    :pswitch_7e
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-eqz p0, :cond_85

    move-object v1, p0

    :cond_85
    return-object v1

    :pswitch_86
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    return-object p0

    :pswitch_90
    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "images"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/File;

    const-string v1, "google_ai_mode_attachments"

    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p0

    :pswitch_a5
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :pswitch_ad
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->B:Lcom/opera/android/browser/BrowserContainer;

    if-eqz p0, :cond_b4

    move-object v1, p0

    :cond_b4
    return-object v1

    :pswitch_b5
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f0a0a8c

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object p0

    :pswitch_c1
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lhjf;->a:Ldll;

    return-object p0

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_c1
        :pswitch_b5
        :pswitch_ad
        :pswitch_a5
        :pswitch_90
        :pswitch_86
        :pswitch_7e
        :pswitch_73
        :pswitch_6e
        :pswitch_67
        :pswitch_4d
        :pswitch_3e
        :pswitch_34
        :pswitch_2a
        :pswitch_23
        :pswitch_12
    .end packed-switch
.end method
