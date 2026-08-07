.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag;
.super Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0018\u0000 \u000e2\u00020\u0001:\u0001\u000fB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0015\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0003J\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u0003\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag;",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;",
        "<init>",
        "()V",
        "Landroid/os/Bundle;",
        "sis",
        "",
        "g4",
        "(Landroid/os/Bundle;)V",
        "a5",
        "",
        "b5",
        "()Z",
        "onDestroyView",
        "Companion",
        "a",
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


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag;->Companion:Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string v0, "search_voice"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;->X1(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public b5()Z
    .locals 3

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 v1, 0x1

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->V4()Lv/VText;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->V4()Lv/VText;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const v0, 0x3ecccccd    # 0.4f

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    :cond_3
    return v1
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->U4()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Ll/ebc0;->u0:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->S4()Lv/VText;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget v0, Ll/ebc0;->t0:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/end/VoiceBuzzCallEndFrag;->b5()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/nbw;->L()Ll/l4g0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    const-string p0, "true"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p0, "false"

    .line 38
    .line 39
    :goto_0
    const-string v1, "buzz_continue"

    .line 40
    .line 41
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/nbw;->L()Ll/l4g0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onDestroyView()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzCallEndFrag;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nbw;->L()Ll/l4g0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
