.class public final synthetic Llv1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Llv1;->a:B

    iput-object p1, p0, Llv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 4

    iget-byte v0, p0, Llv1;->a:B

    sget-object v1, Luvg;->b:Luvg;

    iget-object p0, p0, Llv1;->b:Lxv1;

    packed-switch v0, :pswitch_data_44

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v0

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_22

    new-instance v0, Lhze;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object p0

    invoke-direct {v0, p0}, Lhze;-><init>(Lgmk;)V

    invoke-virtual {v0, p1}, Lhze;->a(Lcom/opera/api/Callback;)V

    goto :goto_25

    :cond_22
    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_25
    return-void

    :pswitch_26
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v0

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_3f

    new-instance v0, Lhze;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object p0

    invoke-direct {v0, p0}, Lhze;-><init>(Lgmk;)V

    invoke-virtual {v0, p1}, Lhze;->a(Lcom/opera/api/Callback;)V

    goto :goto_42

    :cond_3f
    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_42
    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_26
    .end packed-switch
.end method
