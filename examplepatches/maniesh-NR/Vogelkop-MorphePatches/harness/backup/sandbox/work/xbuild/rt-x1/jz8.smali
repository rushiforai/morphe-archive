.class public final synthetic Ljz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Ldx3;

.field public final synthetic c:C

.field public final synthetic d:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final synthetic e:Lek2;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lsz8;Ldx3;ILorg/chromium/content_public/browser/RenderFrameHost;Lek2;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljz8;->a:Lsz8;

    iput-object p2, p0, Ljz8;->b:Ldx3;

    iput-char p3, p0, Ljz8;->c:C

    iput-object p4, p0, Ljz8;->d:Lorg/chromium/content_public/browser/RenderFrameHost;

    iput-object p5, p0, Ljz8;->e:Lek2;

    iput-boolean p6, p0, Ljz8;->f:Z

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .registers 14

    check-cast p1, Landroid/app/PendingIntent;

    new-instance v0, Lmz8;

    iget-object v1, p0, Ljz8;->a:Lsz8;

    iget-object v2, p0, Ljz8;->d:Lorg/chromium/content_public/browser/RenderFrameHost;

    iget-object v3, p0, Ljz8;->e:Lek2;

    iget-boolean v4, p0, Ljz8;->f:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lmz8;-><init>(Lsz8;Lorg/chromium/content_public/browser/RenderFrameHost;Lek2;Z)V

    iget-object v5, p0, Ljz8;->b:Ldx3;

    iget-object v1, v5, Lhjf;->c:Ljava/util/HashMap;

    iget-char v7, p0, Ljz8;->c:C

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_1c
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v6

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v5 .. v11}, Lxd5;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_27
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_1c .. :try_end_27} :catch_28

    return-void

    :catch_28
    const/16 p0, 0x20

    invoke-virtual {v3, p0}, Lek2;->s(I)V

    return-void
.end method
