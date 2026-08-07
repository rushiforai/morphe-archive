.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;
.super Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;
.source "SourceFile"

# interfaces
.implements Ll/ipw;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;
    }
.end annotation


# instance fields
.field public A:I

.field public B:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Lv/VDraweeView;",
            ">;>;"
        }
    .end annotation
.end field

.field public C:I

.field public D:I

.field public E:Lv/VImage;

.field public F:Lv/VImage;

.field public G:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;

.field public H:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

.field public I:Ll/vel0;

.field public J:Ljava/lang/String;

.field public K:Ljava/lang/String;

.field public L:Ljava/io/File;

.field public M:[I

.field public N:Landroid/widget/TextView;

.field public c:Lv/VLinear;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Landroid/view/TextureView;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

.field public i:Lcom/p1/mobile/putong/data/Video;

.field public j:Ljava/lang/String;

.field public k:Ll/fe00;

.field public l:Lcom/immomo/moment/mediautils/cmds/VideoCut;

.field public m:Z

.field public n:Ll/fam;

.field public o:J

.field public p:J

.field public q:I

.field public r:I

.field public s:F

.field public final t:I

.field public final u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->m:Z

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o:J

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 12
    .line 13
    const/16 v1, 0x3a98

    .line 14
    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 16
    .line 17
    const/16 v1, 0xbb8

    .line 18
    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r:I

    .line 20
    .line 21
    const v1, 0x44bb8000    # 1500.0f

    .line 22
    .line 23
    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    .line 25
    .line 26
    const/high16 v1, 0x40800000    # 4.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->t:I

    .line 33
    .line 34
    const/high16 v1, 0x42600000    # 56.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->u:I

    .line 41
    .line 42
    const-string v1, "#EEEFF1"

    .line 43
    .line 44
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->v:I

    .line 49
    .line 50
    const-string v1, "#F6F7F8"

    .line 51
    .line 52
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->w:I

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z:F

    .line 60
    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    .line 62
    .line 63
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->B:Lrx/subjects/a;

    .line 68
    .line 69
    return-void
.end method

.method public static bridge synthetic A2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->y:I

    return p0
.end method

.method public static bridge synthetic B2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->H:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    return-object p0
.end method

.method public static bridge synthetic C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->M:[I

    return-object p0
.end method

.method public static bridge synthetic D2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->F:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic E2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->E:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic F2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;I)J
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N2(I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static bridge synthetic H2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->c3()V

    return-void
.end method

.method public static L2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "media"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "extra_from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private M2()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->J:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o:J

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 10
    .line 11
    const/4 v6, 0x1

    .line 12
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->j:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;->Z1(Landroid/content/Context;Ljava/lang/String;JJZLjava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private N2(I)J
    .locals 2

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    .line 2
    .line 3
    float-to-long v0, p0

    .line 4
    add-int/lit8 p1, p1, -0x1

    .line 5
    .line 6
    int-to-long p0, p1

    .line 7
    mul-long/2addr v0, p0

    .line 8
    const-wide/16 p0, 0x3e8

    .line 9
    .line 10
    mul-long/2addr v0, p0

    .line 11
    return-wide v0
.end method

.method private Q2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->p0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->m:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/k9c0;->n:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 53
    .line 54
    const/high16 v1, 0x41900000    # 18.0f

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 60
    .line 61
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->m:I

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 77
    .line 78
    const/4 v2, 0x1

    .line 79
    new-array v2, v2, [Landroid/view/View;

    .line 80
    .line 81
    const/4 v3, 0x0

    .line 82
    aput-object v1, v2, v3

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 88
    .line 89
    new-instance v1, Ll/lp20;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/lp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private synthetic S2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->I:Ll/vel0;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/fam;->resume()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->N:Landroid/widget/TextView;

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 42
    .line 43
    if-ne p1, v0, :cond_2

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->m:Z

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 57
    .line 58
    invoke-interface {p0}, Ll/fam;->pause()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 63
    .line 64
    if-ne p1, v0, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 75
    .line 76
    invoke-interface {p1}, Ll/fam;->release()V

    .line 77
    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 81
    .line 82
    :cond_3
    return-void
.end method

.method private synthetic U2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic V2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic W2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->Q2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/ip20;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/ip20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/jp20;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/jp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/kp20;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/kp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->b3()V

    return-void
.end method

.method private synthetic X2()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->W2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->S2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->a3(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->V2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->R2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->Z2(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->T2()Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->X2()V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->U2(Ll/uxj0;)V

    return-void
.end method

.method public static bridge synthetic i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->t:I

    return p0
.end method

.method public static bridge synthetic k2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    return p0
.end method

.method public static bridge synthetic l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->v:I

    return p0
.end method

.method public static bridge synthetic m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->w:I

    return p0
.end method

.method public static bridge synthetic n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->L:Ljava/io/File;

    return-object p0
.end method

.method public static bridge synthetic o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z:F

    return p0
.end method

.method public static bridge synthetic p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->F:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic q2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->B:Lrx/subjects/a;

    return-object p0
.end method

.method private r()V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->K2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 7
    .line 8
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z:F

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Dimension;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->f:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o:J

    .line 22
    .line 23
    sub-long/2addr v1, v3

    .line 24
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e3(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->I:Ll/vel0;

    .line 32
    .line 33
    iget v1, v0, Ll/vel0;->f:I

    .line 34
    .line 35
    const/16 v2, 0x5a

    .line 36
    .line 37
    if-eq v1, v2, :cond_1

    .line 38
    .line 39
    const/16 v2, 0x10e

    .line 40
    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 47
    .line 48
    iget v2, v0, Ll/vel0;->c:I

    .line 49
    .line 50
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 51
    .line 52
    iget v0, v0, Ll/vel0;->d:I

    .line 53
    .line 54
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 60
    .line 61
    iget v2, v0, Ll/vel0;->d:I

    .line 62
    .line 63
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 64
    .line 65
    iget v0, v0, Ll/vel0;->c:I

    .line 66
    .line 67
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 68
    .line 69
    :goto_1
    const/high16 v0, 0x43870000    # 270.0f

    .line 70
    .line 71
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z:F

    .line 76
    .line 77
    float-to-int v2, v2

    .line 78
    mul-int/2addr v1, v2

    .line 79
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 80
    .line 81
    div-int/2addr v1, v2

    .line 82
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->y:I

    .line 83
    .line 84
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r:I

    .line 89
    .line 90
    mul-int/2addr v1, v2

    .line 91
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 92
    .line 93
    div-int v6, v1, v2

    .line 94
    .line 95
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    div-int/lit8 v1, v1, 0xa

    .line 100
    .line 101
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    .line 102
    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->y:I

    .line 104
    .line 105
    invoke-static {}, Ll/bnl0;->y0()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-le v1, v2, :cond_2

    .line 110
    .line 111
    invoke-static {}, Ll/bnl0;->y0()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_2

    .line 116
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->y:I

    .line 117
    .line 118
    :goto_2
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->x:I

    .line 119
    .line 120
    const/high16 v1, 0x41800000    # 16.0f

    .line 121
    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 127
    .line 128
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->x:I

    .line 133
    .line 134
    if-le v3, v4, :cond_3

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    :goto_3
    add-int/2addr v2, v4

    .line 142
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 143
    .line 144
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 145
    .line 146
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 147
    .line 148
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->x:I

    .line 149
    .line 150
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    new-instance v8, Ll/mp20;

    .line 155
    .line 156
    invoke-direct {v8, p0}, Ll/mp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l(IIIILl/a30;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 163
    .line 164
    const/4 v2, 0x1

    .line 165
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;

    .line 169
    .line 170
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 171
    .line 172
    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;

    .line 174
    .line 175
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 176
    .line 177
    .line 178
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 179
    .line 180
    iget-object v3, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    invoke-direct {v0, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 183
    .line 184
    .line 185
    const/4 v3, 0x0

    .line 186
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 187
    .line 188
    .line 189
    new-instance v3, Ll/np20;

    .line 190
    .line 191
    invoke-direct {v3, p0}, Ll/np20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 192
    .line 193
    .line 194
    invoke-static {v3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->g:Lv/VRecyclerView;

    .line 198
    .line 199
    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 200
    .line 201
    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->g:Lv/VRecyclerView;

    .line 203
    .line 204
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;

    .line 205
    .line 206
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 207
    .line 208
    .line 209
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->g:Lv/VRecyclerView;

    .line 210
    .line 211
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;

    .line 212
    .line 213
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-virtual {v0, v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 224
    .line 225
    .line 226
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 227
    .line 228
    invoke-interface {p0}, Ll/fam;->g()V

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public static bridge synthetic r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->u:I

    return p0
.end method

.method public static bridge synthetic s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->E:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    return p0
.end method

.method public static bridge synthetic v2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/vel0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->I:Ll/vel0;

    return-object p0
.end method

.method public static bridge synthetic w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    return p0
.end method

.method public static bridge synthetic y2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/fam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    return-object p0
.end method


# virtual methods
.method public I2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pp20;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final K2()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e:Landroid/view/TextureView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v0, :cond_2

    .line 14
    .line 15
    if-lez v1, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 28
    .line 29
    iget-object v3, v3, Ll/fe00;->a:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v3, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2}, Ll/ikl0;->a(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z

    .line 34
    .line 35
    .line 36
    iget v3, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 37
    .line 38
    iget v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    new-array v5, v4, [I

    .line 42
    .line 43
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->M:[I

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    aput v3, v5, v6

    .line 47
    .line 48
    const/4 v6, 0x1

    .line 49
    aput v2, v5, v6

    .line 50
    .line 51
    int-to-float v3, v3

    .line 52
    int-to-float v2, v2

    .line 53
    div-float/2addr v3, v2

    .line 54
    int-to-float v2, v0

    .line 55
    int-to-float v5, v1

    .line 56
    div-float v6, v2, v5

    .line 57
    .line 58
    cmpl-float v6, v6, v3

    .line 59
    .line 60
    if-lez v6, :cond_1

    .line 61
    .line 62
    mul-float/2addr v5, v3

    .line 63
    float-to-int v2, v5

    .line 64
    move v3, v1

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    div-float/2addr v2, v3

    .line 67
    float-to-int v2, v2

    .line 68
    move v3, v2

    .line 69
    move v2, v0

    .line 70
    :goto_0
    new-instance v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 71
    .line 72
    invoke-direct {v5, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 73
    .line 74
    .line 75
    sub-int/2addr v0, v2

    .line 76
    div-int/2addr v0, v4

    .line 77
    sub-int/2addr v1, v3

    .line 78
    div-int/2addr v1, v4

    .line 79
    invoke-virtual {v5, v0, v1, v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e:Landroid/view/TextureView;

    .line 83
    .line 84
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 85
    .line 86
    invoke-direct {v0, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_1
    return-void
.end method

.method public final synthetic R2(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->M2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T2()Ll/uxj0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/oki;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->J:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ll/vel0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->I:Ll/vel0;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 31
    .line 32
    iget v1, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/niw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->K:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Ll/ecj;->L(Ljava/lang/String;)Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->L:Ljava/io/File;

    .line 52
    .line 53
    new-instance v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 54
    .line 55
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->H:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->J:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 66
    .line 67
    return-object p0
.end method

.method public W(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 6
    .line 7
    sub-int/2addr v1, p0

    .line 8
    int-to-float p0, v1

    .line 9
    mul-float/2addr p1, p0

    .line 10
    float-to-int p0, p1

    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->setPointIndex(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic Z2(Landroid/util/Pair;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic a3(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->c3()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->f:Lv/VText;

    .line 24
    .line 25
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 26
    .line 27
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 28
    .line 29
    sub-int/2addr p2, p3

    .line 30
    int-to-float p2, p2

    .line 31
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    .line 32
    .line 33
    mul-float/2addr p2, p3

    .line 34
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    .line 35
    .line 36
    int-to-float p3, p3

    .line 37
    div-float/2addr p2, p3

    .line 38
    float-to-long p2, p2

    .line 39
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e3(J)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic b3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/fam;->resume()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final c3()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->g:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->g:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v3, 0x2

    .line 24
    new-array v3, v3, [I

    .line 25
    .line 26
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/view/View;->getLocationInWindow([I)V

    .line 29
    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 35
    .line 36
    invoke-static {}, Ll/bnl0;->y0()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    aget v7, v3, v2

    .line 41
    .line 42
    add-int/2addr v6, v7

    .line 43
    if-ge v5, v6, :cond_0

    .line 44
    .line 45
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 46
    .line 47
    invoke-static {}, Ll/bnl0;->y0()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    sub-int/2addr v5, v6

    .line 52
    invoke-virtual {v0, v2, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    aget v4, v3, v2

    .line 61
    .line 62
    add-int/2addr v4, v0

    .line 63
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 64
    .line 65
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->x:I

    .line 66
    .line 67
    add-int/2addr v5, v4

    .line 68
    invoke-static {}, Ll/bnl0;->y0()I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-le v5, v6, :cond_2

    .line 73
    .line 74
    invoke-static {}, Ll/bnl0;->y0()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->x:I

    .line 80
    .line 81
    add-int/2addr v4, v5

    .line 82
    :goto_1
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->F:Lv/VImage;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->F:Lv/VImage;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 100
    .line 101
    invoke-static {}, Ll/bnl0;->y0()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 106
    .line 107
    sub-int/2addr v4, v5

    .line 108
    if-eq v0, v4, :cond_3

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 113
    .line 114
    .line 115
    :cond_3
    if-nez v1, :cond_5

    .line 116
    .line 117
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 118
    .line 119
    invoke-static {}, Ll/bnl0;->y0()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    aget v4, v3, v2

    .line 124
    .line 125
    add-int/2addr v1, v4

    .line 126
    if-ge v0, v1, :cond_4

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 130
    .line 131
    invoke-static {}, Ll/bnl0;->y0()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    sub-int/2addr v0, v1

    .line 136
    aget v1, v3, v2

    .line 137
    .line 138
    sub-int v2, v0, v1

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    .line 142
    .line 143
    add-int/lit8 v1, v1, -0x1

    .line 144
    .line 145
    mul-int/2addr v0, v1

    .line 146
    aget v1, v3, v2

    .line 147
    .line 148
    sub-int/2addr v0, v1

    .line 149
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 150
    .line 151
    add-int v2, v0, v1

    .line 152
    .line 153
    :goto_2
    int-to-float v0, v2

    .line 154
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    .line 155
    .line 156
    mul-float/2addr v0, v1

    .line 157
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A:I

    .line 158
    .line 159
    int-to-float v3, v2

    .line 160
    div-float/2addr v0, v3

    .line 161
    float-to-long v3, v0

    .line 162
    iput-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o:J

    .line 163
    .line 164
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D:I

    .line 165
    .line 166
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C:I

    .line 167
    .line 168
    sub-int/2addr v0, v5

    .line 169
    int-to-float v0, v0

    .line 170
    mul-float/2addr v0, v1

    .line 171
    int-to-float v1, v2

    .line 172
    div-float/2addr v0, v1

    .line 173
    float-to-long v0, v0

    .line 174
    add-long/2addr v0, v3

    .line 175
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 176
    .line 177
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->f:Lv/VText;

    .line 178
    .line 179
    sub-long/2addr v0, v3

    .line 180
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e3(J)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->d3()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public final d3()V
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 4
    .line 5
    iget-object v1, v1, Ll/fe00;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o:J

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/immomo/moment/mediautils/cmds/VideoCut;-><init>(Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->l:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 17
    .line 18
    iget-object v1, v1, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 19
    .line 20
    filled-new-array {v0}, [Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setVideoCuts([Lcom/immomo/moment/mediautils/cmds/VideoCut;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->l:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 30
    .line 31
    filled-new-array {v0}, [Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const-wide/16 v5, 0x0

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-interface/range {v2 .. v7}, Ll/fam;->c(Ljava/util/List;Ljava/util/List;JZ)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 47
    .line 48
    invoke-interface {v0}, Ll/fam;->p()Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->setPointIndex(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 61
    .line 62
    return-void
.end method

.method public e3(J)Ljava/lang/String;
    .locals 6

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p1, v0

    .line 4
    const-wide/16 v0, 0x3c

    .line 5
    .line 6
    div-long v2, p1, v0

    .line 7
    .line 8
    rem-long/2addr p1, v0

    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-wide/16 v0, 0xa

    .line 15
    .line 16
    cmp-long v4, v2, v0

    .line 17
    .line 18
    const-string v5, "0"

    .line 19
    .line 20
    if-ltz v4, :cond_0

    .line 21
    .line 22
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_0
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, ":"

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    cmp-long v0, p1, v0

    .line 48
    .line 49
    if-ltz v0, :cond_1

    .line 50
    .line 51
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->I2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->e:Landroid/view/TextureView;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/ep20;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ep20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/fp20;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/fp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/gp20;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/gp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->B:Lrx/subjects/a;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/hp20;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/hp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public l0()V
    .locals 0

    .line 1
    return-void
.end method

.method public n(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_album_video_clip"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "media"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "extra_from"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->j:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/asx;->a()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    mul-int/lit16 v0, v0, 0x3e8

    .line 44
    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    const/high16 v1, 0x41700000    # 15.0f

    .line 49
    .line 50
    div-float/2addr v0, v1

    .line 51
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 52
    .line 53
    mul-float/2addr v0, v1

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s:F

    .line 55
    .line 56
    new-instance v0, Ll/fe00;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/fe00;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1}, Ll/oki;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Ll/fe00;->a:Ljava/lang/String;

    .line 72
    .line 73
    new-instance v2, Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 76
    .line 77
    iget-object v3, v0, Ll/fe00;->a:Ljava/lang/String;

    .line 78
    .line 79
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 80
    .line 81
    int-to-long v6, v0

    .line 82
    const-wide/16 v4, 0x0

    .line 83
    .line 84
    invoke-direct/range {v2 .. v7}, Lcom/immomo/moment/mediautils/cmds/VideoCut;-><init>(Ljava/lang/String;JJ)V

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->l:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 88
    .line 89
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 90
    .line 91
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;-><init>()V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->l:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 95
    .line 96
    filled-new-array {v1}, [Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setVideoCuts([Lcom/immomo/moment/mediautils/cmds/VideoCut;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 104
    .line 105
    iput-object v0, v1, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 106
    .line 107
    invoke-static {}, Ll/uc4;->i()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    invoke-static {}, Ll/uc4;->f()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_1

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    invoke-static {}, Ll/be00;->b()Ll/fam;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 125
    .line 126
    invoke-interface {v0, p0}, Ll/fam;->r(Ll/ipw;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 130
    .line 131
    const/4 v1, 0x1

    .line 132
    invoke-interface {v0, v1}, Ll/fam;->d(Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 136
    .line 137
    const/4 v1, 0x0

    .line 138
    invoke-interface {v0, v1}, Ll/fam;->e(Z)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->n:Ll/fam;

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k:Ll/fe00;

    .line 144
    .line 145
    invoke-interface {v0, v2}, Ll/fam;->b(Ll/fe00;)Z

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 152
    .line 153
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q:I

    .line 156
    .line 157
    int-to-float v2, v1

    .line 158
    cmpl-float v2, v0, v2

    .line 159
    .line 160
    if-lez v2, :cond_2

    .line 161
    .line 162
    int-to-long v0, v1

    .line 163
    goto :goto_0

    .line 164
    :cond_2
    float-to-int v0, v0

    .line 165
    int-to-long v0, v0

    .line 166
    :goto_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p:J

    .line 167
    .line 168
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    return-void
.end method
