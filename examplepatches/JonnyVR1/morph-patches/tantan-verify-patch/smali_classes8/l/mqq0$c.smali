.class public final Ll/mqq0$c;
.super Lv/VSlider$a;
.source "SourceFile"


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
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "l/mqq0$c",
        "Lv/VSlider$a;",
        "Lv/VSlider;",
        "slider",
        "",
        "fromUser",
        "",
        "value",
        "",
        "c",
        "(Lv/VSlider;ZF)V",
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
    iput-object p1, p0, Ll/mqq0$c;->a:Ll/mqq0;

    .line 2
    .line 3
    invoke-direct {p0}, Lv/VSlider$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/mqq0$c;->c(Lv/VSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;ZF)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mqq0$c;->a:Ll/mqq0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "editData"

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v0, v1

    .line 19
    :cond_0
    sget-object v3, Ll/eqq0;->Companion:Ll/eqq0$a;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/eqq0$a;->e()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    int-to-float v3, v3

    .line 26
    cmpg-float v3, p3, v3

    .line 27
    .line 28
    if-gtz v3, :cond_1

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v3, 0x0

    .line 33
    :goto_0
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 34
    .line 35
    iget-object v0, p0, Ll/mqq0$c;->a:Ll/mqq0;

    .line 36
    .line 37
    invoke-static {v0}, Ll/mqq0;->i(Ll/mqq0;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object v1, v0

    .line 48
    :goto_1
    float-to-int v0, p3

    .line 49
    iput v0, v1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 50
    .line 51
    iget-object v0, p0, Ll/mqq0$c;->a:Ll/mqq0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/mqq0;->k()Ll/y20;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-super {p0, p1, p2, p3}, Lv/VSlider$a;->c(Lv/VSlider;ZF)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
