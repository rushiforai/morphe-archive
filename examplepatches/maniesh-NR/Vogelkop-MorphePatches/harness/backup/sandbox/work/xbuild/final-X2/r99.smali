.class public final synthetic Lr99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Lr99;->a:B

    iput-object p1, p0, Lr99;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lr99;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lr99;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_48

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    new-instance v1, Lty;

    const/4 v2, 0x4

    invoke-direct {v1, v0, p0, v2}, Lty;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    return-void

    :pswitch_19
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    return-void

    :pswitch_1f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    iget-object v0, p0, Lfqe;->i:Ldqe;

    iput-boolean v2, v0, Ldqe;->b:Z

    iput-object v1, v0, Ldqe;->a:Ljava/lang/String;

    iget-object p0, p0, Lfqe;->c:Luqe;

    if-eqz p0, :cond_32

    iget-object p0, p0, Luqe;->i:Lg93;

    invoke-virtual {p0}, Lt7j;->c()V

    :cond_32
    return-void

    :pswitch_33
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    iget-object v0, p0, Lfqe;->i:Ldqe;

    iput-boolean v2, v0, Ldqe;->b:Z

    iput-object v1, v0, Ldqe;->a:Ljava/lang/String;

    iget-object p0, p0, Lfqe;->c:Luqe;

    if-eqz p0, :cond_46

    iget-object p0, p0, Luqe;->i:Lg93;

    invoke-virtual {p0}, Lt7j;->c()V

    :cond_46
    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_33
        :pswitch_1f
        :pswitch_19
    .end packed-switch
.end method
