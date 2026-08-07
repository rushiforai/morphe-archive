.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

.field public b:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Ll/x20;

.field public f:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u55;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/CityCData;Ll/x20;Ll/x20;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->e:Ll/x20;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->f:Ll/x20;

    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->b:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 29
    .line 30
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CityCData;->recievedLikeCount:I

    .line 31
    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "\u5df2\u6536\u5230%s\u559c\u6b22"

    .line 41
    .line 42
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p3, v0, p2, v1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->c:Lv/VText;

    .line 50
    .line 51
    iget p2, p1, Lcom/p1/mobile/putong/core/data/CityCData;->viewCount:I

    .line 52
    .line 53
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CityCData;->cityName:Ljava/lang/String;

    .line 58
    .line 59
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string p2, "\u5df2\u5360\u9886%s\u4e2a%s\u7528\u6237\u7684\u9996\u5f20\u5361\u7247"

    .line 64
    .line 65
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    const/4 p0, 0x0

    .line 73
    new-array p0, p0, [Ll/sfj0$a;

    .line 74
    .line 75
    const-string p1, "e_city_cover_go_up"

    .line 76
    .line 77
    const-string p2, "p_city_cover_desc_show_someone"

    .line 78
    .line 79
    invoke-static {p1, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->d:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->d:Lv/VText;

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$a;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$a;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->b:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$b;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$b;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
