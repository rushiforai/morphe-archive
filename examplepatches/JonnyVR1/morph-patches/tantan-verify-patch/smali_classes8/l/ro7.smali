.class public final synthetic Ll/ro7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ro7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ro7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method
