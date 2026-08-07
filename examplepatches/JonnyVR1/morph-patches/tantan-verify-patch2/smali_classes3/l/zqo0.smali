.class public final synthetic Ll/zqo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bro0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;


# direct methods
.method public synthetic constructor <init>(Ll/bro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zqo0;->a:Ll/bro0;

    iput-object p2, p0, Ll/zqo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zqo0;->a:Ll/bro0;

    iget-object p0, p0, Ll/zqo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    check-cast p1, Ll/ugd0;

    invoke-static {v0, p0, p1}, Ll/bro0;->K3(Ll/bro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V

    return-void
.end method
