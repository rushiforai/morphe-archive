.class public Ll/dyt;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeHeadItem;",
        ">;"
    }
.end annotation


# static fields
.field public static b:I


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dyt;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeHeadItem;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/dyt;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeHeadItem;->setText(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->N5:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    sget p0, Ll/dyt;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeHeadItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dyt;->H(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeHeadItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
