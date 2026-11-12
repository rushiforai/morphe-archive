.class public final synthetic Lhg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lue7;
.implements Lcom/google/android/gms/tasks/Continuation;
.implements Ldid;
.implements Llp4;
.implements Lp9g;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/Intent;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhg7;->a:Ljava/lang/Object;

    iput-object p2, p0, Lhg7;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lhg7;->b:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4

    .line 10
    iput-object p1, p0, Lhg7;->c:Ljava/lang/Object;

    iput-object p2, p0, Lhg7;->a:Ljava/lang/Object;

    iput-boolean p3, p0, Lhg7;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ZLjava/lang/Object;)V
    .registers 4

    .line 11
    iput-object p1, p0, Lhg7;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lhg7;->b:Z

    iput-object p3, p0, Lhg7;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lhg7;->c:Ljava/lang/Object;

    check-cast v0, Ljg7;

    iget-object v1, p0, Lhg7;->a:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Landroid/content/Context;

    iget-object v2, v0, Ljg7;->b:Lrf7;

    iget-object v4, v0, Ljg7;->j:Lvwh;

    iget-boolean v7, p0, Lhg7;->b:Z

    move-object v5, p1

    move-object v6, p2

    invoke-virtual/range {v2 .. v7}, Lrf7;->q(Landroid/content/Context;Lvwh;Landroid/net/Uri;Ljava/lang/String;Z)Z

    return-void
.end method

.method public final c(Lssa;I)V
    .registers 5

    iget-object v0, p0, Lhg7;->c:Ljava/lang/Object;

    check-cast v0, Lgid;

    iget-object v1, p0, Lhg7;->a:Ljava/lang/Object;

    check-cast v1, Lpf2;

    iget-object v0, v0, Lgid;->c:Llid;

    invoke-virtual {v1}, Lpf2;->c()Landroid/os/Bundle;

    move-result-object v1

    iget-boolean p0, p0, Lhg7;->b:Z

    invoke-interface {p1, v0, p2, v1, p0}, Lssa;->X(Lksa;ILandroid/os/Bundle;Z)V

    return-void
.end method

.method public final d(Ljava/util/ArrayList;Z)V
    .registers 5

    iget-object p2, p0, Lhg7;->c:Ljava/lang/Object;

    check-cast p2, Lbue;

    iget-object v0, p0, Lhg7;->a:Ljava/lang/Object;

    check-cast v0, Ll0c;

    if-nez p1, :cond_17

    iget-object p0, p2, Lbue;->c:Liu2;

    sget-object p1, Lxle;->b:Lxle;

    new-instance p2, Lrw7;

    invoke-direct {p2, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p2}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :cond_17
    iget-boolean p0, p0, Lhg7;->b:Z

    if-nez p0, :cond_1c

    const/4 v0, 0x0

    :cond_1c
    sget-object p0, Lyqe;->d:Lyqe;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-virtual {p2, v0, p1}, Lbue;->c(Ll0c;Ljava/util/List;)V

    return-void

    :cond_28
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-static {p1, p0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p2, v0, p0}, Lbue;->c(Ll0c;Ljava/util/List;)V

    return-void
.end method

.method public final k([I[Ljava/lang/String;)V
    .registers 9

    iget-object v0, p0, Lhg7;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/base/SelectFileDialog;

    iget-object v1, p0, Lhg7;->a:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/String;

    sget-object v2, Lorg/chromium/ui/base/SelectFileDialog;->n:[Ljava/lang/String;

    const/4 v2, 0x0

    move v3, v2

    :goto_c
    array-length v4, p1

    if-ge v3, v4, :cond_94

    aget v4, p1, v3

    const/4 v5, -0x1

    if-ne v4, v5, :cond_90

    iget-boolean v4, v0, Lorg/chromium/ui/base/SelectFileDialog;->e:Z

    if-eqz v4, :cond_1c

    invoke-virtual {v0}, Lorg/chromium/ui/base/SelectFileDialog;->m()V

    return-void

    :cond_1c
    iget-boolean v4, p0, Lhg7;->b:Z

    if-eqz v4, :cond_90

    array-length v4, p2

    array-length v5, v1

    if-ne v4, v5, :cond_76

    aget-object v4, p2, v3

    aget-object v5, v1, v3

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_66

    aget-object v4, p2, v3

    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4c

    aget-object v4, p2, v3

    const-string v5, "android.permission.READ_MEDIA_IMAGES"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4c

    aget-object v4, p2, v3

    const-string v5, "android.permission.READ_MEDIA_VIDEO"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_90

    :cond_4c
    sget-object p0, Lorg/chromium/ui/base/WindowAndroid;->B:Lb2b;

    sget-object p0, Lt8;->a:Landroid/content/Context;

    const p1, 0x7f140cd2

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_62

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-static {p1, v2, p0}, Larl;->a(Landroid/content/Context;ILjava/lang/String;)Larl;

    move-result-object p0

    invoke-virtual {p0}, Larl;->b()V

    :cond_62
    invoke-virtual {v0}, Lorg/chromium/ui/base/SelectFileDialog;->m()V

    return-void

    :cond_66
    aget-object p0, p2, v3

    aget-object p1, v1, v3

    const-string p2, "Permissions arrays don\'t match: "

    const-string v0, " != "

    invoke-static {p2, p0, v0, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    return-void

    :cond_76
    new-instance p0, Ljava/lang/RuntimeException;

    array-length p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    array-length p2, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "Permissions arrays misaligned: %d != %d"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_90
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_c

    :cond_94
    invoke-virtual {v0}, Lorg/chromium/ui/base/SelectFileDialog;->k()V

    return-void
.end method

.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Lhg7;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lhg7;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/common/util/PlatformVersion;->isAtLeastO()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x192

    if-ne v2, v3, :cond_34

    iget-boolean p0, p0, Lhg7;->b:Z

    invoke-static {v0, v1, p0}, Lesg;->n(Landroid/content/Context;Landroid/content/Intent;Z)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lbx1;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lbx1;-><init>(B)V

    new-instance v0, Lyt7;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lyt7;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_34
    return-object p1
.end method
