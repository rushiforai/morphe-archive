.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->f(Lcom/p1/mobile/putong/core/data/FateRadar;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->a:Ljava/util/List;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->a:Ljava/util/List;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView$f;->b:I

    .line 6
    .line 7
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->d(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;Ljava/util/List;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
