.class public final synthetic Ll/k3m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l3m0;


# direct methods
.method public synthetic constructor <init>(Ll/l3m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k3m0;->a:Ll/l3m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k3m0;->a:Ll/l3m0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    invoke-static {p0, p1}, Ll/l3m0;->S3(Ll/l3m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;)V

    return-void
.end method
