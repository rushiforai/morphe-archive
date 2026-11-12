.class public final synthetic Lbk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lek2;


# direct methods
.method public synthetic constructor <init>(Lek2;B)V
    .registers 3

    iput-byte p2, p0, Lbk2;->a:B

    iput-object p1, p0, Lbk2;->b:Lek2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .registers 3

    iget-byte p1, p0, Lbk2;->a:B

    const/16 v0, 0x20

    iget-object p0, p0, Lbk2;->b:Lek2;

    packed-switch p1, :pswitch_data_24

    :pswitch_9
    invoke-virtual {p0, v0}, Lek2;->s(I)V

    return-void

    :pswitch_d
    invoke-virtual {p0, v0}, Lek2;->s(I)V

    return-void

    :pswitch_11
    iget-object p0, p0, Lek2;->c:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyj2;

    if-eqz p0, :cond_1f

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lyj2;->a(Z)V

    :cond_1f
    return-void

    :pswitch_20
    invoke-virtual {p0, v0}, Lek2;->s(I)V

    return-void

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_20
        :pswitch_9
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lbk2;->b:Lek2;

    iget-object p0, p0, Lek2;->c:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyj2;

    if-eqz p0, :cond_15

    invoke-interface {p0, p1}, Lyj2;->a(Z)V

    :cond_15
    return-void
.end method
