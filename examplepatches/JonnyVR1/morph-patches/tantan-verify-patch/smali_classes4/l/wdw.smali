.class public final synthetic Ll/wdw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdw;->a:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdw;->a:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method
