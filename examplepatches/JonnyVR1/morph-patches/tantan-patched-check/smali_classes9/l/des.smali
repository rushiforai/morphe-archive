.class public Ll/des;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/des;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->v3:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/des;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget v0, Ll/mdc0;->A2:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v1, p0, Ll/des;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "context_single_room"

    .line 22
    .line 23
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/mdc0;->G6:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lv/VText;

    .line 33
    .line 34
    iget-object p0, p0, Ll/des;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
