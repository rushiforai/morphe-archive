.class public final synthetic Ll/nh6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iput-object p2, p0, Ll/nh6;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/nh6;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iget-object v1, p0, Ll/nh6;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/nh6;->c:Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->P(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
