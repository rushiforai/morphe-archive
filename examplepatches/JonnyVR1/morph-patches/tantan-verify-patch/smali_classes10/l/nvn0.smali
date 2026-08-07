.class public final synthetic Ll/nvn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ovn0;


# direct methods
.method public synthetic constructor <init>(Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nvn0;->a:Ll/ovn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvn0;->a:Ll/ovn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {p0, p1}, Ll/ovn0;->f(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
