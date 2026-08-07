.class public final synthetic Ll/fao0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gao0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Ll/gao0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fao0;->a:Ll/gao0;

    iput-object p2, p0, Ll/fao0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fao0;->a:Ll/gao0;

    iget-object p0, p0, Ll/fao0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    check-cast p1, Ll/wao0;

    invoke-static {v0, p0, p1}, Ll/gao0;->J(Ll/gao0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/wao0;)V

    return-void
.end method
