.class public final synthetic Ll/rx90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;Lcom/p1/mobile/putong/core/ui/PictureView;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rx90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;

    iput-object p2, p0, Ll/rx90;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-boolean p3, p0, Ll/rx90;->c:Z

    iput-boolean p4, p0, Ll/rx90;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rx90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;

    iget-object v1, p0, Ll/rx90;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-boolean v2, p0, Ll/rx90;->c:Z

    iget-boolean p0, p0, Ll/rx90;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;->w(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$c;Lcom/p1/mobile/putong/core/ui/PictureView;ZZLandroid/view/View;)V

    return-void
.end method
