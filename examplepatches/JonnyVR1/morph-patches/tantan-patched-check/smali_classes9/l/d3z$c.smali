.class public Ll/d3z$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d3z;->B0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d3z;


# direct methods
.method public constructor <init>(Ll/d3z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3z$c;->a:Ll/d3z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z$c;->a:Ll/d3z;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/d3z$c;->a:Ll/d3z;

    .line 22
    .line 23
    invoke-static {v1}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/d3z$c;->a:Ll/d3z;

    .line 35
    .line 36
    invoke-static {p0}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
