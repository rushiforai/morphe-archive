.class public final Lcom/opera/android/bookmarks/BookmarksImporterBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkm3;


# direct methods
.method public constructor <init>(Lkm3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bookmarks/BookmarksImporterBridge;->a:Lkm3;

    return-void
.end method


# virtual methods
.method public final importCallback(IJ)V
    .registers 5

    const/4 v0, 0x1

    iget-object p0, p0, Lcom/opera/android/bookmarks/BookmarksImporterBridge;->a:Lkm3;

    if-ne p1, v0, :cond_9

    invoke-interface {p0, p2, p3}, Lkm3;->e(J)V

    return-void

    :cond_9
    const/4 p2, 0x2

    if-ne p1, p2, :cond_13

    sget-object p1, Lnl3;->e:Lnl3;

    iget p1, p1, Lnl3;->a:I

    invoke-interface {p0, p1}, Lkm3;->a(I)V

    :cond_13
    return-void
.end method
