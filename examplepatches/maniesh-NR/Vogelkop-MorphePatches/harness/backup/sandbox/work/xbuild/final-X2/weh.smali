.class public final synthetic Lweh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lcom/google/android/gms/tasks/OnCanceledListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llfh;


# direct methods
.method public synthetic constructor <init>(Llfh;B)V
    .registers 3

    iput-byte p2, p0, Lweh;->a:B

    iput-object p1, p0, Lweh;->b:Llfh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCanceled()V
    .registers 3

    iget-byte v0, p0, Lweh;->a:B

    sget-object v1, Ldfh;->a:Ldfh;

    iget-object p0, p0, Lweh;->b:Llfh;

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Llfh;->j:Lpde;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_f
    iget-object p0, p0, Llfh;->j:Lpde;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_f
    .end packed-switch
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 3

    iget-byte p1, p0, Lweh;->a:B

    sget-object v0, Lyeh;->a:Lyeh;

    iget-object p0, p0, Lweh;->b:Llfh;

    packed-switch p1, :pswitch_data_20

    iget-object p0, p0, Llfh;->j:Lpde;

    new-instance p1, Lcfh;

    invoke-direct {p1, v0}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    iget-object p0, p0, Llfh;->j:Lpde;

    new-instance p1, Lcfh;

    invoke-direct {p1, v0}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
