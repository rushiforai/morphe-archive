.class public Ll/pzk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pzk;->e0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pzk;


# direct methods
.method public constructor <init>(Ll/pzk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzk$a;->a:Ll/pzk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzk$a;->a:Ll/pzk;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/pzk$a;->a:Ll/pzk;

    .line 12
    .line 13
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->r()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setCardStyleChangeProgress(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
