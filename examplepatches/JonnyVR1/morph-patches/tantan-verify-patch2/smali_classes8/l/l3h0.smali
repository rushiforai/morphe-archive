.class public Ll/l3h0;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/bf3;

.field public f:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ll/bf3;",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/bf3;Lcom/p1/mobile/android/app/Act;Ll/z20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bf3;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/z20<",
            "Ll/bf3;",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/l3h0;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/l3h0;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p1, p0, Ll/l3h0;->e:Ll/bf3;

    .line 14
    .line 15
    iput-object p3, p0, Ll/l3h0;->f:Ll/z20;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/l3h0;->s(Landroid/view/View;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l3h0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->Ud:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l3h0;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

    .line 2
    .line 3
    iget-object p3, p0, Ll/l3h0;->e:Ll/bf3;

    .line 4
    .line 5
    iget-object p0, p0, Ll/l3h0;->f:Ll/z20;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->S(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ll/bf3;Ll/z20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t(Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;",
            "Ll/y20;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/l3h0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
