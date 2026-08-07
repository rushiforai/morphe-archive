.class public final synthetic Ll/cx5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx5;->a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

    iput-object p2, p0, Ll/cx5;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cx5;->a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

    iget-object p0, p0, Ll/cx5;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->b(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
