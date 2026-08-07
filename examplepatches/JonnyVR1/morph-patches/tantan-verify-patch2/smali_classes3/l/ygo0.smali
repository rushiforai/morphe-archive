.class public final synthetic Ll/ygo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aho0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;


# direct methods
.method public synthetic constructor <init>(Ll/aho0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ygo0;->a:Ll/aho0;

    iput-object p2, p0, Ll/ygo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ygo0;->a:Ll/aho0;

    iget-object p0, p0, Ll/ygo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/aho0;->K3(Ll/aho0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/Long;)V

    return-void
.end method
