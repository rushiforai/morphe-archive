.class public final synthetic Ll/tn20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tn20;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    iput-object p2, p0, Ll/tn20;->b:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tn20;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    iget-object p0, p0, Ll/tn20;->b:Landroid/net/Uri;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->k2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/net/Uri;Landroid/util/Pair;)V

    return-void
.end method
