.class public final synthetic Ll/ap7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ap7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    iput p2, p0, Ll/ap7;->b:I

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ap7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    iget p0, p0, Ll/ap7;->b:I

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->F(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;IIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
