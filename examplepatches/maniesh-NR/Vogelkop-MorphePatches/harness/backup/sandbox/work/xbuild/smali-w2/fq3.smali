.class public final Lfq3;
.super Lv73;
.source "SourceFile"


# instance fields
.field public final synthetic K:B


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;B)V
    .registers 12

    iput-byte p11, p0, Lfq3;->K:B

    invoke-direct/range {p0 .. p10}, Lv73;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)V

    return-void
.end method


# virtual methods
.method public final g(Ltbf;)Lnrl;
    .registers 6

    iget-byte v0, p0, Lfq3;->K:B

    sget-object v1, Lv73;->m:Lnrl;

    packed-switch v0, :pswitch_data_2a

    iget v0, p1, Ltbf;->c:I

    const/4 v2, 0x3

    invoke-static {v0, v2}, Lvep;->d(II)I

    move-result v0

    if-ltz v0, :cond_29

    const-wide/16 v2, 0x40

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {p0, p1}, Lv73;->k(Ltbf;)Lnrl;

    move-result-object p0

    iget-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Ltaf;

    sget-object v0, Ltaf;->d:Ltaf;

    if-eq p1, v0, :cond_29

    sget-object v0, Ltaf;->e:Ltaf;

    if-eq p1, v0, :cond_29

    move-object v1, p0

    :cond_29
    :pswitch_29
    return-object v1

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

.method public final h(Ltbf;Lro9;)Lnrl;
    .registers 7

    iget-byte v0, p0, Lfq3;->K:B

    sget-object v1, Lv73;->m:Lnrl;

    packed-switch v0, :pswitch_data_4c

    const-wide/16 v2, 0x20

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_1a

    const-wide/16 v2, 0x10

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v1, Lv73;->q:Lnrl;

    goto :goto_4a

    :cond_1a
    const-wide/16 v2, 0x40

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object p0, p0, Lv73;->b:Landroid/content/Context;

    invoke-static {p0}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_4a

    sget-object v1, Lv73;->l:Lnrl;

    goto :goto_4a

    :cond_2d
    iget p2, p2, Lro9;->b:I

    const/4 v0, 0x2

    if-lt p2, v0, :cond_3a

    iget p2, p1, Ltbf;->c:I

    invoke-static {p2, v0}, Lvep;->d(II)I

    move-result p2

    if-ltz p2, :cond_4a

    :cond_3a
    iget p2, p1, Ltbf;->c:I

    const/4 v0, 0x3

    invoke-static {p2, v0}, Lvep;->d(II)I

    move-result p2

    if-gez p2, :cond_48

    invoke-virtual {p0, p1}, Lv73;->k(Ltbf;)Lnrl;

    move-result-object v1

    goto :goto_4a

    :cond_48
    sget-object v1, Lv73;->o:Lnrl;

    :cond_4a
    :goto_4a
    :pswitch_4a
    return-object v1

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_4a
    .end packed-switch
.end method

.method public final i(Ltbf;Lro9;)Ltaf;
    .registers 4

    invoke-virtual {p0, p1}, Lv73;->j(Ltbf;)Ltaf;

    move-result-object p0

    iget-object v0, p1, Ltbf;->b:Lypm;

    iget-object v0, v0, Lypm;->g:Lzg;

    if-eqz v0, :cond_f

    sget-object v0, Ltaf;->a:Ltaf;

    if-eq p0, v0, :cond_f

    return-object v0

    :cond_f
    sget-object v0, Ltaf;->o:Ltaf;

    if-eq p0, v0, :cond_3b

    sget-object v0, Ltaf;->p:Ltaf;

    if-eq p0, v0, :cond_3b

    sget-object v0, Ltaf;->q:Ltaf;

    if-eq p0, v0, :cond_3b

    sget-object v0, Ltaf;->r:Ltaf;

    if-eq p0, v0, :cond_3b

    sget-object v0, Ltaf;->t:Ltaf;

    if-eq p0, v0, :cond_3b

    iget-object p0, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    sget-object p2, Ltaf;->M:Ltaf;

    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    iget-object p0, p1, Ltbf;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_38

    return-object p2

    :cond_38
    sget-object p0, Ltaf;->O:Ltaf;

    return-object p0

    :cond_3b
    invoke-static {p1}, Lv73;->l(Ltbf;)Ltaf;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ltbf;Lro9;)Lnrl;
    .registers 7

    iget-byte v0, p0, Lfq3;->K:B

    sget-object v1, Lv73;->m:Lnrl;

    packed-switch v0, :pswitch_data_5c

    return-object v1

    :pswitch_8
    const-wide/16 v2, 0x400

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_13

    sget-object v1, Lv73;->o:Lnrl;

    goto :goto_5a

    :cond_13
    const-wide/16 v2, 0x2

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-nez v0, :cond_36

    const-wide/16 v2, 0x4000

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-nez v0, :cond_36

    const-wide/16 v2, 0x20

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_36

    const-wide/16 v2, 0x10

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_36

    sget-object v1, Lv73;->q:Lnrl;

    goto :goto_5a

    :cond_36
    const-wide/16 v2, 0x40

    invoke-virtual {p1, v2, v3}, Ltbf;->b(J)Z

    move-result v0

    if-eqz v0, :cond_49

    iget-object p0, p0, Lv73;->b:Landroid/content/Context;

    invoke-static {p0}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_5a

    sget-object v1, Lv73;->l:Lnrl;

    goto :goto_5a

    :cond_49
    iget p2, p2, Lro9;->b:I

    const/4 v0, 0x2

    if-lt p2, v0, :cond_56

    iget p2, p1, Ltbf;->c:I

    invoke-static {p2, v0}, Lvep;->d(II)I

    move-result p2

    if-ltz p2, :cond_5a

    :cond_56
    invoke-virtual {p0, p1}, Lv73;->k(Ltbf;)Lnrl;

    move-result-object v1

    :cond_5a
    :goto_5a
    return-object v1

    nop

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
