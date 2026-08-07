.class public final synthetic Ll/bou;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cou;


# direct methods
.method public synthetic constructor <init>(Ll/cou;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bou;->a:Ll/cou;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bou;->a:Ll/cou;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    invoke-static {p0, p1}, Ll/cou;->R2(Ll/cou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
