.class public final Lcom/opera/android/bookmarks/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lus8;


# instance fields
.field public final synthetic a:Lcom/opera/android/bookmarks/h;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bookmarks/e;->a:Lcom/opera/android/bookmarks/h;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/bookmarks/e;->a:Lcom/opera/android/bookmarks/h;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->i:Lcom/opera/android/bookmarks/c;

    return-void
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/bookmarks/e;->a:Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->r()V

    return-void
.end method
