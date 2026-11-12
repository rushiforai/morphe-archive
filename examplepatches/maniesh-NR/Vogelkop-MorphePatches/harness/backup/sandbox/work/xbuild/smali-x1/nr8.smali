.class public abstract Lnr8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:I


# instance fields
.field public final a:Lnrl;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lnr8;->a:Lnrl;

    return-void
.end method

.method public static e(Landroid/content/Context;)I
    .registers 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object p0

    iget p0, p0, Ltta;->a:I

    sget v0, Lnr8;->b:I

    if-ge v0, p0, :cond_e

    sput p0, Lnr8;->b:I

    return p0

    :cond_e
    return v0
.end method

.method public static g(Lmr8;Ltq8;)Lhq8;
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_39

    invoke-interface {p0, p1}, Lmr8;->d(Lhq8;)Z

    move-result v1

    if-eqz v1, :cond_a

    return-object p1

    :cond_a
    const/4 v1, 0x0

    :goto_b
    iget-object v2, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_39

    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    check-cast v2, Ltq8;

    invoke-static {p0, v2}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object v2

    goto :goto_33

    :cond_28
    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-interface {p0, v2}, Lmr8;->d(Lhq8;)Z

    move-result v3

    if-nez v3, :cond_33

    move-object v2, v0

    :cond_33
    :goto_33
    if-eqz v2, :cond_36

    return-object v2

    :cond_36
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_39
    return-object v0
.end method

.method public static h(Lei2;Ltq8;)Ljava/util/ArrayList;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_38

    const/4 v1, 0x0

    :goto_8
    iget-object v2, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_38

    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    check-cast v2, Ltq8;

    invoke-static {p0, v2}, Lnr8;->h(Lei2;Ltq8;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_35

    :cond_28
    invoke-virtual {p1, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-virtual {p0, v2}, Lei2;->d(Lhq8;)Z

    move-result v3

    if-eqz v3, :cond_35

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_35
    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_38
    return-object v0
.end method


# virtual methods
.method public final a(Lmzj;)J
    .registers 7

    iget-object v0, p1, Lmzj;->c:Landroid/graphics/Bitmap;

    iget-object v1, p1, Lmzj;->b:Ljava/lang/String;

    iget-object v2, p1, Lmzj;->a:Ljava/lang/String;

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-nez v0, :cond_c

    const/4 v0, 0x0

    goto :goto_11

    :cond_c
    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_11
    if-eqz v0, :cond_24

    const-string v3, "https://"

    invoke-static {v1}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v3

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, LJ/N;->MwmLujL6(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_24
    invoke-virtual {p0, v2, v1}, Lnr8;->b(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    new-instance p0, Lnzj;

    invoke-direct {p0, p1}, Lnzj;-><init>(Lmzj;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-wide v0
.end method

.method public abstract b(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method public final c(Ljava/lang/String;Lp6l;)Lhq8;
    .registers 5

    new-instance v0, La32;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, p2, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast p0, Lcom/opera/android/favorites/e;

    iget-object p0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v0, p0}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lhq8;Ltq8;I)V
    .registers 6

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result p0

    if-eqz p0, :cond_16

    check-cast p2, Lcom/opera/android/favorites/b;

    iget-object p0, p2, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    check-cast p1, Lcom/opera/android/favorites/b;

    iget-object p1, p1, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p3, p0, p1}, LJ/N;->Mv32kuYR(JIJ)V

    return-void

    :cond_16
    check-cast p2, Lcom/opera/android/favorites/b;

    iget-object p0, p2, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    check-cast p1, Lcom/opera/android/favorites/a;

    iget-object p1, p1, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p3, p0, p1}, LJ/N;->Mv32kuYR(JIJ)V

    return-void
.end method

.method public final f(Ljava/lang/Runnable;)V
    .registers 2

    iget-object p0, p0, Lnr8;->a:Lnrl;

    invoke-virtual {p0, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method
