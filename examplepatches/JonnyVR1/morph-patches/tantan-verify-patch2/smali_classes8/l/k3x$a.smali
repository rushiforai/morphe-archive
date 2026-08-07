.class public Ll/k3x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k3x;->y(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/k3x;


# direct methods
.method public constructor <init>(Ll/k3x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k3x$a;->a:Ll/k3x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/k3x$a;->a:Ll/k3x;

    .line 3
    .line 4
    iget-object v1, v1, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/k3x$a;->a:Ll/k3x;

    .line 13
    .line 14
    iget-object v1, v1, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/k3x$a;->a:Ll/k3x;

    .line 3
    .line 4
    iget-object v1, v1, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/k3x$a;->a:Ll/k3x;

    .line 13
    .line 14
    iget-object v1, v1, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method
