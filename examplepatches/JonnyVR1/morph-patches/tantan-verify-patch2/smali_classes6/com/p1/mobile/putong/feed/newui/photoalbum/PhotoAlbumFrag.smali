.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$a;
.implements Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$b;
.implements Ll/t2m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;,
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;,
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;,
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$f;
    }
.end annotation


# static fields
.field public static f1:J = 0x6ddd00L

.field public static g1:Z = true


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

.field public B:Lv/VFrame;

.field public C:Lv/navigationbar/VNavigationBar;

.field public D:Lv/VFrame;

.field public E:Landroid/widget/ImageView;

.field public E0:I

.field public F:Lv/VText;

.field public F0:Ljava/lang/String;

.field public G:Lv/navigationbar/VNavigationTabLayout;

.field public G0:I

.field public H:Lv/VFrame;

.field public H0:Z

.field public I:Lv/VText;

.field public I0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field

.field public J:Lv/VFrame;

.field public J0:Ll/q1i;

.field public K:Lv/VImage;

.field public K0:Ljava/lang/String;

.field public L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

.field public L0:Z

.field public M:Landroid/widget/PopupWindow;

.field public M0:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$f;",
            ">;"
        }
    .end annotation
.end field

.field public N:Ll/l4g0;

.field public N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

.field public O:Ll/l4g0;

.field public O0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public P:Ll/l4g0;

