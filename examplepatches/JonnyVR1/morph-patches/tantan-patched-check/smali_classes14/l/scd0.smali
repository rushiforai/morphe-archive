.class public Ll/scd0;
.super Ll/e9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e9d0<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightNormalTypeView;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/j9d0;

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/j9d0;Ljava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;",
            "Ll/j9d0;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/scd0;->e:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/scd0;->f:Ll/j9d0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/scd0;->g:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/scd0;->h:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/scd0;->i:Z

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ll/j9d0;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;",
            "Ll/j9d0;",
            "ZZ)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 16
    iput-object p1, p0, Ll/scd0;->e:Ljava/util/List;

    .line 17
    iput-object p2, p0, Ll/scd0;->f:Ll/j9d0;

    .line 18
    iput-boolean p3, p0, Ll/scd0;->h:Z

    .line 19
    iput-boolean p4, p0, Ll/scd0;->i:Z

    return-void
.end method

.method public static synthetic H(Ll/e9d0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/e9d0;->b:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public I()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/scd0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/scd0;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/rcd0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/rcd0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightNormalTypeView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/scd0;->f:Ll/j9d0;

    .line 5
    .line 6
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightNormalTypeView;->o0(Ll/scd0;Ll/j9d0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->r1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightNormalTypeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/scd0;->J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightNormalTypeView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
