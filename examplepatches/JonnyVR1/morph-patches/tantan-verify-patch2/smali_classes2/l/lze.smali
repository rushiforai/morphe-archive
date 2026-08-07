.class public final Ll/lze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lze$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/widget/EditText;

.field public b:Ll/iye$d;

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/lze;->c:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/lze;->d:I

    .line 11
    .line 12
    iput-object p1, p0, Ll/lze;->a:Landroid/widget/EditText;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/iye$d;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lze;->b:Ll/iye$d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lze$a;

    .line 6
    .line 7
    iget-object v1, p0, Ll/lze;->a:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/lze$a;-><init>(Landroid/widget/EditText;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/lze;->b:Ll/iye$d;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/lze;->b:Ll/iye$d;

    .line 15
    .line 16
    return-object p0
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lze;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lze;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lze;->a:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-gt p3, p4, :cond_3

    .line 11
    .line 12
    instance-of p3, p1, Landroid/text/Spannable;

    .line 13
    .line 14
    if-eqz p3, :cond_3

    .line 15
    .line 16
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Ll/iye;->c()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-eqz p3, :cond_2

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    if-eq p3, v0, :cond_1

    .line 28
    .line 29
    const/4 p1, 0x3

    .line 30
    if-eq p3, p1, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v1, p1

    .line 34
    check-cast v1, Landroid/text/Spannable;

    .line 35
    .line 36
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    add-int v3, p2, p4

    .line 41
    .line 42
    iget v4, p0, Ll/lze;->c:I

    .line 43
    .line 44
    iget v5, p0, Ll/lze;->d:I

    .line 45
    .line 46
    move v2, p2

    .line 47
    invoke-virtual/range {v0 .. v5}, Ll/iye;->p(Ljava/lang/CharSequence;IIII)Ljava/lang/CharSequence;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Ll/lze;->a()Ll/iye$d;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Ll/iye;->q(Ll/iye$d;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_0
    return-void
.end method
