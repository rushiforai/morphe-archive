.class public final synthetic Ll/ixn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jxn0;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/jxn0;Ljava/util/HashMap;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixn0;->a:Ll/jxn0;

    iput-object p2, p0, Ll/ixn0;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/ixn0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ixn0;->a:Ll/jxn0;

    iget-object v1, p0, Ll/ixn0;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/ixn0;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;

    invoke-static {v0, v1, p0, p1}, Ll/jxn0;->e(Ll/jxn0;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;)V

    return-void
.end method
