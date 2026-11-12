.class public final Lcom/opera/android/history/HistoryManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;,
        Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;
    }
.end annotation


# instance fields
.field public a:J

.field public final b:Lcom/opera/android/history/a;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, LJ/N;->MTCPSh8F()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/history/HistoryManager;->a:J

    new-instance v0, Lcom/opera/android/history/a;

    invoke-direct {v0, p0}, Lcom/opera/android/history/a;-><init>(Lcom/opera/android/history/HistoryManager;)V

    iput-object v0, p0, Lcom/opera/android/history/HistoryManager;->b:Lcom/opera/android/history/a;

    return-void
.end method

.method public static run(Ljava/lang/Runnable;)V
    .registers 1
    .param p0    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_5
    return-void
.end method
