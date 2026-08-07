.class public final synthetic Ll/ih2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yh2;

.field public final synthetic b:Ll/a5s;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Ll/yh2;Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ih2;->a:Ll/yh2;

    iput-object p2, p0, Ll/ih2;->b:Ll/a5s;

    iput-boolean p3, p0, Ll/ih2;->c:Z

    iput-object p4, p0, Ll/ih2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ih2;->a:Ll/yh2;

    iget-object v1, p0, Ll/ih2;->b:Ll/a5s;

    iget-boolean v2, p0, Ll/ih2;->c:Z

    iget-object p0, p0, Ll/ih2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/yh2;->V3(Ll/yh2;Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
