.class public final synthetic Ll/h3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action2;


# instance fields
.field public final synthetic a:Ll/t3r;


# direct methods
.method public synthetic constructor <init>(Ll/t3r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h3r;->a:Ll/t3r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h3r;->a:Ll/t3r;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ll/t3r;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    return-void
.end method
