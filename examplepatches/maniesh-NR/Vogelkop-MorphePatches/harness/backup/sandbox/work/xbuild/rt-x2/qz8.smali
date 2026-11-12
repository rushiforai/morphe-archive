.class public final synthetic Lqz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Ldx3;

.field public final synthetic c:C

.field public final synthetic d:Lek2;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lsz8;Ldx3;ILek2;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqz8;->a:Lsz8;

    iput-object p2, p0, Lqz8;->b:Ldx3;

    iput-char p3, p0, Lqz8;->c:C

    iput-object p4, p0, Lqz8;->d:Lek2;

    iput-boolean p5, p0, Lqz8;->e:Z

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .registers 13

    check-cast p1, Landroid/app/PendingIntent;

    new-instance v0, Lkz8;

    iget-object v1, p0, Lqz8;->a:Lsz8;

    iget-object v2, p0, Lqz8;->d:Lek2;

    iget-boolean v3, p0, Lqz8;->e:Z

    invoke-direct {v0, v1, v2, v3}, Lkz8;-><init>(Lsz8;Lek2;Z)V

    iget-object v4, p0, Lqz8;->b:Ldx3;

    iget-object v1, v4, Lhjf;->c:Ljava/util/HashMap;

    iget-char v6, p0, Lqz8;->c:C

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_1a
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v5

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v10}, Lxd5;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_25
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_1a .. :try_end_25} :catch_26

    return-void

    :catch_26
    const/16 p0, 0x20

    invoke-virtual {v2, p0}, Lek2;->s(I)V

    return-void
.end method
