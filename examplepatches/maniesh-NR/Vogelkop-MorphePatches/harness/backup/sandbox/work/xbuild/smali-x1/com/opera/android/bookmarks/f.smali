.class public final Lcom/opera/android/bookmarks/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/opera/android/bookmarks/h;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bookmarks/f;->a:Lcom/opera/android/bookmarks/h;

    return-void
.end method

.method public static a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
    .registers 6

    const/4 v0, 0x0

    :goto_1
    int-to-long v1, v0

    iget-wide v3, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v3, v4}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v3

    cmp-long v3, v1, v3

    if-gez v3, :cond_1c

    invoke-virtual {p0, v1, v2}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v1

    iget-wide v2, v1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v2, v3}, LJ/N;->MIH0RDIG(J)Z

    move-result v2

    if-nez v2, :cond_19

    return-object v1

    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1c
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-object p0, p0, Lcom/opera/android/bookmarks/f;->a:Lcom/opera/android/bookmarks/h;

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_6
    iput-boolean v1, v0, Lcom/opera/android/bookmarks/g;->a:Z

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    iget-object v4, v3, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-static {v4}, Lcom/opera/android/bookmarks/f;->a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v5

    :goto_12
    if-eqz v5, :cond_2b

    invoke-static {p0, v5}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object v5

    invoke-interface {v5}, Lol3;->g()Z

    move-result v6

    if-nez v6, :cond_22

    iget-object v6, v3, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v6, :cond_23

    :cond_22
    move-object v6, v4

    :cond_23
    invoke-static {v5, v6, v1}, Lcom/opera/android/bookmarks/c;->n(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    invoke-static {v4}, Lcom/opera/android/bookmarks/f;->a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v5
    :try_end_2a
    .catchall {:try_start_6 .. :try_end_2a} :catchall_2e

    goto :goto_12

    :cond_2b
    iput-boolean v2, v0, Lcom/opera/android/bookmarks/g;->a:Z

    return-void

    :catchall_2e
    move-exception p0

    iput-boolean v2, v0, Lcom/opera/android/bookmarks/g;->a:Z

    throw p0
.end method
