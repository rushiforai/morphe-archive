.class public Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/history/HistoryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HistoryEntryArrayBuilder"
.end annotation


# instance fields
.field public final a:[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array p1, p1, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    iput-object p1, p0, Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;->a:[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    return-void
.end method


# virtual methods
.method public final set(IJLjava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .registers 18
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/opera/android/history/b;

    move-object v1, p0

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    move-wide v6, p6

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lcom/opera/android/history/b;-><init>(Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    iget-object p0, p0, Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;->a:[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    aput-object v0, p0, p1

    return-void
.end method

.method public final toArray()[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;->a:[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    return-object p0
.end method
