.class public final synthetic Loe9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj4c;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lj4c;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Loe9;->a:B

    iput-object p1, p0, Loe9;->b:Lj4c;

    iput-object p2, p0, Loe9;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Loe9;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x2

    iget-object v4, p0, Loe9;->c:Ljava/lang/String;

    iget-object p0, p0, Loe9;->b:Lj4c;

    packed-switch v0, :pswitch_data_94

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0, v4}, Lbf9;->A(Ljava/lang/String;)V

    return-void

    :pswitch_16
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    if-lt v0, v3, :cond_5d

    invoke-virtual {p0}, Lbf9;->s()Lmyk;

    move-result-object p0

    if-eqz p0, :cond_5d

    iget-object v0, p0, Lmyk;->h:Ljava/util/HashMap;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5d

    iget-object v0, p0, Lmyk;->j:Lr72;

    if-eqz v0, :cond_58

    iget-object p0, v0, Lr72;->c:Ljava/lang/Object;

    check-cast p0, Lih4;

    if-nez p0, :cond_55

    iget-object p0, v0, Lr72;->b:Ljava/lang/Object;

    check-cast p0, Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    iget-object p0, v0, Lr72;->d:Ljava/lang/Object;

    check-cast p0, Lmyk;

    iget-object p0, p0, Lmyk;->a:Lbf9;

    new-instance v1, Lzzh;

    const/16 v2, 0x17

    invoke-direct {v1, v0, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lbf9;->o(Lzzh;)Lih4;

    move-result-object p0

    iput-object p0, v0, Lr72;->c:Ljava/lang/Object;

    goto :goto_5d

    :cond_55
    iput-byte v2, v0, Lr72;->a:B

    goto :goto_5d

    :cond_58
    iget-object p0, p0, Lmyk;->a:Lbf9;

    invoke-virtual {p0, v1}, Lbf9;->o(Lzzh;)Lih4;

    :cond_5d
    :goto_5d
    return-void

    :pswitch_5e
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    if-lt v0, v3, :cond_93

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    if-lt v0, v3, :cond_84

    iget-object v0, p0, Lbf9;->h:Lxl;

    invoke-virtual {v0}, Lxl;->k()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_84

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpwl;

    iget-object v1, v0, Lpwl;->b:Ljava/lang/String;

    :cond_84
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object p0

    if-eqz p0, :cond_93

    invoke-virtual {p0}, Lpc9;->d()V

    :cond_93
    return-void

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_16
    .end packed-switch
.end method
