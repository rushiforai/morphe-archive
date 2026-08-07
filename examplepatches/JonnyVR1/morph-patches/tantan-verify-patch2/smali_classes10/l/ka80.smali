.class public Ll/ka80;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "*>;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

.field public final c:Ljava/lang/String;

.field public final d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ka80;->a:Ll/dum;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ka80;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ka80;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ka80;->d:Ll/z20;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "query"

    .line 5
    .line 6
    iget-object v1, p0, Ll/ka80;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/ka80;->a:Ll/dum;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ka80;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    .line 17
    .line 18
    iget-object p0, p0, Ll/ka80;->d:Ll/z20;

    .line 19
    .line 20
    invoke-virtual {p1, v1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->d(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Ll/ka80;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    .line 25
    .line 26
    iget-object p0, p0, Ll/ka80;->d:Ll/z20;

    .line 27
    .line 28
    invoke-virtual {p1, v1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->F3:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ka80;->H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
