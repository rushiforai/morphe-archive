.class public final synthetic Ll/ssu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/Notification;

    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    return-object p0
.end method
