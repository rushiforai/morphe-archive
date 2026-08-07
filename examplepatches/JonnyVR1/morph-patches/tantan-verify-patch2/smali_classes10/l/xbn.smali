.class public final synthetic Ll/xbn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/acn;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/acn;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xbn;->a:Ll/acn;

    iput-object p2, p0, Ll/xbn;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xbn;->a:Ll/acn;

    iget-object p0, p0, Ll/xbn;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    invoke-static {v0, p0, p1}, Ll/acn;->b(Ll/acn;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method
