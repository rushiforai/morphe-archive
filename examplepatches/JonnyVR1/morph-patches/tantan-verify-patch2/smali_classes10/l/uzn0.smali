.class public Ll/uzn0;
.super Ll/dum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dum<",
        "Ll/jlm0;",
        ">;"
    }
.end annotation


# instance fields
.field public o:Ll/jlm0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/jlm0;Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 6

    .line 1
    const/4 v4, 0x1

    .line 2
    move-object v3, p1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/dum;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/oo2;Ll/ner;ZLcom/tantan/live/eventbus/LiveEventBus;)V

    .line 8
    .line 9
    .line 10
    iput-object v2, v0, Ll/uzn0;->o:Ll/jlm0;

    .line 11
    .line 12
    const-string p0, "p_anchor_audio_room"

    .line 13
    .line 14
    iput-object p0, v0, Ll/dum;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method
