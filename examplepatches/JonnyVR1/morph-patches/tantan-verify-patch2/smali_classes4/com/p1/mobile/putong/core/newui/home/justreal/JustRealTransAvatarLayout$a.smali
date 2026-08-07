.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:J

.field public i:J

.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->c:I

    .line 6
    .line 7
    const v1, 0x3edddd6e    # 0.43333f

    .line 8
    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->j:F

    .line 11
    .line 12
    new-instance v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 18
    .line 19
    new-instance v1, Ll/xlj;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v1, p1}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 29
    .line 30
    invoke-direct {p1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 31
    .line 32
    .line 33
    const/high16 v2, 0x41600000    # 14.0f

    .line 34
    .line 35
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    int-to-float v2, v2

    .line 40
    invoke-virtual {p1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 41
    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-virtual {p1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/xlj;->a()Ll/wlj;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, v0}, Ll/wlj;->y(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->c:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->c:I

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d(IIIIJJ)V
    .locals 0

    .line 1
    iput-wide p5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->h:J

    .line 2
    .line 3
    iput-wide p7, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->i:J

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->d:I

    .line 6
    .line 7
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->f:I

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->e:I

    .line 10
    .line 11
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->g:I

    .line 12
    .line 13
    return-void
.end method
