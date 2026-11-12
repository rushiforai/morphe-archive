.class public Lcom/opera/android/favorites/FavoritesBridge$Favorite;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/favorites/FavoritesBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Favorite"
.end annotation


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    if-eqz v0, :cond_10

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    cmp-long p0, p0, v0

    if-nez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method
