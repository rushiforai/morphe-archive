.class public Lcom/opera/android/favorites/FavoritesBridge$Folder;
.super Lcom/opera/android/favorites/FavoritesBridge$Favorite;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/favorites/FavoritesBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Folder"
.end annotation


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/favorites/FavoritesBridge$Favorite;-><init>(J)V

    return-void
.end method
