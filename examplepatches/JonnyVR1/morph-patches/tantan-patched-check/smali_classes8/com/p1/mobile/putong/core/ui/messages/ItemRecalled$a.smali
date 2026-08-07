.class public Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Y(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ll/d3z;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    const/16 v0, 0x8

    .line 52
    .line 53
    if-ne p1, v0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-string p1, "e_message_re_edit"

    .line 57
    .line 58
    const-string v0, "p_chat_view"

    .line 59
    .line 60
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Ll/d3z;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/widget/TextView;->length()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const/4 v1, 0x0

    .line 113
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ll/d3z;->u0()Ll/azy;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/d3z;->u0()Ll/azy;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_2

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/d3z;->u0()Ll/azy;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Ll/azy;->G()V

    .line 141
    .line 142
    .line 143
    :cond_2
    :goto_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/g9c0;->D:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
