.class public final Lzal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxbd;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Labl;


# direct methods
.method public synthetic constructor <init>(Labl;B)V
    .registers 3

    iput-byte p2, p0, Lzal;->a:B

    iput-object p1, p0, Lzal;->b:Labl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ls9i;Lk73;)V
    .registers 16

    iget-byte v0, p0, Lzal;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lzal;->b:Labl;

    packed-switch v0, :pswitch_data_fe

    check-cast p2, Loal;

    iget-object v4, p0, Labl;->a:Lfr;

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v0

    iget-object v3, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v9, v3

    check-cast v9, Lcxj;

    const/16 v3, 0xa0

    invoke-virtual {v9, v3}, Lcxj;->a(C)V

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v10

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v11

    invoke-virtual {v9, v3}, Lcxj;->a(C)V

    :goto_29
    iget-object v12, p0, Labl;->f:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget v5, p0, Labl;->e:I

    if-gt v3, v5, :cond_3c

    new-instance v3, Lral;

    invoke-direct {v3}, Lral;-><init>()V

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    :cond_3c
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lral;

    iget-object p2, p2, Loal;->g:Lnal;

    if-nez p2, :cond_48

    sget-object p2, Lnal;->a:Lnal;

    :cond_48
    iget-object v3, v3, Lral;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-instance v5, Lqal;

    invoke-direct {v5, v9, v10, v11, p2}, Lqal;-><init>(Ljava/lang/CharSequence;IILnal;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lpal;

    iget p2, p0, Labl;->e:I

    invoke-virtual {v12, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lral;

    iget p2, p0, Labl;->e:I

    if-lez p2, :cond_67

    move v8, v2

    goto :goto_68

    :cond_67
    move v8, v1

    :goto_68
    const/4 v7, 0x1

    invoke-direct/range {v3 .. v8}, Lpal;-><init>(Lfr;Lral;IZZ)V

    iget-object p2, v9, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    if-le v10, v0, :cond_7b

    if-ltz v0, :cond_7b

    if-gt v10, p2, :cond_7b

    invoke-static {v9, v3, v0, v10}, Lcxj;->d(Lcxj;Ljava/lang/Object;II)V

    :cond_7b
    new-instance v3, Lpal;

    iget p2, p0, Labl;->e:I

    invoke-virtual {v12, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lral;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lpal;-><init>(Lfr;Lral;IZZ)V

    invoke-virtual {p1, v11, v3}, Ls9i;->e0(ILjava/lang/Object;)V

    iget p1, p0, Labl;->e:I

    add-int/2addr p1, v2

    iput p1, p0, Labl;->e:I

    return-void

    :pswitch_94
    check-cast p2, Lxal;

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v0

    iput v1, p0, Labl;->e:I

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    iget-object p2, p1, Ls9i;->d:Ljava/lang/Object;

    check-cast p2, Lcxj;

    const/16 v3, 0xa

    invoke-virtual {p2, v3}, Lcxj;->a(C)V

    iget-boolean p2, p0, Labl;->b:Z

    if-eqz p2, :cond_b4

    new-instance p2, Landroid/text/style/StyleSpan;

    invoke-direct {p2, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p1, v0, p2}, Ls9i;->e0(ILjava/lang/Object;)V

    :cond_b4
    new-instance p2, Lyal;

    iget-object v3, p0, Labl;->a:Lfr;

    iget-boolean v4, p0, Labl;->b:Z

    iget-boolean v5, p0, Labl;->c:Z

    iget-boolean v6, p0, Labl;->d:Z

    invoke-direct {p2, v3, v4, v5, v6}, Lyal;-><init>(Lfr;ZZZ)V

    invoke-virtual {p1, v0, p2}, Ls9i;->e0(ILjava/lang/Object;)V

    iput-boolean v1, p0, Labl;->d:Z

    iget-boolean p1, p0, Labl;->c:Z

    xor-int/2addr p1, v2

    iput-boolean p1, p0, Labl;->c:Z

    return-void

    :pswitch_cc
    check-cast p2, Lsal;

    iput-boolean v2, p0, Labl;->b:Z

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    iput-boolean v1, p0, Labl;->b:Z

    return-void

    :pswitch_d6
    check-cast p2, Lmal;

    iput-boolean v1, p0, Labl;->c:Z

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    return-void

    :pswitch_de
    check-cast p2, Lkal;

    invoke-virtual {p1}, Ls9i;->O()V

    iput-boolean v2, p0, Labl;->d:Z

    iget-object p0, p0, Labl;->f:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result p0

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    new-instance v0, Lavj;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lavj;-><init>(B)V

    invoke-virtual {p1, p0, v0}, Ls9i;->e0(ILjava/lang/Object;)V

    invoke-virtual {p1, p2}, Ls9i;->f(Lk73;)V

    return-void

    :pswitch_data_fe
    .packed-switch 0x0
        :pswitch_de
        :pswitch_d6
        :pswitch_cc
        :pswitch_94
    .end packed-switch
.end method
