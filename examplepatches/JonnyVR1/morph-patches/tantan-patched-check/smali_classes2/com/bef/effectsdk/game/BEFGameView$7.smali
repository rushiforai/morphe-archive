.class Lcom/bef/effectsdk/game/BEFGameView$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/game/BEFGameView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/game/BEFGameView;

.field final synthetic val$idsParam:[I

.field final synthetic val$xsParam:[F

.field final synthetic val$ysParam:[F


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/game/BEFGameView;[I[F[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$idsParam:[I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$xsParam:[F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$ysParam:[F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/bef/effectsdk/game/BEFGameView;->mHandle:J

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$idsParam:[I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$xsParam:[F

    .line 8
    .line 9
    iget-object p0, p0, Lcom/bef/effectsdk/game/BEFGameView$7;->val$ysParam:[F

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/bef/effectsdk/game/NativeInterface;->touchesMove(J[I[F[F)I

    .line 12
    .line 13
    .line 14
    return-void
.end method
