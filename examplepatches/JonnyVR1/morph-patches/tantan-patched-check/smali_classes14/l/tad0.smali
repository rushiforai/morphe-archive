.class public Ll/tad0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipTextItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tad0;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iput-object p1, p0, Ll/tad0;->a:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public H()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tad0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipTextItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipTextItemView;->o(Ll/tad0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->j1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipTextItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tad0;->I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipTextItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
