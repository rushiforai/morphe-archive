.class public final synthetic Ll/dhq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dhq;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;

    iput-object p2, p0, Ll/dhq;->b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dhq;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;

    iget-object p0, p0, Ll/dhq;->b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemTestChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Landroid/view/View;)V

    return-void
.end method
