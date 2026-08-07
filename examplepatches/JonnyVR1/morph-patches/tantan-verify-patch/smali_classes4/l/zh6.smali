.class public final synthetic Ll/zh6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iput-object p2, p0, Ll/zh6;->b:Ll/y20;

    iput-object p3, p0, Ll/zh6;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p4, p0, Ll/zh6;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/zh6;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/zh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iget-object v1, p0, Ll/zh6;->b:Ll/y20;

    iget-object v2, p0, Ll/zh6;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v3, p0, Ll/zh6;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/zh6;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->l(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
