.class public final synthetic Ll/p5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    iput-object p2, p0, Ll/p5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/p5q;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p5q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    iget-object v1, p0, Ll/p5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/p5q;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
