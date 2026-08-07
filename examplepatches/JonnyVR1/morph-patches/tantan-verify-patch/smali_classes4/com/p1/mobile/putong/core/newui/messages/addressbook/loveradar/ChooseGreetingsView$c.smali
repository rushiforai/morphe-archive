.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$c;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/LoveRadarCustomGreetAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/GreetingItem;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
