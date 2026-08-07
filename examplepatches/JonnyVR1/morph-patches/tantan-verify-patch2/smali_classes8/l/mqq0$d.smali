.class public final Ll/mqq0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VSlider$b;


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
        "l/mqq0$d",
        "Lv/VSlider$b;",
        "Lv/VSlider;",
        "slider",
        "",
        "c",
        "(Lv/VSlider;)V",
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
    iput-object p1, p0, Ll/mqq0$d;->a:Ll/mqq0;

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
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mqq0$d;->c(Lv/VSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mqq0$d;->d(Lv/VSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public d(Lv/VSlider;)V
    .locals 1

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
    iget-object p0, p0, Ll/mqq0$d;->a:Ll/mqq0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const-string p0, "editData"

    .line 19
    .line 20
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "suggest_see_user_search_radius"

    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {p0}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "e_advanced_filter_distance"

    .line 41
    .line 42
    invoke-static {v0, p1, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
