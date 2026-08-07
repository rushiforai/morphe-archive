.class public Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/CardLabelItemView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->s(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->s(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->p(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Ll/rql;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->p(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Ll/rql;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ll/rql;->getCardView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->s(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {p1, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;->a:Lcom/p1/mobile/putong/core/view/CardLabelItemView;

    .line 63
    .line 64
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->s(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 69
    .line 70
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->u(Lcom/p1/mobile/putong/core/view/CardLabelItemView;Lcom/p1/mobile/putong/core/data/LabelStatistics;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method
