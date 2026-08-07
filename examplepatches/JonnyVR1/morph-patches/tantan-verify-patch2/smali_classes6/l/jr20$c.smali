.class public Ll/jr20$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jr20;->u()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public final synthetic e:Ll/jr20;


# direct methods
.method public constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20$c;->e:Ll/jr20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/jr20$c;->a:I

    .line 8
    .line 9
    iput p1, p0, Ll/jr20$c;->b:I

    .line 10
    .line 11
    iput p1, p0, Ll/jr20$c;->c:I

    .line 12
    .line 13
    iput p1, p0, Ll/jr20$c;->d:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    sget-object v0, Ll/bsj0;->j:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/jr20$c;->e:Ll/jr20;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, v0, Ll/jr20;->h:Lv/VText;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/jr20$c;->e:Ll/jr20;

    .line 20
    .line 21
    iget-object p0, p0, Ll/jr20;->o:Ll/uq20;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/uq20;->o0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, v0, Ll/jr20;->h:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/jr20$c;->e:Ll/jr20;

    .line 33
    .line 34
    iget-object p1, p1, Ll/jr20;->h:Lv/VText;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/jr20$c;->e:Ll/jr20;

    .line 41
    .line 42
    iget-object p0, p0, Ll/jr20;->o:Ll/uq20;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/uq20;->o0()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
