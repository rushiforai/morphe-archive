.class public Ll/y7e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mtl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/dw40;",
        ">",
        "Ljava/lang/Object;",
        "Ll/mtl;"
    }
.end annotation


# instance fields
.field public a:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "TD;>;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/y7e;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ll/y7e;->a:Ll/dum;

    .line 7
    .line 8
    iput-object p2, p0, Ll/y7e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/ck2;)Ll/ck2;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/p8e;

    .line 4
    .line 5
    iget-object v0, p0, Ll/y7e;->a:Ll/dum;

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ll/p8e;-><init>(Ll/dum;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/y7e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/p8e;->U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 13
    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_0
    instance-of v0, p1, Ll/p8e;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    move-object v0, p1

    .line 21
    check-cast v0, Ll/p8e;

    .line 22
    .line 23
    iget-object p0, p0, Ll/y7e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/p8e;->U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_1
    new-instance p1, Ll/p8e;

    .line 30
    .line 31
    iget-object v0, p0, Ll/y7e;->a:Ll/dum;

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ll/p8e;-><init>(Ll/dum;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/y7e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ll/p8e;->U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 39
    .line 40
    .line 41
    return-object p1
.end method

.method public type()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
