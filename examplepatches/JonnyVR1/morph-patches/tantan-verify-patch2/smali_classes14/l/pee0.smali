.class public Ll/pee0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/pee0;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pee0;->m(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic l(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pee0;->n(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method private synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v1, p0, Ll/pee0;->a:I

    .line 13
    .line 14
    new-instance v2, Ll/nee0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/nee0;-><init>(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ll/oee0;

    .line 20
    .line 21
    invoke-direct {v3, p0, p1}, Ll/oee0;-><init>(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0, v1, v2, v3}, Ll/pn0;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;ILl/x20;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "sdkRes"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "cancel"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/lbl0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
