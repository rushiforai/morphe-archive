.class public final synthetic Ll/si6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/si6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iput-object p2, p0, Ll/si6;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/si6;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/si6;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/si6;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-boolean p6, p0, Ll/si6;->f:Z

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/si6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iget-object v1, p0, Ll/si6;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/si6;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/si6;->d:Lcom/p1/mobile/putong/data/User;

    iget-object v4, p0, Ll/si6;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-boolean v5, p0, Ll/si6;->f:Z

    move-object v6, p1

    move-object v7, p2

    move v8, p3

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;ZLv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
