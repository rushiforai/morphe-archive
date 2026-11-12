.class public final Lme9;
.super Lc59;
.source "SourceFile"


# instance fields
.field public final n:Lj4c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lj4c;)V
    .registers 8

    const v0, 0x7f14078b

    const v1, 0x7f1407a5

    const v2, 0x7f14078c

    const v3, 0x7f14078a

    invoke-static {p1, v2, v3, v0, v1}, Lx1p;->h(Landroid/content/Context;IIII)Lj59;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;)V

    iput-object p3, p0, Lme9;->n:Lj4c;

    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 15

    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object p0, p0, Lme9;->n:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lbf9;

    iput-object p2, v1, Lbf9;->s:Ljava/lang/String;

    iget-object p0, v1, Lbf9;->d:Lj4c;

    invoke-virtual {v1}, Lbf9;->r()I

    move-result p1

    const/4 p2, 0x1

    if-lt p1, p2, :cond_a8

    iget-object p1, v1, Lbf9;->m:Lzd2;

    if-nez p1, :cond_a8

    iget-object p1, v1, Lbf9;->n:Lzd2;

    if-nez p1, :cond_a8

    iget-object v2, v1, Lbf9;->s:Ljava/lang/String;

    if-nez v2, :cond_28

    invoke-virtual {v1}, Lbf9;->N()V

    goto/16 :goto_a8

    :cond_28
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "OFA/"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, v1, Lbf9;->b:Landroid/content/Context;

    invoke-static {p3}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p3

    iget-object p3, p3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget p1, Lu1b;->c:I

    new-instance v4, Lx1b;

    const-string p1, "sync"

    invoke-direct {v4, p1}, Lx1b;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string p3, "device_notification_token"

    const/4 v0, 0x0

    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_80

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string p3, "device_version_token"

    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_80

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "device_capabilities"

    sget-object p3, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-static {p0, p1, p3}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    invoke-virtual {v4, p0}, Lu1b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a8

    :cond_80
    iget-object p0, v1, Lbf9;->e:Lle9;

    const-string p1, "ofa:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v0, Lqn;

    const/16 v5, 0x19

    invoke-direct/range {v0 .. v5}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v9, Laxl;

    const/4 p1, 0x7

    invoke-direct {v9, v1, p1}, Laxl;-><init>(Lbf9;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v5, v3

    new-instance v3, Lvw1;

    const/4 v10, 0x4

    move-object v8, v0

    move-object v7, v4

    move-object v4, p0

    invoke-direct/range {v3 .. v10}, Lvw1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v9}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    iput-object p0, v1, Lbf9;->m:Lzd2;

    :cond_a8
    :goto_a8
    iget-object p0, v1, Lbf9;->s:Ljava/lang/String;

    if-eqz p0, :cond_bd

    invoke-virtual {v1}, Lbf9;->r()I

    move-result p0

    if-ge p0, p2, :cond_bd

    iget-object p0, v1, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_bd

    invoke-virtual {v1}, Lbf9;->C()V

    :cond_bd
    return-void
.end method
