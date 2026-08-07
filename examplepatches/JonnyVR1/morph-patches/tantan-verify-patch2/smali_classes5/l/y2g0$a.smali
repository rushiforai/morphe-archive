.class public Ll/y2g0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y2g0;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y2g0;


# direct methods
.method public constructor <init>(Ll/y2g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y2g0$a;->a:Ll/y2g0;

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
    iget-object p1, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object p1, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Ljava/util/Random;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 43
    .line 44
    iget v1, v1, Ll/y2g0;->w:I

    .line 45
    .line 46
    if-ne v0, v1, :cond_1

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/lit8 v0, v0, -0x2

    .line 53
    .line 54
    if-ge v1, v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 57
    .line 58
    iget v0, v0, Ll/y2g0;->w:I

    .line 59
    .line 60
    add-int/lit8 v0, v0, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 v0, 0x0

    .line 64
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 65
    .line 66
    iput v0, v1, Ll/y2g0;->w:I

    .line 67
    .line 68
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 73
    .line 74
    iget-object p0, p0, Ll/y2g0$a;->a:Ll/y2g0;

    .line 75
    .line 76
    iget-object p0, p0, Ll/y2g0;->q:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method
