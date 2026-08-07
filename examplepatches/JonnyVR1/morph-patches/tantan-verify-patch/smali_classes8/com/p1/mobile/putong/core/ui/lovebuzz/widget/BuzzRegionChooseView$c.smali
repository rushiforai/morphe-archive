.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView;->c(Lcom/p1/mobile/android/app/Act;Ll/nqy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0019\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$a;",
        "Ll/gq3;",
        "item",
        "",
        "a",
        "(Ll/gq3;)Z",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/nqy;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Ll/nqy;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;->a:Ll/nqy;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gq3;)Z
    .locals 4

    .line 1
    sget-object v0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nbw;->n0()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/gq3;->a()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, -0x1

    .line 16
    if-ne v1, v3, :cond_1

    .line 17
    .line 18
    return v2

    .line 19
    :cond_1
    invoke-virtual {p1}, Ll/gq3;->a()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eq p1, v3, :cond_3

    .line 24
    .line 25
    invoke-static {}, Ll/c69;->d()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    invoke-static {}, Ll/joa;->f4()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;->a:Ll/nqy;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/nqy;->d()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;->a:Ll/nqy;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/nqy;->b()V

    .line 50
    .line 51
    .line 52
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzRegionChooseView$c;->b:Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->loveBuzz:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    const-string v3, "p_buzz_area_screening_popup,e_buzz_region_choose,click"

    .line 64
    .line 65
    invoke-interface {p1, p0, v3, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    return v0

    .line 69
    :cond_3
    return v2
.end method
