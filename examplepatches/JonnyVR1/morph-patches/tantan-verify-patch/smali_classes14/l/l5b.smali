.class public final synthetic Ll/l5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lrx/Notification;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Lcom/p1/mobile/putong/data/ConversationStatus;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/ConversationStatus;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/l5b;->b:Lrx/Notification;

    iput-object p3, p0, Ll/l5b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p4, p0, Ll/l5b;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/l5b;->e:Lcom/p1/mobile/putong/data/ConversationStatus;

    iput-boolean p6, p0, Ll/l5b;->f:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/l5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/l5b;->b:Lrx/Notification;

    iget-object v2, p0, Ll/l5b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object v3, p0, Ll/l5b;->d:Lcom/p1/mobile/putong/data/User;

    iget-object v4, p0, Ll/l5b;->e:Lcom/p1/mobile/putong/data/ConversationStatus;

    iget-boolean v5, p0, Ll/l5b;->f:Z

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z3(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/ConversationStatus;Z)V

    return-void
.end method