.field public P0:[Landroid/widget/TextView;

.field public Q:Ll/l4g0;

.field public Q0:[Lv/VImage;

.field public R:Ll/keh;

.field public R0:[Landroid/widget/TextView;

.field public S:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public S0:[Landroid/widget/ImageView;

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public T0:I

.field public U:Ljava/lang/String;

.field public U0:Z

.field public V:Z

.field public V0:Lcom/p1/mobile/android/app/Dialog;

.field public W:J

.field public W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public X:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public X0:Ljava/lang/String;

.field public Y:Z

.field public Y0:Z

.field public Z:Z

.field public Z0:Ll/v370;

.field public a1:Ljava/lang/Runnable;

.field public b1:Ll/sbh;

.field public c1:Ljava/lang/String;

.field public d1:Ljava/lang/String;

.field public e1:Z

.field public k0:I

.field public p0:Z

.field public z:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-string v3, "p_like"

    .line 13
    .line 14
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N:Ll/l4g0;

    .line 18
    .line 19
    new-instance v0, Ll/l4g0;

    .line 20
    .line 21
    const-string v2, "p_follow"

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O:Ll/l4g0;

    .line 31
    .line 32
    new-instance v0, Ll/l4g0;

    .line 33
    .line 34
    const-string v2, "p_nearby"

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P:Ll/l4g0;

    .line 44
    .line 45
    new-instance v0, Ll/leh;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/leh;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R:Ll/keh;

    .line 51
    .line 52
    new-instance v0, Ll/sg70;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/sg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 55
    .line 56
    .line 57
    const/16 v1, 0x190

    .line 58
    .line 59
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S:Ll/y20;

    .line 64
    .line 65
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T:Lrx/subjects/a;

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V:Z

    .line 73
    .line 74
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X:Lrx/subjects/b;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y:Z

    .line 82
    .line 83
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 84
    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k0:I

    .line 86
    .line 87
    const/4 v2, -0x1

    .line 88
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G0:I

    .line 89
    .line 90
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H0:Z

    .line 91
    .line 92
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$a;

    .line 93
    .line 94
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 95
    .line 96
    .line 97
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M0:Ll/h80;

    .line 98
    .line 99
    const/4 v2, 0x0

    .line 100
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 101
    .line 102
    new-instance v2, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 108
    .line 109
    const/4 v2, 0x4

    .line 110
    new-array v3, v2, [Landroid/widget/TextView;

    .line 111
    .line 112
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P0:[Landroid/widget/TextView;

    .line 113
    .line 114
    new-array v3, v0, [Lv/VImage;

    .line 115
    .line 116
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q0:[Lv/VImage;

    .line 117
    .line 118
    new-array v3, v2, [Landroid/widget/TextView;

    .line 119
    .line 120
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 121
    .line 122
    new-array v2, v2, [Landroid/widget/ImageView;

    .line 123
    .line 124
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 125
    .line 126
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 127
    .line 128
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U0:Z

    .line 129
    .line 130
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 131
    .line 132
    new-instance v0, Ll/v370;

    .line 133
    .line 134
    invoke-direct {v0}, Ll/v370;-><init>()V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z0:Ll/v370;

    .line 138
    .line 139
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_0

    .line 146
    .line 147
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Ll/pm80;->a()V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Ll/cmg;->Y()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_0

    .line 159
    .line 160
    invoke-static {}, Ll/cmg;->f0()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_0

    .line 165
    .line 166
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0, v1}, Ll/ach;->l(Z)V

    .line 171
    .line 172
    .line 173
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$b;

    .line 174
    .line 175
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 176
    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a1:Ljava/lang/Runnable;

    .line 179
    .line 180
    const-string v0, "feed_like_menu_icon_default"

    .line 181
    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->c1:Ljava/lang/String;

    .line 183
    .line 184
    const-string v0, "feed_like_menu_icon"

    .line 185
    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->d1:Ljava/lang/String;

    .line 187
    .line 188
    return-void
.end method

.method public static bridge synthetic A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q0:[Lv/VImage;

    return-object p0
.end method

.method private A6(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fh70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/gh70;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/gh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic B5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->d1:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic C5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H0:Z

    return p0
.end method

.method public static bridge synthetic D5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    return-object p0
.end method

.method public static bridge synthetic E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P0:[Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic G5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic H5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    return-void
.end method

.method public static bridge synthetic I5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e1:Z

    return-void
.end method

.method public static bridge synthetic J5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U0:Z

    return-void
.end method

.method public static bridge synthetic K5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G0:I

    return-void
.end method

.method public static bridge synthetic L5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->Y0:Lrx/subjects/a;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic M5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->h6()Z

    move-result p0

    return p0
.end method

.method public static synthetic N4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic N5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->q6()I

    move-result p0

    return p0
.end method

.method public static synthetic O4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static bridge synthetic O5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->r6()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F6(I)V

    return-void
.end method

.method public static bridge synthetic P5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->s6(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y6(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic Q5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->w6()V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U6(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic R5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m7()V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P6(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->o7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/android/app/Act$r;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    goto :goto_1

    .line 8
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 9
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static bridge synthetic T5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u7()V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/putong/data/Counter;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Boolean;)Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->f7(Lcom/p1/mobile/putong/data/Counter;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Boolean;)Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic U5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v7()V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G6(I)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K6(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O6(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e7()V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V6()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private synthetic a7(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j6()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v1, v0, [Ll/tfj0$a;

    .line 7
    .line 8
    const-string v2, "e_moment_unread_notes_history"

    .line 9
    .line 10
    invoke-static {v2, p1, v1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "activities"

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-static {p0, v1, v2, v0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->X1(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R6(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->c7()V

    return-void
.end method

.method private c6(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->f0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->o6()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->o6()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 36
    .line 37
    aget-object v1, v1, v0

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x1

    .line 45
    if-nez v1, :cond_3

    .line 46
    .line 47
    move v6, v3

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    move v6, v2

    .line 50
    :goto_1
    new-instance v1, Ll/ayh;

    .line 51
    .line 52
    new-instance v4, Ll/ig70;

    .line 53
    .line 54
    invoke-direct {v4, p0, p1}, Ll/ig70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 55
    .line 56
    .line 57
    invoke-direct {v1, v2, v4}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 58
    .line 59
    .line 60
    new-instance v4, Ll/ayh;

    .line 61
    .line 62
    if-lez p1, :cond_4

    .line 63
    .line 64
    move p1, v3

    .line 65
    goto :goto_2

    .line 66
    :cond_4
    move p1, v2

    .line 67
    :goto_2
    new-instance v5, Ll/tg70;

    .line 68
    .line 69
    invoke-direct {v5, p0, v0}, Ll/tg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 70
    .line 71
    .line 72
    invoke-direct {v4, p1, v5}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 73
    .line 74
    .line 75
    new-instance p1, Ll/ayh;

    .line 76
    .line 77
    new-instance v5, Ll/eh70;

    .line 78
    .line 79
    invoke-direct {v5, p0, v0}, Ll/eh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 80
    .line 81
    .line 82
    invoke-direct {p1, v3, v5}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v4}, Ll/ayh;->b(Ll/ayh;)Ll/ayh;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v4, p1}, Ll/ayh;->b(Ll/ayh;)Ll/ayh;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ll/ayh;->a()V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 96
    .line 97
    aget-object p1, p1, v0

    .line 98
    .line 99
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 106
    .line 107
    aget-object p1, p1, v0

    .line 108
    .line 109
    :goto_3
    move-object v5, p1

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 112
    .line 113
    aget-object p1, p1, v0

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 117
    .line 118
    aget-object p1, p1, v0

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_6

    .line 125
    .line 126
    move v7, v3

    .line 127
    goto :goto_5

    .line 128
    :cond_6
    move v7, v2

    .line 129
    :goto_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->q6()I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    const/4 v9, 0x0

    .line 134
    move-object v4, p0

    .line 135
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->g6(Landroid/view/View;ZZILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S6(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e5(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->g:Ll/jl8;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jl8;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b7(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M6(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I6()V

    return-void
.end method

.method public static synthetic j5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N6(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->d7(Ljava/lang/String;)V

    return-void
.end method

.method private l7()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->a5()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J6(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method private m7()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->b5()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H6(I)V

    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T6(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic p5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/Act$r;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q6(Lcom/p1/mobile/android/app/Act$r;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z6(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    return-void
.end method

.method public static synthetic r5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    return-void
.end method

.method public static synthetic s5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L6(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E6(I)V

    return-void
.end method

.method public static bridge synthetic u5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    return-object p0
.end method

.method public static bridge synthetic v5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    return p0
.end method

.method private v7()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->m5()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static bridge synthetic w5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e1:Z

    return p0
.end method

.method private w6()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->V4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static bridge synthetic x5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    return p0
.end method

.method public static bridge synthetic y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G0:I

    return p0
.end method

.method public static bridge synthetic z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->c1:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final B6()V
    .locals 7

    .line 1
    new-instance v0, Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H:Lv/VFrame;

    .line 11
    .line 12
    new-instance v0, Lv/VFrame;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J:Lv/VFrame;

    .line 22
    .line 23
    new-instance v0, Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H:Lv/VFrame;

    .line 35
    .line 36
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    const/high16 v3, 0x42080000    # 34.0f

    .line 39
    .line 40
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const/4 v4, -0x2

    .line 45
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 52
    .line 53
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->G1:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 59
    .line 60
    const/high16 v1, 0x41600000    # 14.0f

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 66
    .line 67
    const/4 v1, -0x1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 72
    .line 73
    const/4 v1, 0x3

    .line 74
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 83
    .line 84
    const/high16 v1, 0x41400000    # 12.0f

    .line 85
    .line 86
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    const/4 v4, 0x0

    .line 95
    invoke-virtual {v0, v3, v4, v1, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 99
    .line 100
    sget v1, Ll/lbc0;->q5:I

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 106
    .line 107
    const/16 v1, 0x10

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 110
    .line 111
    .line 112
    new-instance v0, Lv/VImage;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K:Lv/VImage;

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J:Lv/VFrame;

    .line 124
    .line 125
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 126
    .line 127
    const/high16 v5, 0x42000000    # 32.0f

    .line 128
    .line 129
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    invoke-direct {v3, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K:Lv/VImage;

    .line 144
    .line 145
    sget v1, Ll/lbc0;->r3:I

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 151
    .line 152
    const/high16 v1, 0x41180000    # 9.5f

    .line 153
    .line 154
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    invoke-direct {v0, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 163
    .line 164
    .line 165
    const/16 v3, 0x35

    .line 166
    .line 167
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 168
    .line 169
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 170
    .line 171
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-direct {v3, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;-><init>(Landroid/content/Context;)V

    .line 176
    .line 177
    .line 178
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 179
    .line 180
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J:Lv/VFrame;

    .line 181
    .line 182
    invoke-virtual {v5, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 186
    .line 187
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    sget v5, Ll/k9c0;->o:I

    .line 192
    .line 193
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setOvalColor(I)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 201
    .line 202
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setWidth(I)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 210
    .line 211
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 212
    .line 213
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setRingWidth(I)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 221
    .line 222
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    sget v3, Ll/k9c0;->p0:I

    .line 227
    .line 228
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setRingColor(I)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 236
    .line 237
    const/4 v1, 0x2

    .line 238
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setRedPointType(I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->o()V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 247
    .line 248
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 249
    .line 250
    .line 251
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D:Lv/VFrame;

    .line 252
    .line 253
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method public final C6()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/ksg;->j0(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final D6()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a1:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E6(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->q7(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    aget-object v0, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    aget-object v0, v0, v1

    .line 27
    .line 28
    const/16 v1, 0x8

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    aget-object v0, v0, v1

    .line 40
    .line 41
    const/16 v1, 0x63

    .line 42
    .line 43
    if-le p1, v1, :cond_0

    .line 44
    .line 45
    const-string p1, "99+"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p1, ""

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    aget-object p1, p1, v0

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p7(Landroid/widget/TextView;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic F6(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j7(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G6(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->h7(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H6(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X5(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I6()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->h7(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J4()Ll/l4g0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q:Ll/l4g0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q:Ll/l4g0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic J6(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic K6(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->s7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic L6(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e6()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic M6(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/api/a;->I2()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/cmg;->Y()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->f0()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    aget-object p1, p1, v0

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    sget-boolean p1, Ll/ach;->g:Z

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/ach;->f()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    sput-boolean v0, Ll/ach;->g:Z

    .line 52
    .line 53
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 54
    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/4 p1, 0x1

    .line 62
    invoke-virtual {p0, p1}, Ll/ach;->l(Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public final synthetic N6(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Ll/bh70;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/bh70;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/ch70;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/ch70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/a;->G2()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public O0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic O6(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U0:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    instance-of p0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P0()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final synthetic P6(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/k3h;->I0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Q6(Lcom/p1/mobile/android/app/Act$r;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W:J

    .line 10
    .line 11
    :cond_0
    if-nez p1, :cond_2

    .line 12
    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic R6(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W:J

    .line 14
    .line 15
    sub-long/2addr v0, v4

    .line 16
    sget-wide v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->f1:J

    .line 17
    .line 18
    cmp-long p1, v0, v4

    .line 19
    .line 20
    if-lez p1, :cond_0

    .line 21
    .line 22
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W:J

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X:Lrx/subjects/b;

    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic S6(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Ll/zg70;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/zg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/ah70;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/ah70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic T6(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U6(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object p0, p0, Ll/jka;->a0:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-boolean v0, Ll/ach;->g:Z

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ach;->f()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/ach;->m()V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    sput-boolean v0, Ll/ach;->g:Z

    .line 37
    .line 38
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ll/ach;->k()V

    .line 43
    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X0:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->g7()V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    return-void
.end method

.method public V5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/th70;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic V6()Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->x7()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W5()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/th70;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->x6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->n7(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    .line 5
    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->y7(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final X5(II)V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    goto :goto_1

    .line 5
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->q7(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 9
    .line 10
    aget-object v0, v0, p1

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 17
    .line 18
    aget-object v0, v0, p1

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 26
    .line 27
    aget-object p1, v0, p1

    .line 28
    .line 29
    const/16 v0, 0x63

    .line 30
    .line 31
    if-le p2, v0, :cond_1

    .line 32
    .line 33
    const-string p2, "99+"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p2, ""

    .line 45
    .line 46
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/cmg;->Y()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m6()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    aget-object p1, p1, p2

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p7(Landroid/widget/TextView;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    return-void
.end method

.method public final synthetic X6(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/orb0;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R:Ll/keh;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->t6()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S:Ll/y20;

    .line 27
    .line 28
    invoke-interface {p1, v0, v1, v2, v3}, Ll/keh;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/l94;->j()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v6()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public Y()Lcom/p1/mobile/android/app/Frag;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 14
    .line 15
    return-object p0
.end method

.method public final Y5(I)Z
    .locals 3

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ge p1, p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    sget-object p0, Ll/pu20;->d:Ll/byd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    const-wide/16 v1, 0x0

    .line 20
    .line 21
    cmp-long p0, p0, v1

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Ll/pu20;->d:Ll/byd0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/Long;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide p0

    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-static {p0, p1, v1, v2}, Ll/p6i;->f(JJ)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return v0

    .line 49
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method public final synthetic Y6(Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/orb0;->I()V

    .line 13
    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/l94;->j()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v1, 0x0

    .line 28
    new-array v1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "camera"

    .line 35
    .line 36
    invoke-static {p1, v1, v0, v2}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v6()V

    .line 40
    .line 41
    .line 42
    return v0
.end method

.method public final Z5(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_2

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic Z6(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$f;

    .line 2
    .line 3
    invoke-static {p4}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-direct {v0, p0, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$f;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M0:Ll/h80;

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    invoke-virtual {p0, p1, v0, p2}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final a6()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b6()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final b6()Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H0:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a1:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->h6()Z

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final synthetic b7(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x312

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic c7()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d6(I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    aget-object v0, v0, v2

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    move v0, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_0
    new-instance v3, Ll/ayh;

    .line 28
    .line 29
    new-instance v4, Ll/wg70;

    .line 30
    .line 31
    invoke-direct {v4, p0, p1}, Ll/wg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v3, v2, v4}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ll/ayh;

    .line 38
    .line 39
    new-instance v4, Ll/xg70;

    .line 40
    .line 41
    invoke-direct {v4, p0}, Ll/xg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p1, v1, v4}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, p1}, Ll/ayh;->b(Ll/ayh;)Ll/ayh;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ll/ayh;->a()V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    aget-object p1, p1, v3

    .line 60
    .line 61
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    aget-object p1, p1, v3

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    aget-object p1, p1, v3

    .line 83
    .line 84
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    aget-object v3, v3, v4

    .line 91
    .line 92
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-nez v3, :cond_3

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    move v1, v2

    .line 100
    :goto_2
    const/16 v2, 0xb

    .line 101
    .line 102
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->f6(Landroid/view/View;ZZI)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final synthetic d7(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/cmg;->f0()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    aget-object p1, p1, v0

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 31
    .line 32
    aget-object p0, p0, v0

    .line 33
    .line 34
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    sput-boolean p0, Ll/kbh;->i:Z

    .line 42
    .line 43
    sput-boolean v0, Ll/kbh;->g:Z

    .line 44
    .line 45
    sput-boolean v0, Ll/kbh;->h:Z

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public e6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K0:Ljava/lang/String;

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
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K0:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K0:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic e7()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z6()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final f6(Landroid/view/View;ZZI)V
    .locals 0

    .line 1
    xor-int p0, p2, p3

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/byh;->s(Ljava/lang/Integer;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 p3, 0x0

    .line 29
    invoke-virtual {p0, p3, p1, p4, p2}, Ll/byh;->q(ZLandroid/view/View;ILjava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic f7(Lcom/p1/mobile/putong/data/Counter;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Boolean;)Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;
    .locals 8

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 2
    .line 3
    invoke-static {}, Ll/cmg;->f0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 11
    .line 12
    iget v1, v1, Lcom/p1/mobile/putong/data/CouterMoments;->unreadLikeFeeds:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, v2

    .line 16
    :goto_0
    invoke-static {}, Ll/cmg;->Y()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    move v3, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 25
    .line 26
    iget v3, v3, Lcom/p1/mobile/putong/data/CouterMoments;->unreadFeeds:I

    .line 27
    .line 28
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 29
    .line 30
    iget v4, p1, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-virtual {p3}, Ljava/lang/Double;->doubleValue()D

    .line 37
    .line 38
    .line 39
    move-result-wide p1

    .line 40
    const-wide/16 v6, 0x0

    .line 41
    .line 42
    cmpl-double p1, p1, v6

    .line 43
    .line 44
    if-lez p1, :cond_2

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    :cond_2
    move v6, v2

    .line 48
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    move v2, v1

    .line 53
    move-object v1, p0

    .line 54
    invoke-direct/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;IIIZZZ)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method

.method public g2()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 9
    .line 10
    aget-object v0, v0, v1

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->f0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 27
    .line 28
    aget-object v0, v0, v1

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    iget-object v0, v0, Ll/jka;->a0:Ll/wyd0;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X0:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->n7(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p0:Z

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E0:I

    .line 61
    .line 62
    if-lez v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p0:Z

    .line 74
    .line 75
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E0:I

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->n7(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance v0, Ll/ug70;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/ug70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/byh;->w(Ll/byh$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->B6()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {}, Ll/cmg;->Y()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "\u559c\u6b22"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    const/4 v1, 0x0

    .line 37
    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 41
    .line 42
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-interface {p1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v3, "from_like"

    .line 66
    .line 67
    const/16 v4, 0xc

    .line 68
    .line 69
    const/4 v5, -0x1

    .line 70
    const-string v6, "-1"

    .line 71
    .line 72
    invoke-static {v0, v3, v5, v6, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const-string v4, "from_nearby_focus"

    .line 91
    .line 92
    invoke-static {v3, v4, v5, v6, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    const-string v7, "from_nearby_falls_feed"

    .line 111
    .line 112
    invoke-static {v4, v7, v5, v6, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-static {}, Ll/cmg;->Y()Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eqz v5, :cond_1

    .line 121
    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_1
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    :goto_1
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 133
    .line 134
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->p(Ljava/util/List;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z:Landroid/widget/RelativeLayout;

    .line 138
    .line 139
    const-string v0, "photo_album_root"

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    sget v3, Ll/k9c0;->n0:I

    .line 169
    .line 170
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setupViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 185
    .line 186
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTabLayout()Lv/navigationbar/VNavigationTabLayout;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J:Lv/VFrame;

    .line 195
    .line 196
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H:Lv/VFrame;

    .line 197
    .line 198
    const/4 v5, 0x2

    .line 199
    new-array v5, v5, [Landroid/view/View;

    .line 200
    .line 201
    aput-object v0, v5, v1

    .line 202
    .line 203
    aput-object v3, v5, v2

    .line 204
    .line 205
    invoke-virtual {p1, v5}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 206
    .line 207
    .line 208
    move p1, v1

    .line 209
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 210
    .line 211
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-ge p1, v0, :cond_3

    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 218
    .line 219
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->m(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 224
    .line 225
    invoke-virtual {v3, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v3, v0}, Lv/navigationbar/VNavigationTabLayout$f;->n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 236
    .line 237
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    iget-object v0, v0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 245
    .line 246
    if-nez p1, :cond_2

    .line 247
    .line 248
    const/high16 v3, 0x40800000    # 4.0f

    .line 249
    .line 250
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    goto :goto_3

    .line 255
    :cond_2
    move v3, v1

    .line 256
    :goto_3
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 257
    .line 258
    invoke-virtual {v5, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    iget-object v5, v5, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 266
    .line 267
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 272
    .line 273
    invoke-virtual {v6, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    iget-object v6, v6, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 281
    .line 282
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    invoke-virtual {v0, v3, v5, v1, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 287
    .line 288
    .line 289
    add-int/lit8 p1, p1, 0x1

    .line 290
    .line 291
    goto :goto_2

    .line 292
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 293
    .line 294
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;

    .line 295
    .line 296
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationTabLayout;->setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$d;)V

    .line 300
    .line 301
    .line 302
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y:Z

    .line 303
    .line 304
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->n6()I

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    invoke-virtual {p0, p1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->y6(ILcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 309
    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I:Lv/VText;

    .line 312
    .line 313
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A6(Landroid/view/View;)V

    .line 314
    .line 315
    .line 316
    new-instance p1, Ll/yvg;

    .line 317
    .line 318
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j6()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    invoke-direct {p1, v0, v1}, Ll/yvg;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J0:Ll/q1i;

    .line 330
    .line 331
    invoke-static {}, Ll/ihh;->h()Ll/ihh;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-virtual {p1, p0}, Ll/ihh;->k(Ll/t2m;)V

    .line 336
    .line 337
    .line 338
    invoke-static {}, Ll/wsg;->g()Ll/wsg;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    invoke-virtual {p1, p0}, Ll/wsg;->j(Ll/t2m;)V

    .line 343
    .line 344
    .line 345
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D:Lv/VFrame;

    .line 346
    .line 347
    new-instance v0, Ll/vg70;

    .line 348
    .line 349
    invoke-direct {v0, p0}, Ll/vg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 350
    .line 351
    .line 352
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 353
    .line 354
    .line 355
    return-void
.end method

.method public final g6(Landroid/view/View;ZZILjava/lang/String;)V
    .locals 0

    .line 1
    xor-int p0, p2, p3

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/byh;->s(Ljava/lang/Integer;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p0, p2, p1, p4, p5}, Ll/byh;->p(ZLandroid/view/View;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final g7()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->q6()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ll/byh;->f(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/pf60;

    .line 22
    .line 23
    const-string v2, "red_dot_relation_child"

    .line 24
    .line 25
    const-string v3, "red_dot_like"

    .line 26
    .line 27
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    filled-new-array {v1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "e_red_dot_explore"

    .line 35
    .line 36
    invoke-static {v2, v0, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->n7(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final h6()Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H0:Z

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    sget-object v3, Ll/pu20;->e:Ll/byd0;

    .line 9
    .line 10
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    check-cast v3, Ljava/lang/Long;

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    sub-long/2addr v1, v3

    .line 21
    const-wide/32 v3, 0xa4cb800

    .line 22
    .line 23
    .line 24
    cmp-long v1, v1, v3

    .line 25
    .line 26
    if-gez v1, :cond_0

    .line 27
    .line 28
    return v0

    .line 29
    :cond_0
    invoke-static {}, Ll/rkh;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a1:Ljava/lang/Runnable;

    .line 36
    .line 37
    const-wide/16 v1, 0x64

    .line 38
    .line 39
    invoke-static {p0, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_1
    return v0
.end method

.method public final h7(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 11
    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final i6(Landroid/view/View;ZZIZZ)V
    .locals 7

    .line 1
    xor-int/2addr p3, p2

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    if-eqz p6, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    return-void

    .line 8
    :cond_1
    :goto_0
    if-eqz p2, :cond_3

    .line 9
    .line 10
    if-eqz p6, :cond_2

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_2
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/byh;->s(Ljava/lang/Integer;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_3
    :goto_1
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->r6()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    const/4 v6, 0x1

    .line 35
    move-object v1, p1

    .line 36
    move v2, p4

    .line 37
    move v3, p5

    .line 38
    move v4, p6

    .line 39
    invoke-virtual/range {v0 .. v6}, Ll/byh;->k(Landroid/view/View;IZZLjava/lang/String;Z)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k0:I

    .line 44
    .line 45
    return-void
.end method

.method public i7()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U0:Z

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    instance-of p0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    instance-of p0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->m5()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroidx/fragment/app/FragmentManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public j0()V
    .locals 0

    .line 1
    return-void
.end method

.method public j1(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->l6(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    const/16 v1, 0xc

    .line 8
    .line 9
    if-ne v1, p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e1:Z

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public j6()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/cmg;->Y()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_like"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "p_follow"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "p_nearby"

    .line 18
    .line 19
    return-object p0
.end method

.method public final j7(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 11
    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->f0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    sput-boolean p0, Ll/kbh;->h:Z

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 30
    .line 31
    const-string p1, "recommend"

    .line 32
    .line 33
    iput-object p1, p0, Ll/jka;->G1:Ljava/lang/String;

    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public k6()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q:Ll/l4g0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O:Ll/l4g0;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const-string p0, "p_follow"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P:Ll/l4g0;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    const-string p0, "p_nearby"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N:Ll/l4g0;

    .line 18
    .line 19
    if-ne v0, p0, :cond_2

    .line 20
    .line 21
    const-string p0, "p_like"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    const-string p0, ""

    .line 25
    .line 26
    return-object p0
.end method

.method public final k7()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_6

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Landroidx/fragment/app/Fragment;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-string v5, "page_type"

    .line 32
    .line 33
    const/4 v6, -0x2

    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    move v4, v6

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    :goto_1
    const/4 v7, 0x1

    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    move v4, v7

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    move v4, v1

    .line 52
    :goto_2
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    if-nez v8, :cond_2

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_2
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    invoke-virtual {v8, v5, v6}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    :goto_3
    const/16 v5, 0xc

    .line 68
    .line 69
    if-eq v5, v6, :cond_3

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_3
    move v7, v1

    .line 73
    :goto_4
    instance-of v5, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 74
    .line 75
    if-eqz v5, :cond_5

    .line 76
    .line 77
    if-nez v4, :cond_4

    .line 78
    .line 79
    if-eqz v7, :cond_5

    .line 80
    .line 81
    :cond_4
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 84
    .line 85
    .line 86
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    return-void
.end method

.method public l6(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_2

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/4 v3, -0x2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v4, "page_type"

    .line 47
    .line 48
    invoke-virtual {v2, v4, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    :goto_1
    if-ne p1, v3, :cond_1

    .line 53
    .line 54
    return v1

    .line 55
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 p0, -0x1

    .line 59
    return p0
.end method

.method public m(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->o5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final m6()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final n6()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final n7(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->c6(I)V

    .line 11
    .line 12
    .line 13
    iget v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->c:I

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->d6(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p6()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ltz v2, :cond_1

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S0:[Landroid/widget/ImageView;

    .line 25
    .line 26
    array-length v4, v3

    .line 27
    if-ge v2, v4, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 30
    .line 31
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 32
    .line 33
    invoke-virtual {p0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-interface {v2, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    aget-object v2, v3, v2

    .line 42
    .line 43
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->d:Z

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->d:Z

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 53
    .line 54
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    invoke-virtual {v2, v3, v4}, Ll/jka;->ud(J)V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->c:I

    .line 66
    .line 67
    const/4 v7, 0x1

    .line 68
    const/4 v8, 0x0

    .line 69
    if-lez v2, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C6()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_3

    .line 76
    .line 77
    move v6, v7

    .line 78
    goto :goto_0

    .line 79
    :cond_3
    move v6, v8

    .line 80
    :goto_0
    if-eqz v6, :cond_4

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->c:I

    .line 87
    .line 88
    invoke-static {v2, v3}, Ll/orb0;->B(Lcom/p1/mobile/android/app/Act;I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    const/4 v3, -0x1

    .line 97
    invoke-static {v2, v3}, Ll/orb0;->B(Lcom/p1/mobile/android/app/Act;I)V

    .line 98
    .line 99
    .line 100
    :goto_1
    invoke-static {}, Ll/cmg;->f0()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_a

    .line 105
    .line 106
    if-nez v6, :cond_6

    .line 107
    .line 108
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-gtz v2, :cond_5

    .line 113
    .line 114
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->d:Z

    .line 115
    .line 116
    if-nez v2, :cond_5

    .line 117
    .line 118
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->f:Z

    .line 119
    .line 120
    if-nez v2, :cond_6

    .line 121
    .line 122
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 123
    .line 124
    if-eqz v2, :cond_6

    .line 125
    .line 126
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C6()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_6

    .line 131
    .line 132
    move v3, v7

    .line 133
    goto :goto_2

    .line 134
    :cond_6
    move v3, v8

    .line 135
    :goto_2
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 136
    .line 137
    if-eqz v2, :cond_9

    .line 138
    .line 139
    iget-boolean v4, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 140
    .line 141
    if-eqz v4, :cond_9

    .line 142
    .line 143
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const/4 v4, 0x4

    .line 148
    invoke-virtual {v2, v4}, Ll/byh;->n(I)V

    .line 149
    .line 150
    .line 151
    if-nez v3, :cond_8

    .line 152
    .line 153
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 154
    .line 155
    if-eqz v1, :cond_7

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_7
    move v7, v8

    .line 159
    :cond_8
    :goto_3
    iput-boolean v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 160
    .line 161
    return-void

    .line 162
    :cond_9
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    iget-boolean v5, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 167
    .line 168
    const/4 v1, 0x0

    .line 169
    move-object v0, p0

    .line 170
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i6(Landroid/view/View;ZZIZZ)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-static {v1, v3}, Ll/orb0;->A(Lcom/p1/mobile/android/app/Act;Z)V

    .line 178
    .line 179
    .line 180
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 181
    .line 182
    return-void

    .line 183
    :cond_a
    invoke-static {}, Ll/cmg;->Y()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    if-nez v2, :cond_b

    .line 188
    .line 189
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-lez v2, :cond_b

    .line 194
    .line 195
    move v2, v7

    .line 196
    goto :goto_4

    .line 197
    :cond_b
    move v2, v8

    .line 198
    :goto_4
    if-nez v6, :cond_d

    .line 199
    .line 200
    if-nez v2, :cond_c

    .line 201
    .line 202
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->d:Z

    .line 203
    .line 204
    if-nez v2, :cond_c

    .line 205
    .line 206
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->f:Z

    .line 207
    .line 208
    if-nez v2, :cond_d

    .line 209
    .line 210
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 211
    .line 212
    if-eqz v2, :cond_d

    .line 213
    .line 214
    :cond_c
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C6()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-nez v2, :cond_d

    .line 219
    .line 220
    move v9, v7

    .line 221
    goto :goto_5

    .line 222
    :cond_d
    move v9, v8

    .line 223
    :goto_5
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 224
    .line 225
    if-eqz v6, :cond_e

    .line 226
    .line 227
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    iget-boolean v5, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 232
    .line 233
    const/4 v6, 0x1

    .line 234
    const/4 v1, 0x0

    .line 235
    const/4 v3, 0x0

    .line 236
    move-object v0, p0

    .line 237
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i6(Landroid/view/View;ZZIZZ)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-static {v1, v8}, Ll/orb0;->A(Lcom/p1/mobile/android/app/Act;Z)V

    .line 245
    .line 246
    .line 247
    goto :goto_a

    .line 248
    :cond_e
    if-nez v9, :cond_10

    .line 249
    .line 250
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 251
    .line 252
    if-eqz v3, :cond_f

    .line 253
    .line 254
    goto :goto_6

    .line 255
    :cond_f
    move v3, v8

    .line 256
    goto :goto_7

    .line 257
    :cond_10
    :goto_6
    move v3, v7

    .line 258
    :goto_7
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I

    .line 259
    .line 260
    .line 261
    move-result v4

    .line 262
    iget-boolean v5, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->e:Z

    .line 263
    .line 264
    const/4 v6, 0x0

    .line 265
    const/4 v1, 0x0

    .line 266
    move-object v0, p0

    .line 267
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i6(Landroid/view/View;ZZIZZ)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    if-nez v9, :cond_12

    .line 275
    .line 276
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 277
    .line 278
    if-eqz v2, :cond_11

    .line 279
    .line 280
    goto :goto_8

    .line 281
    :cond_11
    move v2, v8

    .line 282
    goto :goto_9

    .line 283
    :cond_12
    :goto_8
    move v2, v7

    .line 284
    :goto_9
    invoke-static {v1, v2}, Ll/orb0;->A(Lcom/p1/mobile/android/app/Act;Z)V

    .line 285
    .line 286
    .line 287
    :goto_a
    if-nez v9, :cond_14

    .line 288
    .line 289
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y0:Z

    .line 290
    .line 291
    if-eqz v1, :cond_13

    .line 292
    .line 293
    goto :goto_b

    .line 294
    :cond_13
    move v7, v8

    .line 295
    :cond_14
    :goto_b
    iput-boolean v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z:Z

    .line 296
    .line 297
    return-void
.end method

.method public final o6()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "\u559c\u6b22"

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final o7(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ll/sbh;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/ih70;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/ih70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, p0, v1, v2}, Ll/sbh;-><init>(Ll/t2m;Landroid/content/Context;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q0:[Lv/VImage;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    array-length v1, v1

    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 49
    .line 50
    sget v0, Ll/qa00;->e:I

    .line 51
    .line 52
    const/16 v1, 0x50

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-static {p0, p1, v2, v0, v1}, Ll/kl80;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/cmg;->Y()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N:Ll/l4g0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/byh;->t()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P:Ll/l4g0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O:Ll/l4g0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/cmg;->Y()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N:Ll/l4g0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->o()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    sput-boolean p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->g1:Z

    .line 5
    .line 6
    invoke-static {}, Ll/jyh;->a()Ll/jyh;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Ll/jyh;->a:Lrx/subjects/a;

    .line 11
    .line 12
    xor-int/lit8 v1, p1, 0x1

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/cmg;->N()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    move v0, v1

    .line 37
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-ge v0, v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 60
    .line 61
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 62
    .line 63
    if-eqz v3, :cond_0

    .line 64
    .line 65
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->e5(Z)V

    .line 68
    .line 69
    .line 70
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    if-eqz p1, :cond_6

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V0:Lcom/p1/mobile/android/app/Dialog;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V0:Lcom/p1/mobile/android/app/Dialog;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V0:Lcom/p1/mobile/android/app/Dialog;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M:Landroid/widget/PopupWindow;

    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_4

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_4

    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->b1:Ll/sbh;

    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 146
    .line 147
    .line 148
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a1:Ljava/lang/Runnable;

    .line 164
    .line 165
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Ll/tog;->o()V

    .line 169
    .line 170
    .line 171
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->m7()V

    .line 172
    .line 173
    .line 174
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v7()V

    .line 175
    .line 176
    .line 177
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->w6()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->e6()V

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 185
    .line 186
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_7

    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;

    .line 193
    .line 194
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->c:I

    .line 195
    .line 196
    :cond_7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->t7(I)V

    .line 197
    .line 198
    .line 199
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k0:I

    .line 200
    .line 201
    const/16 v1, 0xa

    .line 202
    .line 203
    if-ne v0, v1, :cond_8

    .line 204
    .line 205
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k0:I

    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->r6()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v0, v1, v2}, Ll/byh;->m(ILjava/lang/String;)V

    .line 216
    .line 217
    .line 218
    goto :goto_1

    .line 219
    :cond_8
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k0:I

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ll/byh;->l(I)V

    .line 226
    .line 227
    .line 228
    :goto_1
    invoke-static {}, Ll/jyh;->a()Ll/jyh;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    const/4 v1, 0x1

    .line 233
    iput-boolean v1, v0, Ll/jyh;->b:Z

    .line 234
    .line 235
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 236
    .line 237
    if-ne v0, v1, :cond_9

    .line 238
    .line 239
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 240
    .line 241
    iget-object v0, v0, Ll/jka;->Y0:Lrx/subjects/a;

    .line 242
    .line 243
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->a6()Z

    .line 249
    .line 250
    .line 251
    invoke-static {}, Ll/j4h;->d()Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-eqz v0, :cond_a

    .line 256
    .line 257
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->l7()V

    .line 258
    .line 259
    .line 260
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->w7()V

    .line 261
    .line 262
    .line 263
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Z5(Z)V

    .line 264
    .line 265
    .line 266
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T:Lrx/subjects/a;

    .line 267
    .line 268
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    const-string v0, "moment"

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J0:Ll/q1i;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/q1i;->p()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final p6()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->O0:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public final p7(Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "#ff3228"

    .line 8
    .line 9
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/lbc0;->V0:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    const/high16 p0, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j6()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final q6()I
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0xf

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x3

    .line 11
    return p0
.end method

.method public q7(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R0:[Landroid/widget/TextView;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    check-cast p0, Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 12
    .line 13
    const/16 v0, 0xa

    .line 14
    .line 15
    if-ge p2, v0, :cond_0

    .line 16
    .line 17
    const/high16 p2, 0x41200000    # 10.0f

    .line 18
    .line 19
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/16 v0, 0x63

    .line 27
    .line 28
    if-gt p2, v0, :cond_1

    .line 29
    .line 30
    const/high16 p2, 0x40c00000    # 6.0f

    .line 31
    .line 32
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p2, 0x0

    .line 40
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final r6()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "p_nearby"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 12
    .line 13
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getSelectedTabPosition()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/cmg;->Y()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "p_like"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, "p_follow"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    return-object v1
.end method

.method public r7()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->T0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U0:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 18
    .line 19
    new-instance v1, Ll/dh70;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/dh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->i5(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final s6(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "p_nearby"

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/cmg;->Y()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "p_like"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "p_follow"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    return-object v0
.end method

.method public final s7()Z
    .locals 11

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->z7()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v2, 0xb

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const/4 v10, 0x1

    .line 26
    invoke-virtual {p0, v10}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    const/4 v5, 0x2

    .line 31
    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const/4 v6, 0x5

    .line 36
    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const/4 v8, 0x0

    .line 41
    const/4 v9, 0x0

    .line 42
    const/4 v7, 0x4

    .line 43
    invoke-virtual/range {v3 .. v9}, Ljava/util/Calendar;->set(IIIIII)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x4

    .line 47
    if-lt v2, p0, :cond_0

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    cmp-long p0, v0, v2

    .line 54
    .line 55
    if-gez p0, :cond_0

    .line 56
    .line 57
    return v10

    .line 58
    :cond_0
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public final t6()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "\u559c\u6b22"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string p0, "like"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const-string p0, "follow"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const-string p0, "nearby"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    const-string p0, "other"

    .line 55
    .line 56
    return-object p0
.end method

.method public final t7(I)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->g1:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L0:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "\u8fd9\u91cc\u6709"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "\u6761\u6d88\u606f\u5728\u7b49\u4f60\u56de\u590d\uff5e"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Y5(I)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object p1, Ll/pu20;->d:Ll/byd0;

    .line 44
    .line 45
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-direct {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v1, Ll/k9c0;->n:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    filled-new-array {v0}, [I

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const/high16 v0, 0x41500000    # 13.0f

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const/4 v0, 0x1

    .line 98
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-wide/16 v1, 0xbb8

    .line 103
    .line 104
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget v1, Ll/qa00;->d:I

    .line 109
    .line 110
    neg-int v1, v1

    .line 111
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 116
    .line 117
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 118
    .line 119
    or-int/2addr v1, v2

    .line 120
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 125
    .line 126
    const/high16 v2, 0x40c00000    # 6.0f

    .line 127
    .line 128
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D:Lv/VFrame;

    .line 141
    .line 142
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K0:Ljava/lang/String;

    .line 147
    .line 148
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L0:Z

    .line 149
    .line 150
    :cond_2
    :goto_0
    return-void
.end method

.method public final u6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)I
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->b:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->a:I

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E0:I

    .line 15
    .line 16
    if-lez p0, :cond_1

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    return p1
.end method

.method public final u7()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/rkh;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    sget-object v0, Ll/pu20;->e:Ll/byd0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/j4h;->b()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x1

    .line 32
    const-string v2, "p_alert_positioning_authority_explore_popup"

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v2, v1}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {}, Ll/j4h;->b()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v3, 0x0

    .line 66
    invoke-virtual {v0, v2, v3, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    new-instance v6, Ll/hh70;

    .line 78
    .line 79
    invoke-direct {v6, p0}, Ll/hh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 80
    .line 81
    .line 82
    const/4 v9, 0x1

    .line 83
    const-string v10, "p_alert_positioning_authority_explore_popup"

    .line 84
    .line 85
    const/4 v7, 0x0

    .line 86
    const/4 v8, 0x0

    .line 87
    invoke-interface/range {v4 .. v10}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showLocationPermissionCallbackDlg(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_0
    return-void
.end method

.method public v3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final v6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D6()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F0:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F0:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final w7()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j6()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/tfj0$a;

    .line 7
    .line 8
    const-string v1, "e_moment_unread_notes_history"

    .line 9
    .line 10
    invoke-static {v1, p0, v0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final x6(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->b:I

    .line 8
    .line 9
    if-lez p1, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p0:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E0:I

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;->a:I

    .line 19
    .line 20
    if-lez p1, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->p0:Z

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E0:I

    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final x7()Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$g;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jka;->Yc(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 13
    .line 14
    iget-object v1, v1, Ll/jka;->Y0:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v1}, Lrx/c;->asObservable()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isHideRedByNewUser()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    new-instance v4, Ll/yg70;

    .line 39
    .line 40
    invoke-direct {v4, p0}, Ll/yg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2, v3, v4}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->W5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y6(ILcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I0:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "\u559c\u6b22"

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 50
    :goto_1
    instance-of p1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    if-eqz p2, :cond_3

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method public final y7(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    sget v1, Ll/lbc0;->P0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F:Lv/VText;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F:Lv/VText;

    .line 17
    .line 18
    const/16 v1, 0x63

    .line 19
    .line 20
    if-le p1, v1, :cond_0

    .line 21
    .line 22
    const-string v1, "99+"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, ""

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    sget v1, Ll/lbc0;->O0:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F:Lv/VText;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->t7(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final z6()V
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->f0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object v0, v0, Ll/jka;->B0:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/jh70;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/jh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    :cond_0
    new-instance v0, Ll/jg70;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/jg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/kg70;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/kg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Ll/lg70;

    .line 52
    .line 53
    invoke-direct {v2}, Ll/lg70;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/cn40;->F()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/mg70;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/mg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/ng70;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/ng70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/og70;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/og70;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/pg70;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/pg70;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/qg70;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/qg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ll/kl40;->f()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_1

    .line 138
    .line 139
    invoke-static {}, Ll/cmg;->Y()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-static {}, Ll/cmg;->f0()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_2

    .line 150
    .line 151
    :cond_1
    new-instance v0, Ll/rg70;

    .line 152
    .line 153
    invoke-direct {v0, p0}, Ll/rg70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 157
    .line 158
    .line 159
    :cond_2
    invoke-static {}, Ll/orb0;->p()Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/kh70;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/kh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c1()Lrx/c;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    new-instance v1, Ll/lh70;

    .line 188
    .line 189
    invoke-direct {v1, p0}, Ll/lh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 190
    .line 191
    .line 192
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 197
    .line 198
    .line 199
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->V:Z

    .line 200
    .line 201
    if-eqz v0, :cond_3

    .line 202
    .line 203
    new-instance v0, Ll/mh70;

    .line 204
    .line 205
    invoke-direct {v0, p0}, Ll/mh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->X:Lrx/subjects/b;

    .line 212
    .line 213
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    new-instance v1, Ll/nh70;

    .line 218
    .line 219
    invoke-direct {v1, p0}, Ll/nh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 220
    .line 221
    .line 222
    new-instance v2, Ll/oh70;

    .line 223
    .line 224
    invoke-direct {v2}, Ll/oh70;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 232
    .line 233
    .line 234
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    new-instance v0, Ll/ph70;

    .line 243
    .line 244
    invoke-direct {v0}, Ll/ph70;-><init>()V

    .line 245
    .line 246
    .line 247
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    return-void
.end method
