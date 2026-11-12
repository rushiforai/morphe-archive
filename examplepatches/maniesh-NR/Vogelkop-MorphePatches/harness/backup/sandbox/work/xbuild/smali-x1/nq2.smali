.class public final Lnq2;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final a:Ldx3;

.field public final b:I

.field public final c:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final d:Liz9;

.field public final e:Lzy9;

.field public f:Z

.field public g:Lmq2;

.field public h:Ljava/util/List;


# direct methods
.method public constructor <init>(Ldx3;ILcom/opera/android/browser/chromium/ChromiumContent;Liz9;Lzy9;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnq2;->a:Ldx3;

    iput p2, p0, Lnq2;->b:I

    iput-object p3, p0, Lnq2;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p4, p0, Lnq2;->d:Liz9;

    iput-object p5, p0, Lnq2;->e:Lzy9;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lnq2;->h:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final b(Ljava/util/List;)V
    .registers 4

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b
    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru2;

    invoke-static {v1}, Lj14;->G(Lru2;)Lru2;

    move-result-object v1

    if-eqz v1, :cond_b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_21
    iput-object v0, p0, Lnq2;->h:Ljava/util/List;

    iget-object p0, p0, Lnq2;->g:Lmq2;

    if-eqz p0, :cond_2a

    invoke-virtual {p0, v0}, Lmq2;->d(Ljava/util/List;)V

    :cond_2a
    return-void
.end method

.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 11

    new-instance v0, Lmq2;

    iget-object v6, p0, Lnq2;->d:Liz9;

    iget-object v7, p0, Lnq2;->h:Ljava/util/List;

    iget-object v1, p0, Lnq2;->a:Ldx3;

    iget-object v3, p0, Lnq2;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v4, p0, Lnq2;->e:Lzy9;

    iget v5, p0, Lnq2;->b:I

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lmq2;-><init>(Ldx3;Lmej;Lcom/opera/android/browser/chromium/ChromiumContent;Lzy9;ILiz9;Ljava/util/List;)V

    iput-object v0, p0, Lnq2;->g:Lmq2;

    iget-object p1, p0, Lnq2;->h:Ljava/util/List;

    invoke-virtual {v0, p1}, Lmq2;->d(Ljava/util/List;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lnq2;->f:Z

    return-object v0
.end method

.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 4

    new-instance p0, Lvq3;

    const v0, 0x7f150199

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lvq3;-><init>(Landroid/content/Context;IZ)V

    return-object p0
.end method

.method public final onFinished(Lhjm;)V
    .registers 8

    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    iget-object p1, p0, Lnq2;->e:Lzy9;

    iget-object p1, p1, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lrq2;

    iget-object v0, p1, Lrq2;->f:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :cond_10
    :goto_10
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpu2;

    iget-object v0, v0, Lpu2;->a:Lcom/opera/android/browser/autofill/AutofillPopupView;

    iget-wide v2, v0, Lcom/opera/android/browser/autofill/AutofillPopupView;->a:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_10

    invoke-static {v2, v3}, LJ/N;->MO_yHnir(J)V

    goto :goto_10

    :cond_2a
    const/4 v0, 0x0

    iput-object v0, p1, Lrq2;->h:Lnq2;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lnq2;->f:Z

    return-void
.end method
