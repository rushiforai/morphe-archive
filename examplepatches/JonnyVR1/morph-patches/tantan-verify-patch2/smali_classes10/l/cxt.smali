.class public final synthetic Ll/cxt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cxt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
