.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/data/User;

.field public final b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;->b:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(ZLl/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "profile"

    .line 13
    .line 14
    :goto_0
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    invoke-static {v0}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 v2, 0x1

    .line 44
    if-ne p1, v2, :cond_2

    .line 45
    .line 46
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->LOW:Lcom/facebook/imagepipeline/common/Priority;

    .line 50
    .line 51
    :goto_1
    invoke-virtual {v1, v0, p1, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->p0(Ljava/util/Collection;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/yx90;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/yx90;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    const-string p0, ""

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string p0, "profile"

    .line 39
    .line 40
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 51
    .line 52
    invoke-virtual {p2, p1, v0, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;->b:Z

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder$d;->b(Lcom/p1/mobile/putong/data/User;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
