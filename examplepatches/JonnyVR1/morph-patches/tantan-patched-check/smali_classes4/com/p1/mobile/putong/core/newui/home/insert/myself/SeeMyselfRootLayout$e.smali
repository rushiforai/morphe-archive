.class public Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A(Ll/aoh0;Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(ILcom/p1/mobile/putong/data/Media;Z)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-le p2, p1, :cond_0

    .line 10
    .line 11
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->a:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p2, p3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C:Ll/mql;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p2, 0x1

    .line 45
    invoke-interface {p0, p1, p2}, Ll/mql;->a(IZ)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public f(IZ)V
    .locals 0

    .line 1
    return-void
.end method
