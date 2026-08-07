.class public final synthetic Ll/djg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjg;


# direct methods
.method public synthetic constructor <init>(Ll/fjg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/djg;->a:Ll/fjg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/djg;->a:Ll/fjg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    invoke-static {p0, p1}, Ll/fjg;->V3(Ll/fjg;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V

    return-void
.end method
