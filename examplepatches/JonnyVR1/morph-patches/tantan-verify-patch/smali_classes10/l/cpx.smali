.class public final synthetic Ll/cpx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/epx;


# direct methods
.method public synthetic constructor <init>(Ll/epx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cpx;->a:Ll/epx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cpx;->a:Ll/epx;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    invoke-static {p0, p1}, Ll/epx;->c(Ll/epx;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    return-void
.end method
