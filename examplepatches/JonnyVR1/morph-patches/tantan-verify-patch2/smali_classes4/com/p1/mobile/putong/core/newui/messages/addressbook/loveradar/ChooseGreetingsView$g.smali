.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->g(Ljava/util/List;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->a:Ljava/util/List;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)Ll/w30;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 8
    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->a:Ljava/util/List;

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->b:I

    .line 27
    .line 28
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 33
    .line 34
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/LoveRadarCustomGreetAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/GreetingItem;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/4 p1, 0x1

    .line 43
    if-ne p3, p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->c(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)Ll/y20;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->a:Ljava/util/List;

    .line 54
    .line 55
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->b:I

    .line 56
    .line 57
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 62
    .line 63
    iget p1, p1, Lcom/p1/mobile/putong/core/data/GreetingItem;->id:I

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$g;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->c(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)Ll/y20;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method
