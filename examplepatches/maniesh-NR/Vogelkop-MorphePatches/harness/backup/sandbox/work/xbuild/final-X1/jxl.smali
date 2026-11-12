.class public final synthetic Ljxl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsa4;


# direct methods
.method public synthetic constructor <init>(Lsa4;B)V
    .registers 3

    iput-byte p2, p0, Ljxl;->a:B

    iput-object p1, p0, Ljxl;->b:Lsa4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lmyf;ZI)V
    .registers 10

    iget-byte v0, p0, Ljxl;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Ljxl;->b:Lsa4;

    packed-switch v0, :pswitch_data_ca

    iget-object v0, p0, Lsa4;->g:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_95

    iget v3, p0, Lsa4;->d:I

    or-int/2addr v3, p3

    iput v3, p0, Lsa4;->d:I

    if-nez p2, :cond_1f

    invoke-virtual {p0}, Lsa4;->f()V

    goto/16 :goto_95

    :cond_1f
    iget-object p2, p0, Lsa4;->h:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashSet;

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_95

    iget-object p1, p0, Lsa4;->e:Ljava/lang/Object;

    check-cast p1, Lbf9;

    iget-object p2, p0, Lsa4;->f:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    new-instance p3, Lzzh;

    const/16 v0, 0x1c

    invoke-direct {p3, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p1, Lbf9;->p:Lmgh;

    sget-object v3, Lixl;->b:Lixl;

    if-eqz v0, :cond_46

    invoke-virtual {v0, v3}, Lmgh;->e(Ljava/lang/Object;)V

    iput-object v1, p1, Lbf9;->p:Lmgh;

    :cond_46
    iget-object v0, p1, Lbf9;->r:Lzd2;

    if-eqz v0, :cond_4f

    invoke-virtual {v0}, Lzd2;->cancel()V

    iput-object v1, p1, Lbf9;->r:Lzd2;

    :cond_4f
    const-string v0, "\\$"

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    array-length v0, p2

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-ne v0, v4, :cond_63

    new-instance v1, Lvz;

    aget-object v0, p2, v5

    aget-object p2, p2, v2

    invoke-direct {v1, v0, p2}, Lvz;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_63
    if-nez v1, :cond_6b

    invoke-virtual {p3, v3}, Lzzh;->run(Ljava/lang/Object;)V

    sget-object p1, Lbf9;->A:Lbxl;

    goto :goto_93

    :cond_6b
    invoke-virtual {p1}, Lbf9;->r()I

    move-result p2

    if-lt p2, v2, :cond_7d

    iget-object p2, p1, Lbf9;->n:Lzd2;

    if-nez p2, :cond_7d

    invoke-virtual {p1, v1, p3, v2}, Lbf9;->I(Lvz;Lzzh;Z)Lmgh;

    move-result-object p2

    iput-object p2, p1, Lbf9;->p:Lmgh;

    move-object p1, p2

    goto :goto_93

    :cond_7d
    new-instance p2, Lexl;

    new-instance v0, Lzwl;

    invoke-direct {v0, p1, v1, p3, v5}, Lzwl;-><init>(Lbf9;Lvz;Lzzh;B)V

    invoke-direct {p2, v0, p3}, Lexl;-><init>(Ldxl;Lcom/opera/api/Callback;)V

    iput-object p2, p1, Lbf9;->p:Lmgh;

    iget-object p3, p1, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lbf9;->C()V

    iget-object p1, p1, Lbf9;->p:Lmgh;

    :goto_93
    iput-object p1, p0, Lsa4;->m:Ljava/lang/Object;

    :cond_95
    :goto_95
    return-void

    :pswitch_96
    iget-object v0, p0, Lsa4;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget p1, p0, Lsa4;->d:I

    or-int/2addr p1, p3

    iput p1, p0, Lsa4;->d:I

    if-nez p2, :cond_a8

    invoke-virtual {p0}, Lsa4;->f()V

    goto :goto_c9

    :cond_a8
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_c9

    iput-boolean v2, p0, Lsa4;->c:Z

    iget-object p1, p0, Lsa4;->i:Ljava/lang/Object;

    check-cast p1, Lq65;

    invoke-virtual {p1}, Ln1;->S()V

    iget-object p1, p0, Lsa4;->l:Ljava/lang/Object;

    check-cast p1, Lx77;

    if-eqz p1, :cond_c9

    iget p2, p0, Lsa4;->d:I

    iput-object v1, p0, Lsa4;->l:Ljava/lang/Object;

    new-instance p3, Lkxl;

    invoke-direct {p3, p1, p2}, Lkxl;-><init>(Lx77;I)V

    invoke-virtual {p0, p3}, Lsa4;->b(Ljava/lang/Runnable;)V

    :cond_c9
    :goto_c9
    return-void

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_96
    .end packed-switch
.end method
