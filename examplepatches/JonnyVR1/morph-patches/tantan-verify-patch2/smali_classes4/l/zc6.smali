.class public final synthetic Ll/zc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

.field public final synthetic b:Ljava/text/SimpleDateFormat;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/text/SimpleDateFormat;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    iput-object p2, p0, Ll/zc6;->b:Ljava/text/SimpleDateFormat;

    iput-wide p3, p0, Ll/zc6;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    iget-object v1, p0, Ll/zc6;->b:Ljava/text/SimpleDateFormat;

    iget-wide v2, p0, Ll/zc6;->c:J

    check-cast p1, Lcom/p1/mobile/putong/core/api/c0$b;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/text/SimpleDateFormat;JLcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method
