.class public final synthetic Ll/fae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gae0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;


# direct methods
.method public synthetic constructor <init>(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fae0;->a:Ll/gae0;

    iput-object p2, p0, Ll/fae0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fae0;->a:Ll/gae0;

    iget-object p0, p0, Ll/fae0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;

    invoke-static {v0, p0}, Ll/gae0;->L3(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V

    return-void
.end method
