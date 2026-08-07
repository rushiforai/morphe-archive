.class public Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment$b;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/aej0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment;Ll/aej0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment$b;->a:Ll/aej0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment$b;->a:Ll/aej0;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;->b(Ll/aej0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->e6:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceFragment$b;->H(Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
