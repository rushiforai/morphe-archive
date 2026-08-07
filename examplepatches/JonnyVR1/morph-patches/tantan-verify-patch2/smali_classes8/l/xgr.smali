.class public final synthetic Ll/xgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ahr;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;


# direct methods
.method public synthetic constructor <init>(Ll/ahr;Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgr;->a:Ll/ahr;

    iput-object p2, p0, Ll/xgr;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/xgr;->c:I

    iput p4, p0, Ll/xgr;->d:I

    iput-object p5, p0, Ll/xgr;->e:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xgr;->a:Ll/ahr;

    iget-object v1, p0, Ll/xgr;->b:Lcom/p1/mobile/putong/data/User;

    iget v2, p0, Ll/xgr;->c:I

    iget v3, p0, Ll/xgr;->d:I

    iget-object v4, p0, Ll/xgr;->e:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static/range {v0 .. v5}, Ll/ahr;->I(Ll/ahr;Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method
