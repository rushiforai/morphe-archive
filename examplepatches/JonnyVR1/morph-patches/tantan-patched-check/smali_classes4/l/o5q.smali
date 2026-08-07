.class public final synthetic Ll/o5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

.field public final synthetic c:Ll/n100;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o5q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    iput-object p2, p0, Ll/o5q;->b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    iput-object p3, p0, Ll/o5q;->c:Ll/n100;

    iput-object p4, p0, Ll/o5q;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/o5q;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/o5q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    iget-object v1, p0, Ll/o5q;->b:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    iget-object v2, p0, Ll/o5q;->c:Ll/n100;

    iget-object v3, p0, Ll/o5q;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/o5q;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->b(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
