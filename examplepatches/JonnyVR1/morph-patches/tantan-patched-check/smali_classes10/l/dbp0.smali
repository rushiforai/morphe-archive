.class public final synthetic Ll/dbp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/acp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;


# direct methods
.method public synthetic constructor <init>(Ll/acp0;Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbp0;->a:Ll/acp0;

    iput-object p2, p0, Ll/dbp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dbp0;->a:Ll/acp0;

    iget-object p0, p0, Ll/dbp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    invoke-static {v0, p0, p1}, Ll/acp0;->H4(Ll/acp0;Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
