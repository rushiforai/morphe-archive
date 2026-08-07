.class public final synthetic Ll/oll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rll;


# direct methods
.method public synthetic constructor <init>(Ll/rll;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oll;->a:Ll/rll;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oll;->a:Ll/rll;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-static {p0, p1}, Ll/rll;->Z3(Ll/rll;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    return-void
.end method
