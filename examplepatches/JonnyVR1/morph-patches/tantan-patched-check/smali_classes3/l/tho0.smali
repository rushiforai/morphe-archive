.class public final synthetic Ll/tho0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gio0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;


# direct methods
.method public synthetic constructor <init>(Ll/gio0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tho0;->a:Ll/gio0;

    iput-object p2, p0, Ll/tho0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tho0;->a:Ll/gio0;

    iget-object p0, p0, Ll/tho0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/gio0;->J3(Ll/gio0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ljava/util/List;)V

    return-void
.end method
