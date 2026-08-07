.class final Lcom/momo/xeengine/game/XEGameView$SafeArea;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/game/XEGameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SafeArea"
.end annotation


# instance fields
.field final safeH:F

.field final safeW:F

.field final safeX:F

.field final safeY:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/xeengine/game/XEGameView$SafeArea;->safeX:F

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/xeengine/game/XEGameView$SafeArea;->safeY:F

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/xeengine/game/XEGameView$SafeArea;->safeW:F

    .line 9
    .line 10
    iput p4, p0, Lcom/momo/xeengine/game/XEGameView$SafeArea;->safeH:F

    .line 11
    .line 12
    return-void
.end method
