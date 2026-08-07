.class public final Ll/mqq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VRangeSlider$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mqq0;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "l/mqq0$b",
        "Lv/VRangeSlider$a;",
        "Lv/VRangeSlider;",
        "slider",
        "",
        "c",
        "(Lv/VRangeSlider;)V",
        "d",
        "member_intlGmsRelease"
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
.field public final synthetic a:Ll/mqq0;


# direct methods
.method public constructor <init>(Ll/mqq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mqq0$b;->a:Ll/mqq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mqq0$b;->c(Lv/VRangeSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mqq0$b;->d(Lv/VRangeSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VRangeSlider;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public d(Lv/VRangeSlider;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/eqq0;->Companion:Ll/eqq0$a;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/eqq0$a;->b()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/mqq0$b;->a:Ll/mqq0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    const-string v2, "editData"

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    move-object v0, v1

    .line 25
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v3, "suggest_see_user_search_max_age"

    .line 32
    .line 33
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/mqq0$b;->a:Ll/mqq0;

    .line 38
    .line 39
    invoke-static {p0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-object v1, p0

    .line 50
    :goto_0
    iget p0, v1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v1, "suggest_see_user_search_min_age"

    .line 57
    .line 58
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "e_advanced_filter_age"

    .line 67
    .line 68
    invoke-static {v0, p1, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
