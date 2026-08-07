.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/bvl;
.implements Landroid/animation/Animator$AnimatorListener;
.implements Ll/emf;


# static fields
.field public static C:I


# instance fields
.field public A:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public B:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;

.field public b:Lv/VRelative;

.field public c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VFrame_FlipContainer;

.field public g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public k:Lv/VFrame_FlipContainer;

.field public l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public m:Lv/VText;

.field public n:Lv/VLinear;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/Boolean;

.field public r:Lcom/tantanapp/media/ttmediautils/download/Action1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final s:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final t:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final u:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final v:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final w:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final x:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public z:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42a00000    # 80.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->C:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "default"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "unknown"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-static {}, Ll/en4;->f()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {}, Ll/en4;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->s:Ll/pf60;

    .line 28
    .line 29
    invoke-static {}, Ll/en4;->e()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {}, Ll/en4;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->t:Ll/pf60;

    .line 42
    .line 43
    const-string p1, "https://fe-static.tancdn.com/v1/raw/02f81d7a-799d-4e83-a6b5-9e036be1310914.svga"

    .line 44
    .line 45
    invoke-static {}, Ll/en4;->d()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->u:Ll/pf60;

    .line 54
    .line 55
    const-string p1, "https://auto.tancdn.com/v1/raw/78a7050f-3483-4f5c-adb4-63d0a0100f1814.svga"

    .line 56
    .line 57
    const-string v0, "https://auto.tancdn.com/v1/raw/3b605799-e249-4570-9842-182f749f35c314.svga"

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->v:Ll/pf60;

    .line 64
    .line 65
    const-string p1, "https://auto.tancdn.com/v1/raw/535b4dd1-a555-4f83-af6b-42737e4595a214.svga"

    .line 66
    .line 67
    const-string v0, "https://auto.tancdn.com/v1/raw/e2fcaca7-7b82-4a74-af74-dcd3977fe85c14.svga"

    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->w:Ll/pf60;

    .line 74
    .line 75
    const-string p1, "https://fe-static.tancdn.com/v1/raw/04c0fb59-e9bc-4068-985f-72428ec5fbb214.svga"

    .line 76
    .line 77
    invoke-static {p1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->x:Ll/pf60;

    .line 82
    .line 83
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;

    .line 84
    .line 85
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->y:Ljava/util/HashMap;

    .line 89
    .line 90
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->z:Ljava/util/HashMap;

    .line 96
    .line 97
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;

    .line 98
    .line 99
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 100
    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->A:Ljava/util/HashMap;

    .line 103
    .line 104
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;

    .line 105
    .line 106
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 107
    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->B:Ljava/util/HashMap;

    .line 110
    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 112
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 113
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 114
    const-string p1, "unknown"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 116
    invoke-static {}, Ll/en4;->f()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ll/en4;->c()Ljava/lang/String;

    move-result-object p2

    .line 117
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->s:Ll/pf60;

    .line 118
    invoke-static {}, Ll/en4;->e()Ljava/lang/String;

    move-result-object p1

    .line 119
    invoke-static {}, Ll/en4;->b()Ljava/lang/String;

    move-result-object p2

    .line 120
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->t:Ll/pf60;

    .line 121
    const-string p1, "https://fe-static.tancdn.com/v1/raw/02f81d7a-799d-4e83-a6b5-9e036be1310914.svga"

    .line 122
    invoke-static {}, Ll/en4;->d()Ljava/lang/String;

    move-result-object p2

    .line 123
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->u:Ll/pf60;

    .line 124
    const-string p1, "https://auto.tancdn.com/v1/raw/78a7050f-3483-4f5c-adb4-63d0a0100f1814.svga"

    const-string p2, "https://auto.tancdn.com/v1/raw/3b605799-e249-4570-9842-182f749f35c314.svga"

    .line 125
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->v:Ll/pf60;

    .line 126
    const-string p1, "https://auto.tancdn.com/v1/raw/535b4dd1-a555-4f83-af6b-42737e4595a214.svga"

    const-string p2, "https://auto.tancdn.com/v1/raw/e2fcaca7-7b82-4a74-af74-dcd3977fe85c14.svga"

    .line 127
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->w:Ll/pf60;

    .line 128
    const-string p1, "https://fe-static.tancdn.com/v1/raw/04c0fb59-e9bc-4068-985f-72428ec5fbb214.svga"

    .line 129
    invoke-static {p1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->x:Ll/pf60;

    .line 130
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->y:Ljava/util/HashMap;

    .line 131
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->z:Ljava/util/HashMap;

    .line 132
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->A:Ljava/util/HashMap;

    .line 133
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->B:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 134
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 135
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 136
    const-string p1, "unknown"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 138
    invoke-static {}, Ll/en4;->f()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ll/en4;->c()Ljava/lang/String;

    move-result-object p2

    .line 139
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->s:Ll/pf60;

    .line 140
    invoke-static {}, Ll/en4;->e()Ljava/lang/String;

    move-result-object p1

    .line 141
    invoke-static {}, Ll/en4;->b()Ljava/lang/String;

    move-result-object p2

    .line 142
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->t:Ll/pf60;

    .line 143
    const-string p1, "https://fe-static.tancdn.com/v1/raw/02f81d7a-799d-4e83-a6b5-9e036be1310914.svga"

    .line 144
    invoke-static {}, Ll/en4;->d()Ljava/lang/String;

    move-result-object p2

    .line 145
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->u:Ll/pf60;

    .line 146
    const-string p1, "https://auto.tancdn.com/v1/raw/78a7050f-3483-4f5c-adb4-63d0a0100f1814.svga"

    const-string p2, "https://auto.tancdn.com/v1/raw/3b605799-e249-4570-9842-182f749f35c314.svga"

    .line 147
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->v:Ll/pf60;

    .line 148
    const-string p1, "https://auto.tancdn.com/v1/raw/535b4dd1-a555-4f83-af6b-42737e4595a214.svga"

    const-string p2, "https://auto.tancdn.com/v1/raw/e2fcaca7-7b82-4a74-af74-dcd3977fe85c14.svga"

    .line 149
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->w:Ll/pf60;

    .line 150
    const-string p1, "https://fe-static.tancdn.com/v1/raw/04c0fb59-e9bc-4068-985f-72428ec5fbb214.svga"

    .line 151
    invoke-static {p1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->x:Ll/pf60;

    .line 152
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->y:Ljava/util/HashMap;

    .line 153
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->z:Ljava/util/HashMap;

    .line 154
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->A:Ljava/util/HashMap;

    .line 155
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->B:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->n(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->t:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->w:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->s:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->v:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->u:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->x:Ll/pf60;

    return-object p0
.end method

.method private l()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 7
    .line 8
    invoke-static {}, Ll/spl0;->G()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->d:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-static {}, Ll/spl0;->G()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/high16 v2, 0x41a00000    # 20.0f

    .line 22
    .line 23
    const/high16 v3, 0x41400000    # 12.0f

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 40
    .line 41
    invoke-static {}, Ll/spl0;->G()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 60
    .line 61
    invoke-static {}, Ll/spl0;->G()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    :goto_2
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private p()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "oDiamond"

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 23
    .line 24
    sget v1, Ll/dbc0;->l7:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 30
    .line 31
    sget v1, Ll/dbc0;->m7:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 37
    .line 38
    sget v1, Ll/dbc0;->o7:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 44
    .line 45
    sget v1, Ll/dbc0;->n7:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "supremePartner"

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    sget v0, Ll/dbc0;->t7:I

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 69
    .line 70
    sget v1, Ll/dbc0;->u7:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 76
    .line 77
    sget v1, Ll/dbc0;->v7:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 83
    .line 84
    sget v1, Ll/dbc0;->s7:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    sget v0, Ll/dbc0;->h7:I

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 96
    .line 97
    sget v1, Ll/dbc0;->i7:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 103
    .line 104
    sget v1, Ll/dbc0;->k7:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 110
    .line 111
    sget v1, Ll/dbc0;->j7:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setPlaceHolderPic(I)V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->y:Ljava/util/HashMap;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Ll/pf60;

    .line 127
    .line 128
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast v1, Ljava/lang/String;

    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->y:Ljava/util/HashMap;

    .line 133
    .line 134
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Ll/pf60;

    .line 141
    .line 142
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v2, Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->z:Ljava/util/HashMap;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    check-cast v1, Ll/pf60;

    .line 160
    .line 161
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast v1, Ljava/lang/String;

    .line 164
    .line 165
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->z:Ljava/util/HashMap;

    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Ll/pf60;

    .line 174
    .line 175
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v2, Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->A:Ljava/util/HashMap;

    .line 185
    .line 186
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    check-cast v1, Ll/pf60;

    .line 193
    .line 194
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 195
    .line 196
    check-cast v1, Ljava/lang/String;

    .line 197
    .line 198
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->A:Ljava/util/HashMap;

    .line 199
    .line 200
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    check-cast v2, Ll/pf60;

    .line 207
    .line 208
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 209
    .line 210
    check-cast v2, Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->B:Ljava/util/HashMap;

    .line 218
    .line 219
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Ll/pf60;

    .line 226
    .line 227
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 228
    .line 229
    check-cast v1, Ljava/lang/String;

    .line 230
    .line 231
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->B:Ljava/util/HashMap;

    .line 232
    .line 233
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Ll/pf60;

    .line 240
    .line 241
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 242
    .line 243
    check-cast v2, Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 249
    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p:Ljava/lang/String;

    .line 251
    .line 252
    return-void
.end method

.method private q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/a6l;->INSTANCE:Ll/a6l;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/a6l;->a(Landroid/content/Context;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private setSwipeAnimEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setSwipeEnable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setSwipeEnable(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setSwipeEnable(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setSwipeEnable(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public getButtonRadius()I
    .locals 0

    .line 1
    const/high16 p0, 0x41d80000    # 27.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getButtonRootLayout()Landroid/view/ViewGroup;
    .locals 0

    return-object p0
.end method

.method public getButtonScrolledDistance()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->b:Lv/VRelative;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDislikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->j4:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyAndSuperLikeLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->n:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatchButton()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatchButton()Ll/avl;

    move-result-object p0

    return-object p0
.end method

.method public getImmediatelyMatchTop()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->u2:I

    .line 2
    .line 3
    return p0
.end method

.method public getNormalBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Z1:I

    .line 2
    .line 3
    return p0
.end method

.method public getOperationBtnBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Z1:I

    .line 2
    .line 3
    return p0
.end method

.method public getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 9
    .line 10
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 11
    .line 12
    const/16 v0, 0x55

    .line 13
    .line 14
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 15
    .line 16
    return-object p0
.end method

.method public bridge synthetic getSayHiNewLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getSayHiNewLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getSuperLike()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->f:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->q3:I

    .line 2
    .line 3
    return p0
.end method

.method public getSuperLikeRemaining()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->h:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndoLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->k:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndoPressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->j4:I

    .line 2
    .line 3
    return p0
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e6l;->a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->n:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/c6l;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/c6l;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 12
    .line 13
    new-instance v1, Ll/d6l;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/d6l;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

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
    invoke-static {}, Ll/gra;->K1()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const-string p0, "\u53ea\u770b\u8ba4\u8bc1\u7528\u6237\u8bd5\u7528\u671f\u95f4\u65e0\u6cd5\u4f7f\u7528\u4e00\u952e\u914d\u5bf9\u529f\u80fd"

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 32
    .line 33
    const-string p1, "p_home,odiamond_sayhi"

    .line 34
    .line 35
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->K1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p0, "\u53ea\u770b\u8ba4\u8bc1\u7528\u6237\u8bd5\u7528\u671f\u95f4\u65e0\u6cd5\u4f7f\u7528\u4e00\u952e\u914d\u5bf9\u529f\u80fd"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 32
    .line 33
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 40
    .line 41
    const-string p1, "p_home,odiamond_sayhi"

    .line 42
    .line 43
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    const-string p0, "e_odiamond_sayhi"

    .line 47
    .line 48
    const-string p1, "p_suggest_users_home_view"

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->b:Lv/VRelative;

    .line 8
    .line 9
    const/high16 v1, 0x42ac0000    # 86.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 25
    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setShadowSize(F)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->setSwipeAnimEnable(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setShowLog(Z)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Landroid/animation/LayoutTransition;

    .line 46
    .line 47
    invoke-direct {v2}, Landroid/animation/LayoutTransition;-><init>()V

    .line 48
    .line 49
    .line 50
    const-wide/16 v3, 0x0

    .line 51
    .line 52
    invoke-virtual {v2, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v3, 0x96

    .line 56
    .line 57
    invoke-virtual {v2, v1, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->m()V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->l()V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v0, v0, v1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "bubble_odiamond_immediate_match_guide"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/high16 v1, 0x40000000    # 2.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v3, "\u65e0\u9700\u914d\u5bf9\uff0c\u76f4\u63a5\u5f00\u804a"

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Ll/c9c0;->I:I

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    filled-new-array {v3}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/high16 v3, 0x41500000    # 13.0f

    .line 58
    .line 59
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/high16 v3, 0x40e00000    # 7.0f

    .line 64
    .line 65
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/16 v3, 0x4b

    .line 74
    .line 75
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/high16 v3, -0x3f800000    # -4.0f

    .line 80
    .line 81
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 90
    .line 91
    const/high16 v4, 0x41a00000    # 20.0f

    .line 92
    .line 93
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-wide/16 v3, 0x1f40

    .line 102
    .line 103
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 108
    .line 109
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 110
    .line 111
    or-int/2addr v3, v4

    .line 112
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 120
    .line 121
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->q()Lcom/p1/mobile/putong/core/ui/match/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/b;->p()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x7

    .line 16
    if-gt v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->A6:Ll/jxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r()V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object p0, p0, Ll/dkb;->A6:Ll/jxd0;

    .line 45
    .line 46
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->p()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->s()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setImmediateleMatchClickListener(Lcom/tantanapp/media/ttmediautils/download/Action1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 2
    .line 3
    return-void
.end method

.method public setSuperLikeBtnGray(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p1, Ll/dbc0;->r7:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->setCoverDrawable(I)V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public setSuperLikeComboIsSlowly(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedButtons;->q()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setVisibility(I)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    cmpl-float v1, v1, v0

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/16 v2, 0x8

    .line 22
    .line 23
    if-ne p1, v2, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :cond_1
    const/4 v3, 0x2

    .line 27
    new-array v3, v3, [F

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    aput v1, v3, v4

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    aput v0, v3, v1

    .line 34
    .line 35
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {p0, v0, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-wide/16 v3, 0x96

    .line 42
    .line 43
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    if-ne p1, v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method
