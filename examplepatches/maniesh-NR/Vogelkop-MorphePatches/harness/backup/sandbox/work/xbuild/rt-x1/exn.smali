.class public abstract Lexn;
.super Ljxn;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/view/View;Ltzi;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lyzi;-><init>(Landroid/view/View;Ltzi;)V

    new-instance p2, Lpkm;

    const/16 v0, 0xf

    invoke-direct {p2, p0, v0}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzt;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v0}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public abstract k0()V
.end method

.method public l0()V
    .registers 3

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lcom/opera/android/history/g;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lyzi;->b:Ltzi;

    iget-object p0, p0, Ltzi;->a:Le5d;

    iget-object v0, v0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Le5d;->d(J)V

    return-void
.end method
