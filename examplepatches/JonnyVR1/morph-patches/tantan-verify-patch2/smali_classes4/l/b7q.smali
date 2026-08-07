.class public final synthetic Ll/b7q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/ChallengeMsg;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b7q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

    iput-object p2, p0, Ll/b7q;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/b7q;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/b7q;->d:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b7q;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

    iget-object v1, p0, Ll/b7q;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/b7q;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/b7q;->d:Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Landroid/view/View;)V

    return-void
.end method
