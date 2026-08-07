.class public final Ll/jpm0$a;
.super Ll/ef60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jpm0;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/jpm0$a",
        "Ll/ef60;",
        "",
        "position",
        "",
        "onPageSelected",
        "(I)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/jpm0;


# direct methods
.method public constructor <init>(Ll/jpm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jpm0$a;->a:Ll/jpm0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ef60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jpm0$a;->a:Ll/jpm0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/h3v;->h:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/tab/VoiceAuctionTabView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/tab/VoiceAuctionTabView;->d(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/jpm0$a;->a:Ll/jpm0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/jpm0;->y(Ll/jpm0;)Ll/iwr;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/iwr;->q(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
