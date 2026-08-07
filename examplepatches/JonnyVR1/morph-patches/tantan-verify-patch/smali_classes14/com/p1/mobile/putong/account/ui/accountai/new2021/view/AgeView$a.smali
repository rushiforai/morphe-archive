.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, ""

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    const-string p4, ""

    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    iput-object p4, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->a:Ljava/lang/String;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p3, 0x0

    .line 22
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    move v0, p3

    .line 40
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "0"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->R(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)Ll/y20;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 64
    .line 65
    invoke-virtual {p0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const/16 p4, 0xa

    .line 70
    .line 71
    if-lt v0, p4, :cond_2

    .line 72
    .line 73
    const/16 p4, 0x12

    .line 74
    .line 75
    if-ge v0, p4, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 80
    .line 81
    const-string p3, "1"

    .line 82
    .line 83
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setSelection(I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 102
    .line 103
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->R(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)Ll/y20;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->a:Ljava/lang/String;

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p4

    .line 117
    invoke-static {p2, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-nez p2, :cond_3

    .line 122
    .line 123
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 124
    .line 125
    invoke-static {p2}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->R(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)Ll/y20;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-interface {p2, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->a:Ljava/lang/String;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 143
    .line 144
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->S(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 145
    .line 146
    .line 147
    :goto_1
    return-void
.end method
