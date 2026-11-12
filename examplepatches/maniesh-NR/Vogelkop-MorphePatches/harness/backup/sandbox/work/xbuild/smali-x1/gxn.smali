.class public final synthetic Lgxn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhxn;


# direct methods
.method public synthetic constructor <init>(Lhxn;B)V
    .registers 3

    iput-byte p2, p0, Lgxn;->a:B

    iput-object p1, p0, Lgxn;->b:Lhxn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lgxn;->a:B

    iget-object p0, p0, Lgxn;->b:Lhxn;

    packed-switch v0, :pswitch_data_32

    iget-object p1, p0, Ljxn;->f:Lvtn;

    check-cast p1, Lcom/opera/android/history/g;

    if-eqz p1, :cond_1d

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    iget-object p1, p1, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p1}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Le5d;->d(J)V

    invoke-virtual {p0}, Lhxn;->h0()V

    :cond_1d
    return-void

    :pswitch_1e
    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lcom/opera/android/history/g;

    if-eqz v0, :cond_31

    iget-object p0, p0, Lhxn;->h:Lztn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lcom/opera/android/history/h;

    invoke-direct {v1, p0, v0}, Lcom/opera/android/history/h;-><init>(Lztn;Lcom/opera/android/history/g;)V

    invoke-virtual {v1, p1}, Lo73;->p(Landroid/view/View;)V

    :cond_31
    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
