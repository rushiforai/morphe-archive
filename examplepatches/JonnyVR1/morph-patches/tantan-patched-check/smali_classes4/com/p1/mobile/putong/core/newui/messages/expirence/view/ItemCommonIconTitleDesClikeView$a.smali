.class public Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->c:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->b:Lcom/p1/mobile/android/app/Act;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->deeplink:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->deeplink:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {v0, v1, p1}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->a:Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->data:Lcom/p1/mobile/putong/core/data/MessageItemdata;

    .line 81
    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageItemdata;->tips_source:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    const-string v0, ""

    .line 88
    .line 89
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->id:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;->c:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string v1, "tips_source"

    .line 104
    .line 105
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    filled-new-array {v0}, [Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method
