.class public final synthetic Ll/dx5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dx5;->a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

    iput-object p2, p0, Ll/dx5;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    iput p3, p0, Ll/dx5;->c:I

    iput p4, p0, Ll/dx5;->d:I

    iput-object p5, p0, Ll/dx5;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dx5;->a:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;

    iget-object v1, p0, Ll/dx5;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    iget v2, p0, Ll/dx5;->c:I

    iget v3, p0, Ll/dx5;->d:I

    iget-object p0, p0, Ll/dx5;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)Ljava/net/Socket;

    move-result-object p0

    return-object p0
.end method
