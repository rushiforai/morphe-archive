.class public final synthetic Lv68;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;B)V
    .registers 3

    iput-byte p2, p0, Lv68;->a:B

    iput-object p1, p0, Lv68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lv68;->a:B

    iget-object p0, p0, Lv68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    packed-switch v0, :pswitch_data_4e

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_c
    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_14
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->f:Losf;

    return-object p0

    :pswitch_23
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_32
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    return-object p0

    :pswitch_37
    sget-object v0, Lso7;->k:Lro7;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lio7;->G:Lio7;

    sget-object v1, Lso7;->l:Ln57;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lso7;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lro7;

    return-object p0

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_37
        :pswitch_32
        :pswitch_23
        :pswitch_14
        :pswitch_c
    .end packed-switch
.end method
