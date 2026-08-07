.class public Ll/sww$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sww;->Z(ILl/bf3;Ll/l3h0;Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bf3;

.field public final synthetic b:Ll/l3h0;

.field public final synthetic c:Ll/sww;


# direct methods
.method public constructor <init>(Ll/sww;Ll/bf3;Ll/l3h0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sww$d;->c:Ll/sww;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sww$d;->a:Ll/bf3;

    .line 4
    .line 5
    iput-object p3, p0, Ll/sww$d;->b:Ll/l3h0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sww;->s(Ll/sww;)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 12
    .line 13
    invoke-static {v0}, Ll/sww;->u(Ll/sww;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 21
    .line 22
    invoke-static {v0}, Ll/sww;->q(Ll/sww;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    move v3, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v3, v1

    .line 38
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 42
    .line 43
    invoke-static {v0}, Ll/sww;->p(Ll/sww;)Ll/eww;

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, " onQueryTextChange newText = "

    .line 49
    .line 50
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v3, "MapActPresenter"

    .line 61
    .line 62
    invoke-static {v3, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 72
    .line 73
    invoke-static {v0, v2}, Ll/sww;->w(Ll/sww;Z)V

    .line 74
    .line 75
    .line 76
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p0, Ll/sww$d;->a:Ll/bf3;

    .line 83
    .line 84
    iget-object v0, v0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Ll/sww$d;->a:Ll/bf3;

    .line 93
    .line 94
    iget-object v0, v0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    iget-object v0, p0, Ll/sww$d;->c:Ll/sww;

    .line 105
    .line 106
    invoke-static {v0}, Ll/sww;->v(Ll/sww;)Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;

    .line 111
    .line 112
    invoke-direct {v1}, Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;-><init>()V

    .line 113
    .line 114
    .line 115
    iget-object v3, p0, Ll/sww$d;->a:Ll/bf3;

    .line 116
    .line 117
    iget-object v3, v3, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 118
    .line 119
    iget-object v3, v3, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;->city(Ljava/lang/String;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1, p1}, Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;->keyword(Ljava/lang/String;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {v0, p1}, Lcom/baidu/mapapi/search/sug/SuggestionSearch;->requestSuggestion(Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;)Z

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Ll/sww$d;->c:Ll/sww;

    .line 133
    .line 134
    invoke-static {p0, v2}, Ll/sww;->x(Ll/sww;Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    iget-object p1, p0, Ll/sww$d;->b:Ll/l3h0;

    .line 139
    .line 140
    new-instance v0, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .line 144
    .line 145
    iget-object v3, p0, Ll/sww$d;->c:Ll/sww;

    .line 146
    .line 147
    iget-object v3, v3, Ll/sww;->D:Ll/y20;

    .line 148
    .line 149
    invoke-virtual {p1, v0, v3}, Ll/l3h0;->t(Ljava/util/List;Ll/y20;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/sww$d;->c:Ll/sww;

    .line 153
    .line 154
    invoke-static {p0, v1}, Ll/sww;->x(Ll/sww;Z)V

    .line 155
    .line 156
    .line 157
    :goto_1
    return v2
.end method

.method public b(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
