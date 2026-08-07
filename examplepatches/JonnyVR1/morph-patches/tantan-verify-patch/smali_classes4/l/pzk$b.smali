.class public Ll/pzk$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pzk;->h0(Ll/aoh0;)V
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
    iput-object p1, p0, Ll/pzk$b;->a:Ll/pzk;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pzk;->Q(Ll/pzk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 p1, -0x40400000    # -1.5f

    .line 9
    .line 10
    :goto_0
    invoke-static {p0, p1}, Ll/pzk;->S(Ll/pzk;F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d(ILcom/p1/mobile/putong/data/Media;Z)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 2
    .line 3
    iget-object p2, p2, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->o(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 10
    .line 11
    iget-object p2, p1, Ll/pzk;->x:Lv/VLinear;

    .line 12
    .line 13
    invoke-static {p1}, Ll/pzk;->O(Ll/pzk;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 21
    .line 22
    invoke-static {p1}, Ll/pzk;->R(Ll/pzk;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 26
    .line 27
    invoke-static {p0}, Ll/pzk;->T(Ll/pzk;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 3
    .line 4
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e2:Lcom/p1/mobile/putong/core/api/l;

    .line 7
    .line 8
    iget-object p0, p0, Ll/pzk$b;->a:Ll/pzk;

    .line 9
    .line 10
    invoke-static {p0}, Ll/pzk;->P(Ll/pzk;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/l;->x3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :catch_0
    :cond_0
    return p1
.end method

.method public f(IZ)V
    .locals 0

    .line 1
    return-void
.end method
