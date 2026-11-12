.class public final synthetic La18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxn4;

.field public final synthetic c:Lcom/google/android/gms/cast/framework/CastSession;


# direct methods
.method public synthetic constructor <init>(Lxn4;Lcom/google/android/gms/cast/framework/CastSession;B)V
    .registers 4

    iput-byte p3, p0, La18;->a:B

    iput-object p1, p0, La18;->b:Lxn4;

    iput-object p2, p0, La18;->c:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, La18;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, La18;->c:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, La18;->b:Lxn4;

    packed-switch v0, :pswitch_data_34

    invoke-virtual {p0, v2}, Lxn4;->P(Lcom/google/android/gms/cast/framework/CastSession;)V

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iget-object v0, p0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/SessionManager;->getCurrentCastSession()Lcom/google/android/gms/cast/framework/CastSession;

    move-result-object v0

    if-ne v0, v2, :cond_1e

    iget-object p0, p0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/framework/SessionManager;->endCurrentSession(Z)V

    :cond_1e
    return-void

    :pswitch_1f
    invoke-virtual {p0, v2}, Lxn4;->P(Lcom/google/android/gms/cast/framework/CastSession;)V

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iget-object v0, p0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/SessionManager;->getCurrentCastSession()Lcom/google/android/gms/cast/framework/CastSession;

    move-result-object v0

    if-ne v0, v2, :cond_33

    iget-object p0, p0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/framework/SessionManager;->endCurrentSession(Z)V

    :cond_33
    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
