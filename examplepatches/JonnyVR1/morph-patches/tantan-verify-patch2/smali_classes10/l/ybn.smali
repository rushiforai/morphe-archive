.class public final synthetic Ll/ybn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/acn;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;


# direct methods
.method public synthetic constructor <init>(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ybn;->a:Ll/acn;

    iput-object p2, p0, Ll/ybn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ybn;->a:Ll/acn;

    iget-object p0, p0, Ll/ybn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    invoke-static {v0, p0, p1}, Ll/acn;->d(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V

    return-void
.end method
