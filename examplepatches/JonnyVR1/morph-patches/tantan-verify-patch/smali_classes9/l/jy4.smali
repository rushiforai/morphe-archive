.class public final synthetic Ll/jy4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jy4;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jy4;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    check-cast p1, Ll/d3q;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->s(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/d3q;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
