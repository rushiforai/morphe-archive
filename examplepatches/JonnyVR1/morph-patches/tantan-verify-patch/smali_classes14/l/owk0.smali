.class public final synthetic Ll/owk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zwk0;


# direct methods
.method public synthetic constructor <init>(Ll/zwk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/owk0;->a:Ll/zwk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/owk0;->a:Ll/zwk0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    invoke-static {p0, p1}, Ll/zwk0;->m(Ll/zwk0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
