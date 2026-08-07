.class public Ll/pai$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pai;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

.field public final synthetic b:Ll/pai;


# direct methods
.method public constructor <init>(Ll/pai;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pai$a;->b:Ll/pai;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pai$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pai$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->g2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
