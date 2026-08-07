.class public Ll/jjs;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final b:Ljava/lang/String;

.field public c:Z

.field public d:I

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public h:[I

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jjs;->d:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/jjs;->j:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    iput-object p2, p0, Ll/jjs;->b:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, p0, Ll/jjs;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p4, p0, Ll/jjs;->g:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jjs;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public d()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->action:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "GivenGiftAndShowComboGearMenu"

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->combosGears:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public e()F
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    cmpg-float v0, p0, v0

    .line 7
    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    :cond_0
    return p0
.end method

.method public f()J
    .locals 4

    .line 1
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 4
    .line 5
    const-wide/16 v2, 0xbb8

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->h:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/jjs;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hasEffectRes()Z

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
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jjs;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jjs;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jjs;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(Ll/jjs;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 12
    .line 13
    if-ne p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public s()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public t(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jjs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-interface {v0, v1, p0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jjs;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jjs;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jjs;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public y([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jjs;->h:[I

    .line 2
    .line 3
    return-void
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jjs;->d:I

    .line 2
    .line 3
    return-void
.end method
