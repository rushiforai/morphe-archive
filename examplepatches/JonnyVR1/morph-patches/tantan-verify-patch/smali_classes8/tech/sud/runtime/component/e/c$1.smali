.class Ltech/sud/runtime/component/e/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/e/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/e/c;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/e/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 12
    .line 13
    invoke-static {v0}, Ltech/sud/runtime/component/e/c;->a(Ltech/sud/runtime/component/e/c;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 20
    .line 21
    invoke-static {v0}, Ltech/sud/runtime/component/e/c;->b(Ltech/sud/runtime/component/e/c;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 33
    .line 34
    invoke-static {v0, p1}, Ltech/sud/runtime/component/e/c;->a(Ltech/sud/runtime/component/e/c;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ltech/sud/runtime/component/e/c$1;->a:Ltech/sud/runtime/component/e/c;

    .line 38
    .line 39
    invoke-static {p0}, Ltech/sud/runtime/component/e/c;->c(Ltech/sud/runtime/component/e/c;)Ltech/sud/runtime/core/g;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->a(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
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
