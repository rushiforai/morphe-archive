.class public Ll/syw;
.super Ll/gzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gzw<",
        "Ll/uyw;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/VerificationCenter;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gzw;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Ll/syw;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/syw;->k0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method


# virtual methods
.method public g0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Ll/cq6;

    .line 10
    .line 11
    invoke-direct {p2}, Ll/cq6;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/ryw;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/ryw;-><init>(Ll/syw;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/syw;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 6
    .line 7
    const-string v1, "pending"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v0, "verified"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->b2()Ll/b2x;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Ll/b2x;->k:Lv/VButton;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 40
    .line 41
    .line 42
    return-void
.end method
