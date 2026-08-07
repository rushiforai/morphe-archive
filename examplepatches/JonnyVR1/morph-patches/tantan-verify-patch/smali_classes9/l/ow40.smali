.class public Ll/ow40;
.super Ll/dum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dum<",
        "Ll/ou40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/pol;Ll/ou40;Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 6

    .line 1
    new-instance v3, Ll/f80;

    .line 2
    .line 3
    invoke-direct {v3, p2, p1}, Ll/f80;-><init>(Ll/pol;Ll/ner;)V

    .line 4
    .line 5
    .line 6
    const/4 v4, 0x0

    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p3

    .line 10
    move-object v5, p4

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/dum;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/oo2;Ll/ner;ZLcom/tantan/live/eventbus/LiveEventBus;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "p_user_live_room"

    .line 15
    .line 16
    iput-object p0, v0, Ll/dum;->e:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method
