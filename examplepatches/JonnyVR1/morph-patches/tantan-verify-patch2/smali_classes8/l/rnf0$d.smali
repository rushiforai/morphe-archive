.class public final Ll/rnf0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/knf0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rnf0;->r(Ljava/util/List;Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/rnf0$d",
        "Ll/knf0$b;",
        "",
        "selectedType",
        "",
        "onClick",
        "(Ljava/lang/String;)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/rnf0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;


# direct methods
.method public constructor <init>(Ll/rnf0;Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rnf0$d;->b:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/rnf0;->o()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundButton;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/rnf0$d;->b:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/rnf0;->g(Ll/rnf0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/rnf0;->o()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundButton;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/rnf0;->i()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Lcom/p1/mobile/putong/core/R$string;->K8:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/rnf0$d;->a:Ll/rnf0;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    invoke-static {p0, p1}, Ll/rnf0;->h(Ll/rnf0;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
