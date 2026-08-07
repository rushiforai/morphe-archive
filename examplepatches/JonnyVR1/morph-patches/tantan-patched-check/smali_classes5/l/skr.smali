.class public final synthetic Ll/skr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/skr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    iput-object p2, p0, Ll/skr;->b:Ll/x20;

    iput-boolean p3, p0, Ll/skr;->c:Z

    iput-object p4, p0, Ll/skr;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/skr;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/skr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    iget-object v1, p0, Ll/skr;->b:Ll/x20;

    iget-boolean v2, p0, Ll/skr;->c:Z

    iget-object v3, p0, Ll/skr;->d:Lcom/p1/mobile/putong/data/User;

    iget-object v4, p0, Ll/skr;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->c(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Landroid/view/View;)V

    return-void
.end method
