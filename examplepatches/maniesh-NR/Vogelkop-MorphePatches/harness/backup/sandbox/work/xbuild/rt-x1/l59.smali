.class public final Ll59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:I

.field public final b:Lb59;

.field public final c:Lga6;

.field public d:I

.field public final e:Ljava/util/Random;


# direct methods
.method public constructor <init>(ILb59;Lga6;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Ll59;->e:Ljava/util/Random;

    iput p1, p0, Ll59;->a:I

    iput-object p2, p0, Ll59;->b:Lb59;

    iput-object p3, p0, Ll59;->c:Lga6;

    return-void
.end method


# virtual methods
.method public final a(Lcm;)V
    .registers 10

    iget v0, p1, Lcm;->b:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_26

    iget v1, p0, Ll59;->d:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Ll59;->d:I

    const/16 v4, 0x14

    if-ge v1, v4, :cond_26

    iget-object p1, p0, Ll59;->e:Ljava/util/Random;

    shl-int/2addr v2, v3

    invoke-virtual {p1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    int-to-long v0, p1

    const-wide/16 v2, 0x7b

    mul-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_26
    iget-object v1, p0, Ll59;->c:Lga6;

    iget-object v1, v1, Lga6;->b:Ljava/lang/Object;

    check-cast v1, Lm59;

    iget-object v3, v1, Lm59;->f:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences;

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    const/4 v4, 0x0

    if-ne v0, v2, :cond_37

    move v0, v2

    goto :goto_38

    :cond_37
    move v0, v4

    :goto_38
    if-eqz v0, :cond_54

    const/4 v5, 0x0

    const-string v6, "last_fcm_token"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v6, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lm59;->g:Ljava/lang/Object;

    check-cast v6, Lc59;

    iget-object v7, v1, Lm59;->d:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-static {v5, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    xor-int/2addr v5, v2

    invoke-virtual {v6, v7, p1, v5}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_54
    iput-boolean v4, v1, Lm59;->c:Z

    iget p1, v1, Lm59;->b:I

    iget p0, p0, Ll59;->a:I

    if-ne p0, p1, :cond_72

    if-eqz v0, :cond_71

    iput v2, v1, Lm59;->b:I

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "unfinished_task"

    invoke-static {v2}, Lvep;->A(I)I

    move-result v0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_71
    return-void

    :cond_72
    iput-boolean v2, v1, Lm59;->c:Z

    new-instance p0, Ll59;

    iget-object v0, v1, Lm59;->e:Ljava/lang/Object;

    check-cast v0, Lb59;

    new-instance v2, Lga6;

    const/16 v3, 0xc

    invoke-direct {v2, v1, v3}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, p1, v0, v2}, Ll59;-><init>(ILb59;Lga6;)V

    invoke-virtual {p0}, Ll59;->run()V

    return-void
.end method

.method public final run()V
    .registers 6

    iget-object v0, p0, Ll59;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lr49;->f(Ljava/lang/String;)Lr49;

    move-result-object v0

    const-class v1, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v0, v1}, Lr49;->b(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    const/4 v1, 0x5

    iget v2, p0, Ll59;->a:I

    if-eq v2, v1, :cond_1e

    const/4 v1, 0x3

    if-eq v2, v1, :cond_1e

    const/4 v1, 0x0

    goto :goto_22

    :cond_1e
    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->b()Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    :goto_22
    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eqz v2, :cond_4f

    if-eq v2, v4, :cond_4f

    if-nez v1, :cond_33

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->f()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    goto :goto_3c

    :cond_33
    new-instance v2, Li59;

    invoke-direct {v2, v0, v4}, Li59;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;B)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    :goto_3c
    new-instance v1, Lk59;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lk59;-><init>(Ll59;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lk59;

    invoke-direct {v1, p0, v3}, Lk59;-><init>(Ll59;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_4f
    new-instance v0, Lk59;

    invoke-direct {v0, p0, v4}, Lk59;-><init>(Ll59;B)V

    invoke-virtual {v1, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lk59;

    invoke-direct {v1, p0, v3}, Lk59;-><init>(Ll59;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
