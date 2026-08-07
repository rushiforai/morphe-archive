.class public final synthetic Ll/jhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikedUser;

.field public final synthetic c:Ll/ohr;

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;Ll/ohr;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jhr;->a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iput-object p2, p0, Ll/jhr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    iput-object p3, p0, Ll/jhr;->c:Ll/ohr;

    iput p4, p0, Ll/jhr;->d:I

    iput p5, p0, Ll/jhr;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jhr;->a:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    iget-object v1, p0, Ll/jhr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    iget-object v2, p0, Ll/jhr;->c:Ll/ohr;

    iget v3, p0, Ll/jhr;->d:I

    iget v4, p0, Ll/jhr;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v5}, Ll/ohr;->F(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;Ll/ohr;IILcom/p1/mobile/putong/data/User;)V

    return-void
.end method
