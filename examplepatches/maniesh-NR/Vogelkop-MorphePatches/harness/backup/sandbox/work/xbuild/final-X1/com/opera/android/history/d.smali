.class public final Lcom/opera/android/history/d;
.super Lzsi;
.source "SourceFile"


# instance fields
.field public final l:Lcom/opera/android/history/e;

.field public final m:Lshf;

.field public final n:Lorm;


# direct methods
.method public constructor <init>(Lcom/opera/android/history/e;Lorm;)V
    .registers 5

    sget-object v0, Lxda;->e:Lxda;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lzsi;-><init>(Lati;Lshf;Ljava/util/Locale;)V

    iput-object p1, p0, Lcom/opera/android/history/d;->l:Lcom/opera/android/history/e;

    iput-object v0, p0, Lcom/opera/android/history/d;->m:Lshf;

    iput-object p2, p0, Lcom/opera/android/history/d;->n:Lorm;

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;)Ljava/util/List;
    .registers 2

    check-cast p1, Lzda;

    if-eqz p1, :cond_2c

    instance-of p0, p1, Lcom/opera/android/history/c;

    if-eqz p0, :cond_1d

    check-cast p1, Lcom/opera/android/history/c;

    iget-object p0, p1, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1d
    instance-of p0, p1, Lyda;

    if-eqz p0, :cond_2c

    check-cast p1, Lyda;

    iget-object p0, p1, Lyda;->a:Ljz1;

    iget-object p0, p0, Ljz1;->c:Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_2c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Loy;->f:Ljava/lang/Object;

    check-cast v0, Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    if-eqz v0, :cond_12

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_12
    iget-object v0, p0, Lcom/opera/android/history/d;->m:Lshf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lshf;->S(Ljava/lang/Object;)V

    :cond_18
    invoke-super {p0}, Loy;->f()V

    return-void
.end method

.method public final h()V
    .registers 2

    const/4 v0, 0x2

    iget-object p0, p0, Lcom/opera/android/history/d;->n:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    return-void
.end method
