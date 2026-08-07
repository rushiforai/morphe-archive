.class public final synthetic Ll/kll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lll;


# direct methods
.method public synthetic constructor <init>(Ll/lll;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kll;->a:Ll/lll;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kll;->a:Ll/lll;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-static {p0, p1}, Ll/lll;->L3(Ll/lll;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    return-void
.end method
