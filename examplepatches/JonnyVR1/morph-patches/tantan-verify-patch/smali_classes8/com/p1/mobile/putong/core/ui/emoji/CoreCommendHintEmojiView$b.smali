.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Landroid/widget/RelativeLayout;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Landroid/widget/RelativeLayout;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->e:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->b:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->d:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->d:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    move-object v1, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;->e:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_1
    const/4 p1, 0x1

    .line 29
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Ljava/util/List;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
