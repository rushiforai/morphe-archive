.class public Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lol3;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/bookmarks/BookmarksBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookmarkNode"
.end annotation


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->Mzrfke01(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz v0, :cond_10

    check-cast p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    iget-wide p0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    cmp-long p0, p0, v0

    if-nez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MIH0RDIG(J)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method

.method public final j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1, p1, p2}, LJ/N;->M9PJ8BaX(JJ)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    return-object p0
.end method

.method public final k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z
    .registers 4

    if-eqz p1, :cond_e

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    iget-wide p0, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1, p0, p1}, LJ/N;->MRvTVnzt(JJ)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
