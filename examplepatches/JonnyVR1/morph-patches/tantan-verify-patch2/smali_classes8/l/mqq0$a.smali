.class public final Ll/mqq0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cp50;


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
        "\u0000#\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ/\u0010\r\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "l/mqq0$a",
        "",
        "Lv/VRangeSlider;",
        "slider",
        "",
        "fromUser",
        "",
        "value",
        "",
        "c",
        "(Lv/VRangeSlider;ZF)V",
        "minValue",
        "maxValue",
        "d",
        "(Lv/VRangeSlider;ZFF)V",
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
    iput-object p1, p0, Ll/mqq0$a;->a:Ll/mqq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/mqq0$a;->c(Lv/VRangeSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;ZFF)V
    .locals 0

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mqq0$a;->d(Lv/VRangeSlider;ZFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VRangeSlider;ZF)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public d(Lv/VRangeSlider;ZFF)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/mqq0$a;->a:Ll/mqq0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 p2, 0x0

    .line 11
    const-string v0, "editData"

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object p1, p2

    .line 19
    :cond_0
    float-to-int p3, p3

    .line 20
    iput p3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 21
    .line 22
    iget-object p1, p0, Ll/mqq0$a;->a:Ll/mqq0;

    .line 23
    .line 24
    invoke-static {p1}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    move-object p1, p2

    .line 34
    :cond_1
    float-to-int p3, p4

    .line 35
    iput p3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 36
    .line 37
    iget-object p1, p0, Ll/mqq0$a;->a:Ll/mqq0;

    .line 38
    .line 39
    invoke-static {p1}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    if-nez p3, :cond_2

    .line 44
    .line 45
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move-object p3, p2

    .line 49
    :cond_2
    iget p3, p3, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 50
    .line 51
    iget-object p0, p0, Ll/mqq0$a;->a:Ll/mqq0;

    .line 52
    .line 53
    invoke-static {p0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-nez p0, :cond_3

    .line 58
    .line 59
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move-object p2, p0

    .line 64
    :goto_0
    iget p0, p2, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 65
    .line 66
    invoke-virtual {p1, p3, p0}, Ll/mqq0;->F(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
