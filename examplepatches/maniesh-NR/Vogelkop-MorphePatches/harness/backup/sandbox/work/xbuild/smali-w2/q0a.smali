.class public final Lq0a;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lp1a;


# direct methods
.method public constructor <init>(Lwjh;)V
    .registers 5

    const/16 v0, 0x11

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lp1a;

    iget-object p1, p1, Lwjh;->b:Ljava/lang/Object;

    check-cast p1, Landroid/app/Activity;

    new-instance v1, Lga6;

    const/16 v2, 0xf

    invoke-direct {v1, p0, v2}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1}, Lp1a;-><init>(Landroid/app/Activity;Lga6;)V

    iput-object v0, p0, Lq0a;->c:Lp1a;

    return-void
.end method


# virtual methods
.method public final D0()V
    .registers 6

    iget-object p0, p0, Lq0a;->c:Lp1a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;-><init>()V

    const-string v1, "com.google"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;->setAllowableAccountsTypes(Ljava/util/List;)Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;->build()Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/AccountPicker;->newChooseAccountIntent(Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lp1a;->b:Landroid/app/Activity;

    instance-of v2, v1, Lhjf;

    const/16 v3, 0x3e8

    if-eqz v2, :cond_3d

    move-object v2, v1

    check-cast v2, Lhjf;

    new-instance v4, Lm1a;

    invoke-direct {v4, p0, v3}, Lm1a;-><init>(Lp1a;I)V

    iget-object p0, v2, Lhjf;->c:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_3d
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    invoke-virtual {p0, v3, v0, v1}, Lp1a;->a(IILandroid/content/Intent;)V

    return-void
.end method
