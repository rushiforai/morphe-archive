.class public Ll/mwe$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mwe;->R()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mwe;


# direct methods
.method public constructor <init>(Ll/mwe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mwe$b;->a:Ll/mwe;

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
    .locals 0

    .line 1
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
    iget-object p1, p0, Ll/mwe$b;->a:Ll/mwe;

    .line 2
    .line 3
    iget-boolean p2, p1, Ll/mwe;->C:Z

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Ll/mwe;->G(Ll/mwe;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/mwe$b;->a:Ll/mwe;

    .line 11
    .line 12
    iget-boolean p1, p0, Ll/mwe;->A:Z

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iput-boolean p2, p0, Ll/mwe;->A:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method
