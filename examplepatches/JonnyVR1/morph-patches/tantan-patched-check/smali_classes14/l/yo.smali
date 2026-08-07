.class public Ll/yo;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ll/ewi;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:Ll/uyh0;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;

.field public g:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Ll/ewi;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILl/uyh0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/yo;->g:Ll/vg60;

    .line 9
    .line 10
    iput p1, p0, Ll/yo;->c:I

    .line 11
    .line 12
    iput-object p2, p0, Ll/yo;->d:Ll/uyh0;

    .line 13
    .line 14
    iput-object p3, p0, Ll/yo;->e:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-object p4, p0, Ll/yo;->f:Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic p(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/yo;->c:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yo;->g:Ll/vg60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/yo;->g:Ll/vg60;

    .line 16
    .line 17
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v0, 0x3

    .line 24
    sub-int/2addr p0, v0

    .line 25
    if-ge p1, p0, :cond_0

    .line 26
    .line 27
    if-le p1, v0, :cond_0

    .line 28
    .line 29
    sget-object p0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->v(Z)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/wo;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/wo;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/xo;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/xo;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 2

    .line 1
    iget v0, p0, Ll/yo;->c:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/yo;->g:Ll/vg60;

    .line 6
    .line 7
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Ll/yo;->c:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/yo;->g:Ll/vg60;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_1
    iget-object p0, p0, Ll/yo;->g:Ll/vg60;

    .line 21
    .line 22
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 23
    .line 24
    add-int/lit8 p1, p1, -0x1

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/ewi;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yo;->t(Landroid/view/View;Ll/ewi;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yo;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/hec0;->I:I

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

.method public t(Landroid/view/View;Ll/ewi;II)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountFolderItemView;

    .line 3
    .line 4
    iget p1, p0, Ll/yo;->c:I

    .line 5
    .line 6
    sget p3, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 7
    .line 8
    if-ne p1, p3, :cond_0

    .line 9
    .line 10
    iget v3, p2, Ll/ewi;->d:I

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    iget-object v5, p0, Ll/yo;->f:Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move-object v1, p2

    .line 17
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountFolderItemView;->c(Ll/ewi;ZILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    move-object v1, p2

    .line 22
    const/4 p1, 0x0

    .line 23
    if-nez p4, :cond_1

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    move v2, p2

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v2, p1

    .line 29
    :goto_0
    iget-object p2, p0, Ll/yo;->d:Ll/uyh0;

    .line 30
    .line 31
    iget-object p2, p2, Ll/uyh0;->a:Ll/vg60;

    .line 32
    .line 33
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget-object p2, p0, Ll/yo;->d:Ll/uyh0;

    .line 40
    .line 41
    iget-object p2, p2, Ll/uyh0;->a:Ll/vg60;

    .line 42
    .line 43
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-lez p2, :cond_2

    .line 50
    .line 51
    iget-object p2, p0, Ll/yo;->d:Ll/uyh0;

    .line 52
    .line 53
    iget-object p2, p2, Ll/uyh0;->a:Ll/vg60;

    .line 54
    .line 55
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 62
    .line 63
    :goto_1
    move-object v4, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    const/4 p1, 0x0

    .line 66
    goto :goto_1

    .line 67
    :goto_2
    iget-object v5, p0, Ll/yo;->f:Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;

    .line 68
    .line 69
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountFolderItemView;->c(Ll/ewi;ZILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public w(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/yo;->g:Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
