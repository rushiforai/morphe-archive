.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

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
    invoke-static {}, Ll/xra;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ge v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-static {}, Ll/xra;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ge v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->u(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
