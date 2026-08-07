.class public final synthetic Ll/qs2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rs2;

.field public final synthetic b:Ll/rwn0;


# direct methods
.method public synthetic constructor <init>(Ll/rs2;Ll/rwn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qs2;->a:Ll/rs2;

    iput-object p2, p0, Ll/qs2;->b:Ll/rwn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qs2;->a:Ll/rs2;

    iget-object p0, p0, Ll/qs2;->b:Ll/rwn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0, p1}, Ll/rs2;->a(Ll/rs2;Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
