.class public final synthetic Lvuh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Lvuh;->a:B

    iput-object p1, p0, Lvuh;->b:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Lvuh;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lvuh;->b:Lx5f;

    packed-switch v0, :pswitch_data_110

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_40

    iget-object v0, p0, Lx5f;->d:Lzpa;

    iget-object v2, p0, Lx5f;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const/4 v3, -0x1

    const-string v4, "MaxRedirectStoreEntries"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-ge v3, p1, :cond_40

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v4, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v0

    const/16 v3, 0xf

    invoke-virtual {v0, v3, v1, p1}, Ljf0;->o(III)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_40
    return-void

    :pswitch_41
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_51

    const/4 p1, 0x0

    goto :goto_85

    :cond_51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    :goto_55
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_84

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb0k;

    check-cast v0, Lb0k;

    new-instance v3, Lb0k;

    iget v4, v0, Lb0k;->a:I

    iget v5, v2, Lb0k;->a:I

    add-int/2addr v4, v5

    iget v5, v0, Lb0k;->b:I

    iget v6, v2, Lb0k;->b:I

    add-int/2addr v5, v6

    iget v6, v0, Lb0k;->c:I

    iget v7, v2, Lb0k;->c:I

    add-int/2addr v6, v7

    iget v7, v0, Lb0k;->d:I

    iget v8, v2, Lb0k;->d:I

    add-int/2addr v7, v8

    iget v0, v0, Lb0k;->e:I

    iget v2, v2, Lb0k;->e:I

    add-int v8, v0, v2

    invoke-direct/range {v3 .. v8}, Lb0k;-><init>(IIIII)V

    move-object v0, v3

    goto :goto_55

    :cond_84
    move-object p1, v0

    :goto_85
    check-cast p1, Lb0k;

    if-nez p1, :cond_94

    new-instance v2, Lb0k;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lb0k;-><init>(IIIII)V

    move-object p1, v2

    :cond_94
    iget v0, p1, Lb0k;->a:I

    iget v2, p1, Lb0k;->b:I

    iget v3, p1, Lb0k;->c:I

    iget v4, p1, Lb0k;->d:I

    iget p1, p1, Lb0k;->e:I

    iget-boolean v5, p0, Lx5f;->h:Z

    if-eqz v5, :cond_cd

    iget-object v5, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v5

    const/16 v7, 0x25

    int-to-long v8, v0

    invoke-virtual {v5, v7, v1, v8, v9}, Ljf0;->p(IIJ)V

    const/16 v0, 0x28

    int-to-long v7, v3

    invoke-virtual {v5, v0, v1, v7, v8}, Ljf0;->p(IIJ)V

    const/16 v0, 0x27

    int-to-long v2, v2

    invoke-virtual {v5, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    const/16 v0, 0x29

    int-to-long v2, v4

    invoke-virtual {v5, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    const/16 v0, 0x2a

    int-to-long v2, p1

    invoke-virtual {v5, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v6}, Lx5f;->U0(Lx56;)V

    :cond_cd
    return-void

    :pswitch_ce
    check-cast p1, La4g;

    iget-object v0, p1, La4g;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-boolean v2, p0, Lx5f;->h:Z

    if-eqz v2, :cond_ed

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    const/16 v4, 0x2e

    int-to-long v5, v0

    invoke-virtual {v2, v4, v1, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_ed
    invoke-virtual {p1}, La4g;->a()V

    return-void

    :pswitch_f1
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-int p1, v2

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_10f

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v0}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v0

    const/16 v3, 0x2d

    int-to-long v4, p1

    invoke-virtual {v0, v3, v1, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_10f
    return-void

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_f1
        :pswitch_ce
        :pswitch_41
    .end packed-switch
.end method
