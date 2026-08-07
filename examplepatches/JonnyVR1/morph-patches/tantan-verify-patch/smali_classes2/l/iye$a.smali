.class public final Ll/iye$a;
.super Ll/iye$b;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iye;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public volatile b:Ll/gze;

.field public volatile c:Ll/ha00;


# direct methods
.method public constructor <init>(Ll/iye;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iye$b;-><init>(Ll/iye;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)Z
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/iye$a;->b:Ll/gze;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gze;->c(Ljava/lang/CharSequence;)Ll/fze;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b()V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ll/iye$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iye$a$a;-><init>(Ll/iye$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/iye$b;->a:Ll/iye;

    .line 7
    .line 8
    iget-object v1, v1, Ll/iye;->f:Ll/iye$f;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ll/iye$f;->a(Ll/iye$g;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    iget-object p0, p0, Ll/iye$b;->a:Ll/iye;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/iye;->k(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c(Ljava/lang/CharSequence;IIIZ)Ljava/lang/CharSequence;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/iye$a;->b:Ll/gze;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/gze;->i(Ljava/lang/CharSequence;IIIZ)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/inputmethod/EditorInfo;)V
    .locals 3
    .param p1    # Landroid/view/inputmethod/EditorInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    iget-object v1, p0, Ll/iye$a;->c:Ll/ha00;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/ha00;->e()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "android.support.text.emoji.emojiCompat_metadataVersion"

    .line 10
    .line 11
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 15
    .line 16
    iget-object p0, p0, Ll/iye$b;->a:Ll/iye;

    .line 17
    .line 18
    iget-boolean p0, p0, Ll/iye;->g:Z

    .line 19
    .line 20
    const-string v0, "android.support.text.emoji.emojiCompat_replaceAll"

    .line 21
    .line 22
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public e(Ll/ha00;)V
    .locals 4
    .param p1    # Ll/ha00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/iye$b;->a:Ll/iye;

    .line 4
    .line 5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 6
    .line 7
    const-string v0, "metadataRepo cannot be null"

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/iye;->k(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-object p1, p0, Ll/iye$a;->c:Ll/ha00;

    .line 17
    .line 18
    new-instance p1, Ll/gze;

    .line 19
    .line 20
    iget-object v0, p0, Ll/iye$a;->c:Ll/ha00;

    .line 21
    .line 22
    new-instance v1, Ll/iye$h;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/iye$h;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/iye$b;->a:Ll/iye;

    .line 28
    .line 29
    iget-boolean v3, v2, Ll/iye;->h:Z

    .line 30
    .line 31
    iget-object v2, v2, Ll/iye;->i:[I

    .line 32
    .line 33
    invoke-direct {p1, v0, v1, v3, v2}, Ll/gze;-><init>(Ll/ha00;Ll/iye$h;Z[I)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/iye$a;->b:Ll/gze;

    .line 37
    .line 38
    iget-object p0, p0, Ll/iye$b;->a:Ll/iye;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/iye;->l()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
