.class public final synthetic Ll/po7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    iput-boolean p2, p0, Ll/po7;->b:Z

    iput-object p3, p0, Ll/po7;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/po7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    iget-boolean v1, p0, Ll/po7;->b:Z

    iget-object p0, p0, Ll/po7;->c:Ljava/util/List;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->e(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZLjava/util/List;Ljava/util/List;)V

    return-void
.end method
