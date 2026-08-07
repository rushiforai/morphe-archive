.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ZI)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/eyu;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/eyu;->V()Landroid/util/Pair;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/eyu;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/eyu;->P()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p2, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p1, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-static {p0, v0, v1, p1}, Ll/iyu;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;JZ)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lt p1, v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/eyu;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/eyu;->P()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/iyu;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/eyu;

    .line 52
    .line 53
    invoke-static {}, Ll/rg80;->a()Ll/rg80;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    rem-int/lit8 p1, p1, 0x2

    .line 58
    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    const/4 p1, 0x1

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const/4 p1, 0x0

    .line 64
    :goto_0
    invoke-virtual {v0, p1}, Ll/rg80;->b(Z)Ll/qwl;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/eyu;->W(Ll/qwl;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-le v0, p1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->w3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ll/iam;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ll/eyu;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->t3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {p1, p0}, Ll/eyu;->X(Z)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method
