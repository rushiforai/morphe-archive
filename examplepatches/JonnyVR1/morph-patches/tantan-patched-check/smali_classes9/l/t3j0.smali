.class public final synthetic Ll/t3j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

.field public final synthetic b:J

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;JF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t3j0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    iput-wide p2, p0, Ll/t3j0;->b:J

    iput p4, p0, Ll/t3j0;->c:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t3j0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    iget-wide v1, p0, Ll/t3j0;->b:J

    iget p0, p0, Ll/t3j0;->c:F

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->j0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;JF)V

    return-void
.end method
