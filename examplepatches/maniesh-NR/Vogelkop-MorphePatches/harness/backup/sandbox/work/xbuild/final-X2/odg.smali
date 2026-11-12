.class public final Lodg;
.super Lv73;
.source "SourceFile"


# instance fields
.field public final K:Lcrk;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lcrk;Lin3;Lk5o;Likc;Lu0a;)V
    .registers 23

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    invoke-direct/range {v0 .. v10}, Lv73;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)V

    move-object/from16 p1, p7

    iput-object p1, p0, Lodg;->K:Lcrk;

    return-void
.end method


# virtual methods
.method public final h(Ltbf;Lro9;)Lnrl;
    .registers 5

    iget-object p2, p0, Lodg;->K:Lcrk;

    iget-object p2, p2, Lcrk;->b:Ljava/lang/Object;

    const-wide/16 v0, 0x20

    invoke-virtual {p1, v0, v1}, Ltbf;->b(J)Z

    move-result p2

    if-eqz p2, :cond_14

    const-wide/16 v0, 0x10

    invoke-virtual {p1, v0, v1}, Ltbf;->b(J)Z

    move-result p2

    if-nez p2, :cond_1c

    :cond_14
    const-wide/16 v0, 0x40

    invoke-virtual {p1, v0, v1}, Ltbf;->b(J)Z

    move-result p2

    if-nez p2, :cond_1f

    :cond_1c
    sget-object p0, Lv73;->n:Lnrl;

    return-object p0

    :cond_1f
    invoke-virtual {p1, v0, v1}, Ltbf;->b(J)Z

    move-result p2

    if-eqz p2, :cond_36

    invoke-virtual {p0}, Lv73;->c()Z

    move-result p0

    if-eqz p0, :cond_36

    const-wide/16 v0, 0x100

    invoke-virtual {p1, v0, v1}, Ltbf;->b(J)Z

    move-result p0

    if-eqz p0, :cond_36

    sget-object p0, Lv73;->l:Lnrl;

    return-object p0

    :cond_36
    sget-object p0, Lv73;->m:Lnrl;

    return-object p0
.end method

.method public final i(Ltbf;Lro9;)Ltaf;
    .registers 4

    invoke-virtual {p0, p1}, Lodg;->j(Ltbf;)Ltaf;

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

.method public final j(Ltbf;)Ltaf;
    .registers 3

    invoke-virtual {p0, p1}, Lv73;->d(Ltbf;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, p1}, Lv73;->b(Ltbf;)Ltaf;

    move-result-object p0

    return-object p0

    :cond_b
    iget-object v0, p1, Ltbf;->b:Lypm;

    iget-boolean v0, v0, Lypm;->h:Z

    if-nez v0, :cond_1e

    iget-object p0, p0, Lv73;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "compression"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1e

    sget-object p0, Ltaf;->t:Ltaf;

    return-object p0

    :cond_1e
    iget-object p0, p1, Ltbf;->b:Lypm;

    iget-object v0, p0, Lypm;->g:Lzg;

    if-eqz v0, :cond_27

    sget-object p0, Ltaf;->a:Ltaf;

    return-object p0

    :cond_27
    iget-boolean p0, p0, Lypm;->i:Z

    if-eqz p0, :cond_2e

    sget-object p0, Ltaf;->s:Ltaf;

    return-object p0

    :cond_2e
    iget-object p0, p1, Ltbf;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_39

    sget-object p0, Ltaf;->M:Ltaf;

    return-object p0

    :cond_39
    sget-object p0, Ltaf;->O:Ltaf;

    return-object p0
.end method

.method public final n(Ltbf;)Ltaf;
    .registers 3

    invoke-virtual {p0, p1}, Lodg;->j(Ltbf;)Ltaf;

    move-result-object p0

    sget-object v0, Ltaf;->O:Ltaf;

    if-eq p0, v0, :cond_9

    return-object v0

    :cond_9
    invoke-static {p1}, Lv73;->l(Ltbf;)Ltaf;

    move-result-object p0

    return-object p0
.end method
