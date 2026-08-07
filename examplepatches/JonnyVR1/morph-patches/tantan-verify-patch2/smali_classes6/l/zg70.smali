.class public final synthetic Ll/zg70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zg70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zg70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    check-cast p1, Lcom/p1/mobile/android/app/Act$r;

    check-cast p2, Lcom/p1/mobile/android/app/Act$r;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/Act$r;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
