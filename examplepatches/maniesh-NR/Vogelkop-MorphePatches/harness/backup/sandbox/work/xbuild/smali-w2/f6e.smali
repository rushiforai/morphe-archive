.class public final Lf6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:Lzwk;

.field public final synthetic b:Lcom/opera/android/bookmarks/h;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;Lzwk;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lf6e;->a:Lzwk;

    iput-object p1, p0, Lf6e;->b:Lcom/opera/android/bookmarks/h;

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 3

    new-instance v0, Lcom/opera/android/bookmarks/e;

    iget-object v1, p0, Lf6e;->b:Lcom/opera/android/bookmarks/h;

    invoke-direct {v0, v1}, Lcom/opera/android/bookmarks/e;-><init>(Lcom/opera/android/bookmarks/h;)V

    invoke-static {v0}, Lcom/opera/android/favorites/FavoritesBridge;->a(Lus8;)V

    invoke-static {}, LJ/N;->MyZx5kBs()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->r()V

    :cond_13
    iget-object v0, p0, Lf6e;->a:Lzwk;

    invoke-virtual {v0, p0}, Lzwk;->j(Lywk;)V

    return-void
.end method

.method public final G(I)V
    .registers 2

    return-void
.end method
