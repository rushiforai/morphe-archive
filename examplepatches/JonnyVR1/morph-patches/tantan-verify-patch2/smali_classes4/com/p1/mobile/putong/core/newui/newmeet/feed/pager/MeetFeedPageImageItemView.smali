.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x9y;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/Media;Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    const-string v1, "raw"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x64

    .line 10
    .line 11
    const-string v2, "core_newmeet_image_uri"

    .line 12
    .line 13
    const-string v3, "not supported yet"

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xf(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p6:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 37
    .line 38
    invoke-static {p1, v2, v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;->a:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 51
    .line 52
    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p6:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 56
    .line 57
    invoke-static {p1, v2, v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;->c:Landroid/view/View;

    .line 61
    .line 62
    new-instance v0, Ll/v9y;

    .line 63
    .line 64
    invoke-direct {v0, p2}, Ll/v9y;-><init>(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;->d:Landroid/view/View;

    .line 71
    .line 72
    new-instance p1, Ll/w9y;

    .line 73
    .line 74
    invoke-direct {p1, p2}, Ll/w9y;-><init>(Ll/y20;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/pager/MeetFeedPageImageItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
