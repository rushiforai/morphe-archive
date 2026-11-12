.class public final Lcom/opera/android/history/a;
.super Lekc;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic l:Lcom/opera/android/history/HistoryManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/history/HistoryManager;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/history/a;->l:Lcom/opera/android/history/HistoryManager;

    invoke-direct {p0}, Lekc;-><init>()V

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/history/a;->l:Lcom/opera/android/history/HistoryManager;

    iget-wide v1, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v1, v2, p0}, LJ/N;->MvugT_yT(JLjava/lang/Object;)V

    const/4 p0, 0x1

    iget-wide v0, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v0, v1, p0}, LJ/N;->MjxAAgw2(JZ)V

    return-void
.end method

.method public final m()V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/history/a;->l:Lcom/opera/android/history/HistoryManager;

    iget-wide v1, v0, Lcom/opera/android/history/HistoryManager;->a:J

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, LJ/N;->MvugT_yT(JLjava/lang/Object;)V

    const/4 v1, 0x0

    iget-wide v4, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v4, v5, v1}, LJ/N;->MjxAAgw2(JZ)V

    invoke-virtual {p0, v3}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
