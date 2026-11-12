.class public final Lcom/opera/android/history/g;
.super Lvtn;
.source "SourceFile"

# interfaces
.implements Laca;


# instance fields
.field public final a:Lcom/opera/android/history/c;

.field public final b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

.field public final c:Ljava/lang/String;

.field public final d:Lj4c;

.field public final e:Lj4c;

.field public f:Lwtn;


# direct methods
.method public constructor <init>(Lcom/opera/android/history/c;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    iget-object p1, p1, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    iput-object p1, p0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p1}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->a()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/history/g;->c:Ljava/lang/String;

    new-instance p1, Lxtn;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lxtn;-><init>(Lcom/opera/android/history/g;B)V

    new-instance v0, Lj4c;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object v0, p0, Lcom/opera/android/history/g;->d:Lj4c;

    new-instance p1, Lxtn;

    invoke-direct {p1, p0, v1}, Lxtn;-><init>(Lcom/opera/android/history/g;B)V

    new-instance v0, Lj4c;

    invoke-direct {v0, p1, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object v0, p0, Lcom/opera/android/history/g;->e:Lj4c;

    return-void
.end method


# virtual methods
.method public final a()Lzda;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/g;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final c()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public final d()Lutn;
    .registers 1

    sget-object p0, Lutn;->c:Lutn;

    return-object p0
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/history/g;->f:Lwtn;

    return-void
.end method
