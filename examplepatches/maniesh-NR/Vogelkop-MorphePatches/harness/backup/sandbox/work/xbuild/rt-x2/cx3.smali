.class public Lcx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lre7;

.field public final synthetic b:B

.field public final synthetic c:Ldx3;


# direct methods
.method public constructor <init>(Ldx3;Lre7;B)V
    .registers 4

    iput-byte p3, p0, Lcx3;->b:B

    iput-object p1, p0, Lcx3;->c:Ldx3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcx3;->a:Lre7;

    iput-object p0, p2, Lre7;->x:Lcx3;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method private final a(Lre7;)V
    .registers 2

    return-void
.end method

.method private final b(Lre7;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public c(Lre7;Z)V
    .registers 12

    iget-byte v0, p0, Lcx3;->b:B

    const/4 v1, -0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, -0x5

    const/4 v5, -0x4

    iget-object v6, p0, Lcx3;->c:Ldx3;

    packed-switch v0, :pswitch_data_12e

    check-cast v6, Ll2b;

    invoke-virtual {p1}, Lre7;->h()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_6c

    invoke-virtual {p0}, Ljava/io/File;->canWrite()Z

    move-result p2

    if-eqz p2, :cond_6c

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    iget-object p2, p2, Lsf7;->a:Lrf7;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p1, p0}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide v0

    iget-wide v7, p1, Lre7;->j:J

    cmp-long p0, v0, v7

    if-gez p0, :cond_40

    sget-object p0, Lb3b;->a:[Lb3b;

    invoke-virtual {v6, v5}, Ll2b;->E0(I)V

    goto :goto_71

    :cond_40
    iget-object p0, p1, Lre7;->p:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4e

    sget-object p0, Lb3b;->a:[Lb3b;

    invoke-virtual {v6, v4}, Ll2b;->E0(I)V

    goto :goto_71

    :cond_4e
    invoke-virtual {p1, v3}, Lre7;->y(I)V

    invoke-virtual {p1, p0}, Lre7;->x(Ljava/lang/String;)V

    invoke-virtual {p1}, Lre7;->w()V

    iget-object p0, v6, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 p1, 0x64

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, v6, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_71

    iget-object p0, p0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_71

    :cond_6c
    sget-object p0, Lb3b;->a:[Lb3b;

    invoke-virtual {v6, v1}, Ll2b;->E0(I)V

    :cond_71
    :goto_71
    return-void

    :pswitch_72
    check-cast v6, Lcom/opera/android/import_data/ImportChromeDataActivity;

    iget-object p0, p1, Lre7;->m:Ljava/lang/String;

    const-string p2, "text/csv"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_81

    sget-object p0, Lj2b;->c:Lj2b;

    goto :goto_83

    :cond_81
    sget-object p0, Lj2b;->d:Lj2b;

    :goto_83
    invoke-virtual {p1}, Lre7;->h()Ljava/io/File;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_e2

    invoke-virtual {p2}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_e2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide v0

    iget-wide v7, p1, Lre7;->j:J

    cmp-long p2, v0, v7

    if-gez p2, :cond_b7

    sget-object p1, Lb3b;->a:[Lb3b;

    sget p1, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {v6, p0, v5}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    goto :goto_e9

    :cond_b7
    iget-object p2, p1, Lre7;->p:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c7

    sget-object p1, Lb3b;->a:[Lb3b;

    sget p1, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {v6, p0, v4}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    goto :goto_e9

    :cond_c7
    invoke-virtual {p1, v3}, Lre7;->y(I)V

    invoke-virtual {p1, p2}, Lre7;->x(Ljava/lang/String;)V

    invoke-virtual {p1}, Lre7;->w()V

    iget-boolean p0, p0, Lj2b;->a:Z

    if-eqz p0, :cond_e9

    iget-object p0, v6, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_e9

    iget-object p0, p0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e9

    :cond_e2
    sget-object p1, Lb3b;->a:[Lb3b;

    sget p1, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {v6, p0, v1}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    :cond_e9
    :goto_e9
    return-void

    :pswitch_ea
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "ask_before_downloading"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    iget-object v3, p0, Lcx3;->c:Ldx3;

    if-nez v1, :cond_117

    new-instance v2, Ligi;

    sget-object v4, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v5

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object v6, p2, Ld6j;->c:Lx5f;

    invoke-virtual {p0, p1}, Lcx3;->e(Lre7;)Lvwh;

    move-result-object v8

    move-object v7, p1

    invoke-direct/range {v2 .. v8}, Ligi;-><init>(Ldx3;Lumi;Lsf7;Lx5f;Lre7;Lvwh;)V

    goto :goto_12c

    :cond_117
    move-object v7, p1

    iget-object p1, v3, Ldx3;->o:Lqim;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lqim;->d:Lnej;

    new-instance v1, Lbx3;

    invoke-direct {v1, p0, v7, p2, v0}, Lbx3;-><init>(Lcx3;Lre7;ZLcom/opera/android/OperaApplication;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    :goto_12c
    return-void

    nop

    :pswitch_data_12e
    .packed-switch 0x0
        :pswitch_ea
        :pswitch_72
    .end packed-switch
.end method

.method public d(Lre7;ZLmej;)Lef7;
    .registers 12

    new-instance v0, Lef7;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Lcx3;->c:Ldx3;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object v5, p0, Lsf7;->a:Lrf7;

    invoke-virtual {v2}, Ldx3;->F()Ljv0;

    move-result-object v6

    const/4 v7, 0x0

    move-object v3, p1

    move v4, p2

    move-object v1, p3

    invoke-direct/range {v0 .. v7}, Lef7;-><init>(Lmej;Ldx3;Lre7;ZLrf7;Ljv0;Lwjh;)V

    return-object v0
.end method

.method public e(Lre7;)Lvwh;
    .registers 3

    new-instance p1, Lva2;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lva2;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    iget-object v0, p0, Lcx3;->a:Lre7;

    const/4 v1, 0x0

    iput-object v1, v0, Lre7;->x:Lcx3;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method
