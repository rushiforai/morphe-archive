.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$e;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$e;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

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
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$e;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$e;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)Ll/y20;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$e;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;)Ll/y20;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "custom"

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
