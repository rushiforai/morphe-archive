.class public final synthetic Ll/fhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/LikedUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fhr;->a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iput-object p2, p0, Ll/fhr;->b:Ll/y20;

    iput-object p3, p0, Ll/fhr;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fhr;->a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iget-object v1, p0, Ll/fhr;->b:Ll/y20;

    iget-object p0, p0, Ll/fhr;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->a(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V

    return-void
.end method
