.class public final Lcom/opera/android/history/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/opera/android/history/HistoryManager$HistoryEntryArrayBuilder;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcom/opera/android/history/b;->a:J

    iput-object p4, p0, Lcom/opera/android/history/b;->b:Ljava/lang/String;

    iput-object p5, p0, Lcom/opera/android/history/b;->c:Ljava/lang/String;

    iput-wide p6, p0, Lcom/opera/android/history/b;->d:J

    iput-object p8, p0, Lcom/opera/android/history/b;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/b;->e:Ljava/lang/String;

    return-object p0
.end method

.method public final b()J
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/history/b;->d:J

    return-wide v0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/history/b;->a:J

    return-wide v0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/b;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/b;->b:Ljava/lang/String;

    return-object p0
.end method
