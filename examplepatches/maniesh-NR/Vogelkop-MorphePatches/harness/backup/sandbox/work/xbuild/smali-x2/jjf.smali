.class public final synthetic Ljjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Ljjf;->a:B

    iput-object p1, p0, Ljjf;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Ljjf;->a:B

    iget-object p0, p0, Ljjf;->b:Lxbf;

    packed-switch v0, :pswitch_data_7a

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v1, v0, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly3i;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk3i;

    invoke-virtual {v0}, Lk3i;->a()Likc;

    move-result-object v0

    new-instance v3, Lx4i;

    invoke-direct {v3, v1, v0, v2, p0}, Lx4i;-><init>(Ly3i;Likc;Lru9;Lndc;)V

    return-object v3

    :pswitch_31
    new-instance v0, Lekn;

    iget-object v1, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lhjf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lumi;

    invoke-direct {v0, v1, p0}, Lekn;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_3f
    new-instance v2, Lqln;

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lhjf;

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lumi;

    sget-object v6, Lxne;->b:Lii;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lmi;

    invoke-virtual {v0}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v7

    iget-object v8, v3, Lhjf;->a:Ldll;

    sget-object v1, Lz7f;->k:Lrqd;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lipe;->E(Landroid/content/Context;)Lz7f;

    move-result-object v9

    iget-object v0, v0, Lmi;->A:Lhi;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lonn;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v11, p0

    check-cast v11, Lx4i;

    move-object v4, v3

    invoke-direct/range {v2 .. v11}, Lqln;-><init>(Lndc;Landroid/content/Context;Lumi;Lii;Lcom/opera/android/settings/SettingsManager;Ldll;Lz7f;Lonn;Lx4i;)V

    return-object v2

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_31
    .end packed-switch
.end method
