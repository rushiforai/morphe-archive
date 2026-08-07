.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "open"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "close"

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ll/y20;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ll/y20;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method
