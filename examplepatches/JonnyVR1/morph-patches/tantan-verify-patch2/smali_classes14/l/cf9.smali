.class public final synthetic Ll/cf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/xf9;ILjava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cf9;->a:Ll/xf9;

    iput p2, p0, Ll/cf9;->b:I

    iput-object p3, p0, Ll/cf9;->c:Ljava/util/List;

    iput-object p4, p0, Ll/cf9;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cf9;->a:Ll/xf9;

    iget v1, p0, Ll/cf9;->b:I

    iget-object v2, p0, Ll/cf9;->c:Ljava/util/List;

    iget-object p0, p0, Ll/cf9;->d:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xf9;->j3(Ll/xf9;ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method
