.class public final Lrgf;
.super Ls0f;
.source "SourceFile"


# instance fields
.field public final c:Ljoc;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 7

    invoke-direct {p0, p1}, Ls0f;-><init>(Landroid/os/Bundle;)V

    const-string v0, "action_show_match_id"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_41

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-eqz v1, :cond_3a

    const-string v0, "action_show_match_type"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_34

    :try_start_21
    invoke-static {p1}, Lzi4;->M(Ljava/lang/String;)Lapc;

    move-result-object p1
    :try_end_25
    .catch Ljava/lang/IllegalArgumentException; {:try_start_21 .. :try_end_25} :catch_2d

    new-instance v0, Ljoc;

    invoke-direct {v0, v3, v4, p1}, Ljoc;-><init>(JLapc;)V

    iput-object v0, p0, Lrgf;->c:Ljoc;

    return-void

    :catch_2d
    move-exception p0

    new-instance p1, Ldjb;

    invoke-direct {p1, v0, p0}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p1

    :cond_34
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3a
    new-instance p0, Ldjb;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_41
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    const-string v0, "com.opera.android.action.SHOW_LIVE_SCORE_MATCH"

    invoke-virtual {p0, p1, v0}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public final c()Landroid/os/Bundle;
    .registers 5

    invoke-super {p0}, Ls0f;->c()Landroid/os/Bundle;

    move-result-object v0

    iget-object p0, p0, Lrgf;->c:Ljoc;

    iget-wide v1, p0, Ljoc;->a:J

    const-string v3, "action_show_match_id"

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    iget-object p0, p0, Ljoc;->b:Lapc;

    invoke-static {p0}, Lzi4;->Z(Lapc;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "action_show_match_type"

    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final e(Lcom/opera/android/BrowserActivity;)Z
    .registers 8

    invoke-static {p1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_54

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->W:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsnc;

    iget-object v2, v2, Lsnc;->f:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgs6;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lrgf;->c:Ljoc;

    iget-object v3, p0, Ljoc;->b:Lapc;

    iget-wide v4, p0, Ljoc;->a:J

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_3f

    if-ne p0, v1, :cond_38

    new-instance p0, Liqc;

    invoke-direct {p0, v4, v5}, Liqc;-><init>(J)V

    goto :goto_45

    :cond_38
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_3f
    new-instance p0, Lkqc;

    const/4 v3, 0x0

    invoke-direct {p0, v4, v5, v3}, Lkqc;-><init>(JZ)V

    :goto_45
    iget-object v3, v2, Lgs6;->b:Lrnc;

    invoke-virtual {v3, v0}, Lrnc;->a(Lndc;)Ltn;

    move-result-object v0

    new-instance v3, Lbl6;

    const/4 v4, 0x5

    invoke-direct {v3, v2, v4}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, p0, v3}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    :cond_54
    return v1
.end method

.method public final g(Landroid/content/Context;)Z
    .registers 3

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/16 v0, 0x400

    invoke-virtual {p1, v0}, Lwnh;->b(I)Z

    move-result p1

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lrgf;->c:Ljoc;

    iget-object p0, p0, Ljoc;->b:Lapc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_28

    if-ne p0, p1, :cond_21

    :cond_1f
    const/4 p0, 0x0

    return p0

    :cond_21
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_28
    return p1
.end method
