.class public final synthetic Ll/yd6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yd6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    iput-object p2, p0, Ll/yd6;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yd6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    iget-object p0, p0, Ll/yd6;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->C1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/util/ArrayList;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
