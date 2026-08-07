.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/th0$a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "\u7cfb\u7edf\u62db\u547c\u8bed"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "\u914d\u5bf9\u6210\u529f\u540e\u7cfb\u7edf\u5c06\u4e3a\u60a8\u7ed9\u5bf9\u65b9\u53d1\u9001\u65e5\u5e38\u62db\u547c\u8bed"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "\u6211\u77e5\u9053\u4e86"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 49
    .line 50
    .line 51
    return-void
.end method
