.class public final synthetic Lwe9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbf9;


# direct methods
.method public synthetic constructor <init>(Lbf9;B)V
    .registers 3

    iput-byte p2, p0, Lwe9;->a:B

    iput-object p1, p0, Lwe9;->b:Lbf9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lwe9;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lwe9;->b:Lbf9;

    packed-switch v0, :pswitch_data_68

    invoke-virtual {p0}, Lbf9;->B()V

    return-void

    :pswitch_d
    invoke-virtual {p0, v2}, Lbf9;->O(Z)V

    return-void

    :pswitch_11
    invoke-virtual {p0, v1}, Lbf9;->O(Z)V

    iget-object p0, p0, Lbf9;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhxl;

    invoke-interface {v0}, Lhxl;->i()V

    goto :goto_1a

    :cond_2a
    return-void

    :pswitch_2b
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lbf9;->J(Ljava/util/List;)Lpwl;

    invoke-virtual {p0}, Lbf9;->z()V

    return-void

    :pswitch_34
    const/4 v0, 0x0

    iput-object v0, p0, Lbf9;->n:Lzd2;

    invoke-virtual {p0}, Lbf9;->k()V

    iget-object v0, p0, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_45

    invoke-virtual {p0}, Lbf9;->C()V

    :cond_45
    return-void

    :pswitch_46
    iget-object v0, p0, Lbf9;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_51

    iput-boolean v2, p0, Lbf9;->v:Z

    goto :goto_67

    :cond_51
    invoke-virtual {p0, v1}, Lbf9;->O(Z)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5d

    iput-boolean v2, p0, Lbf9;->v:Z

    goto :goto_67

    :cond_5d
    new-instance v0, Lwe9;

    invoke-direct {v0, p0, v2}, Lwe9;-><init>(Lbf9;B)V

    const-wide/16 v1, 0x2710

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :goto_67
    return-void

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_46
        :pswitch_34
        :pswitch_2b
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method
