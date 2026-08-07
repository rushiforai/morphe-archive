.class Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4f$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/WebDNSHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebDnsEventFactory"
.end annotation


# instance fields
.field webDnsEventListener:Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventListener;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventListener;-><init>(Lcom/immomo/mmdns/WebDNSHandler$1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventFactory;->webDnsEventListener:Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventListener;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public create(Ll/ry3;)Ll/t4f;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mmdns/WebDNSHandler;->outEventFactroy:Ll/t4f$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/t4f$b;->create(Ll/ry3;)Ll/t4f;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    new-instance v0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventFactory;->webDnsEventListener:Lcom/immomo/mmdns/WebDNSHandler$WebDnsEventListener;

    .line 14
    .line 15
    invoke-direct {v0, p1, p0}, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;-><init>(Ll/t4f;Ll/t4f;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
