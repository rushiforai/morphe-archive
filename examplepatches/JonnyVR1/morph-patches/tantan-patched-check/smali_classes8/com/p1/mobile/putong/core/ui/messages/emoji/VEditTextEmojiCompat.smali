.class public Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;
.super Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
.source "SourceFile"


# instance fields
.field public q:Ll/kye;

.field public r:Z

.field public s:Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 12
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->A(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x101006e

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->A(Landroid/util/AttributeSet;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->A(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private getEmojiEditTextHelper()Ll/kye;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->q:Ll/kye;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kye;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/kye;-><init>(Landroid/widget/EditText;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->q:Ll/kye;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->q:Ll/kye;

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public final A(Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->r:Z

    .line 7
    .line 8
    new-instance v0, Ll/vpe;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2, p3}, Ll/vpe;-><init>(Landroid/view/View;Landroid/util/AttributeSet;II)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->getEmojiEditTextHelper()Ll/kye;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0}, Ll/vpe;->a()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p1, p2}, Ll/kye;->f(I)V

    .line 22
    .line 23
    .line 24
    invoke-super {p0}, Landroid/widget/TextView;->getKeyListener()Landroid/text/method/KeyListener;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->getEmojiEditTextHelper()Ll/kye;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/kye;->d(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onPrivateIMECommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .locals 2

    .line 1
    const-string v0, "com.sogou.inputmethod.exp.commit"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "EXP_PATH_URI"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/net/Uri;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->s:Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;->a(Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onPrivateIMECommand(Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/msi0;->q(Landroid/widget/TextView;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setKeyListener(Landroid/text/method/KeyListener;)V
    .locals 1
    .param p1    # Landroid/text/method/KeyListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->getEmojiEditTextHelper()Ll/kye;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/kye;->b(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setOnSogouGifListener(Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->s:Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;

    .line 2
    .line 3
    return-void
.end method
