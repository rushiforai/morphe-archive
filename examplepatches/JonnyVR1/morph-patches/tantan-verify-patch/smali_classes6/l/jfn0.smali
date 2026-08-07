.class public final synthetic Ll/jfn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfn0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/jfn0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jfn0;->a:Ljava/util/List;

    iget-object p0, p0, Ll/jfn0;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    invoke-static {v0, p0, p1}, Ll/kfn0;->a(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
