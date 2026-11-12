.class public final synthetic Lxwl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj4c;


# direct methods
.method public synthetic constructor <init>(Lj4c;B)V
    .registers 3

    iput-byte p2, p0, Lxwl;->a:B

    iput-object p1, p0, Lxwl;->b:Lj4c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lxwl;->a:B

    iget-object p0, p0, Lxwl;->b:Lj4c;

    packed-switch v0, :pswitch_data_2a

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0}, Lbf9;->N()V

    return-void

    :pswitch_11
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0}, Lbf9;->B()V

    return-void

    :pswitch_1b
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    iget-object v0, p0, Lbf9;->q:Lh5k;

    if-nez v0, :cond_29

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lbf9;->O(Z)V

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
