.class public Ll/cs90$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cs90;->T(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/UserTagData;

.field public final synthetic b:Ll/cs90;


# direct methods
.method public constructor <init>(Ll/cs90;Lcom/p1/mobile/putong/core/data/UserTagData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cs90$a;->a:Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/cs90$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cs90$a;->b(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 2
    .line 3
    invoke-static {p0}, Ll/cs90;->d0(Ll/cs90;)Ll/w30;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "p_edit_profile_view"

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    const/16 v2, 0xbb9

    .line 25
    .line 26
    invoke-virtual {p1, p0, v2, v0, v1}, Ll/gj40;->D(Lcom/p1/mobile/android/app/Frag;ILjava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v0, "\u5220\u9664\u6807\u7b7e"

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/w30$b;

    .line 41
    .line 42
    iget-object v1, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/ep90;->O()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v0, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 56
    .line 57
    const-string v2, "\u53d6\u6d88"

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Ll/bs90;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/bs90;-><init>(Ll/cs90$a;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const/4 v0, 0x3

    .line 77
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Ll/w30$b;->P(Landroid/graphics/Typeface;)Ll/w30$b;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v0, Ll/cs90$a$a;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/cs90$a$a;-><init>(Ll/cs90$a;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v1, p1}, Ll/cs90;->e0(Ll/cs90;Ll/w30;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 102
    .line 103
    invoke-static {p0}, Ll/cs90;->d0(Ll/cs90;)Ll/w30;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 108
    .line 109
    .line 110
    return-void
.end method
