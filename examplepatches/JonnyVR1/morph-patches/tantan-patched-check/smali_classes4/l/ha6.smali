.class public final synthetic Ll/ha6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/text/SimpleDateFormat;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ljava/text/SimpleDateFormat;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ha6;->a:Ljava/text/SimpleDateFormat;

    iput-wide p2, p0, Ll/ha6;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ha6;->a:Ljava/text/SimpleDateFormat;

    iget-wide v1, p0, Ll/ha6;->b:J

    check-cast p1, Ll/orl;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b1(Ljava/text/SimpleDateFormat;JLl/orl;)V

    return-void
.end method
