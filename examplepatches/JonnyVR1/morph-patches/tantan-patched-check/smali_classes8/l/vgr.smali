.class public final synthetic Ll/vgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ahr;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikedUser;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgr;->a:Ll/ahr;

    iput-object p2, p0, Ll/vgr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    iput-object p3, p0, Ll/vgr;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iput p4, p0, Ll/vgr;->d:I

    iput p5, p0, Ll/vgr;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vgr;->a:Ll/ahr;

    iget-object v1, p0, Ll/vgr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    iget-object v2, p0, Ll/vgr;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iget v3, p0, Ll/vgr;->d:I

    iget v4, p0, Ll/vgr;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v5}, Ll/ahr;->H(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;IILcom/p1/mobile/putong/data/User;)V

    return-void
.end method
