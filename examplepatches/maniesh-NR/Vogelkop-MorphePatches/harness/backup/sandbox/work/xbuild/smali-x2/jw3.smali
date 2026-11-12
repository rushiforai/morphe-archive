.class public final synthetic Ljw3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Ljw3;->a:B

    iput-object p1, p0, Ljw3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 3

    iget-byte v0, p0, Ljw3;->a:B

    iget-object p0, p0, Ljw3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_2c

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v0

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_1e

    new-instance v0, Lhze;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object p0

    invoke-direct {v0, p0}, Lhze;-><init>(Lgmk;)V

    invoke-virtual {v0, p1}, Lhze;->a(Lcom/opera/api/Callback;)V

    goto :goto_23

    :cond_1e
    sget-object p0, Luvg;->b:Luvg;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_23
    return-void

    :pswitch_24
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object p0

    invoke-virtual {p0, p1}, Le00;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
