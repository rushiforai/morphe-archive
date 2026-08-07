.class public final synthetic Ll/hil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kil;


# direct methods
.method public synthetic constructor <init>(Ll/kil;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hil;->a:Ll/kil;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hil;->a:Ll/kil;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    invoke-static {p0, p1}, Ll/kil;->L3(Ll/kil;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    return-void
.end method
