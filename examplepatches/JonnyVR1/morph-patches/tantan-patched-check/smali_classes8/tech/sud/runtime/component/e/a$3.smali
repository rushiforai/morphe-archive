.class Ltech/sud/runtime/component/e/a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/e/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/e/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/e/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$3;->a:Ltech/sud/runtime/component/e/a;

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
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$3;->a:Ltech/sud/runtime/component/e/a;

    .line 6
    .line 7
    invoke-static {v0}, Ltech/sud/runtime/component/e/a;->b(Ltech/sud/runtime/component/e/a;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$3;->a:Ltech/sud/runtime/component/e/a;

    .line 19
    .line 20
    invoke-static {v0, p1}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$3;->a:Ltech/sud/runtime/component/e/a;

    .line 24
    .line 25
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->c(Ltech/sud/runtime/component/e/a;)Ltech/sud/runtime/component/e/a$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0, p1}, Ltech/sud/runtime/component/e/a$a;->a(Ljava/lang/String;)V

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
