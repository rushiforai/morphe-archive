.class public final synthetic Lxzb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lzzb;

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:Ltzb;


# direct methods
.method public synthetic constructor <init>(Lzzb;ZILtzb;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxzb;->a:Lzzb;

    iput-boolean p2, p0, Lxzb;->b:Z

    iput p3, p0, Lxzb;->c:I

    iput-object p4, p0, Lxzb;->d:Ltzb;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-object p1, p0, Lxzb;->d:Ltzb;

    iget-object v0, p1, Ltzb;->a:Ljava/lang/String;

    iget-object v1, p0, Lxzb;->a:Lzzb;

    iget-object v2, v1, Lzzb;->e:La0c;

    iget-boolean v3, p0, Lxzb;->b:Z

    if-eqz v3, :cond_13

    invoke-virtual {v1}, Lzzb;->G()V

    invoke-virtual {v2}, La0c;->g0()V

    return-void

    :cond_13
    iget v3, v1, Lzzb;->d:I

    iget p0, p0, Lxzb;->c:I

    if-ne p0, v3, :cond_1a

    return-void

    :cond_1a
    sget-object v3, Lvl6;->f:Lvl6;

    if-eqz v3, :cond_2c

    iget-object v3, v3, Lvl6;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v0, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-virtual {v2}, La0c;->g0()V

    return-void

    :cond_2c
    invoke-virtual {v1}, Lzzb;->G()V

    iget v3, v1, Lzzb;->b:I

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    iput p0, v1, Lzzb;->b:I

    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v0}, Lw8h;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_45

    const/4 v3, 0x1

    goto :goto_65

    :cond_45
    new-instance v5, Landroid/content/res/Configuration;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    invoke-static {v4}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    invoke-virtual {v3, v5}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3, v4}, Lw8h;->v(Landroid/content/res/Resources;Ljava/lang/String;)Z

    move-result v3

    :goto_65
    if-eqz v3, :cond_76

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0}, Lwwc;->i(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2}, La0c;->g0()V

    return-void

    :cond_76
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object v3

    new-instance v4, Lwci;

    invoke-direct {v4}, Lwci;-><init>()V

    invoke-static {v0}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    iget-object v5, v4, Lwci;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ln9h;

    invoke-direct {v0, v4}, Ln9h;-><init>(Lwci;)V

    sget-object v4, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v4

    const v5, 0xffff

    and-int/2addr v4, v5

    iput v4, v2, La0c;->s:I

    iput p0, v1, Lzzb;->d:I

    invoke-interface {v3, v0}, Lr0k;->i(Ln9h;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v2, Lqo4;

    invoke-direct {v2, v1, p0, p1, v3}, Lqo4;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v2, Lso4;

    const/4 v3, 0x3

    invoke-direct {v2, v1, p0, p1, v3}, Lso4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
