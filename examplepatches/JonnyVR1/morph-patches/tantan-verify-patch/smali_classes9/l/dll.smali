.class public final synthetic Ll/dll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ell;


# direct methods
.method public synthetic constructor <init>(Ll/ell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dll;->a:Ll/ell;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dll;->a:Ll/ell;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-static {p0, p1}, Ll/ell;->a4(Ll/ell;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    return-void
.end method
