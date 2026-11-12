.class public final Lcom/opera/android/browser/autofill/AutofillPopupView;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final c:Lqu2;

.field public final d:Lpu2;

.field public e:Ljava/util/ArrayList;

.field public f:I


# direct methods
.method public constructor <init>(JLcom/opera/android/browser/chromium/ChromiumContent;Lqu2;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpu2;

    invoke-direct {v0, p0}, Lpu2;-><init>(Lcom/opera/android/browser/autofill/AutofillPopupView;)V

    iput-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->d:Lpu2;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->e:Ljava/util/ArrayList;

    iput-wide p1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->a:J

    iput-object p3, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p4, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;IZII)Lcom/opera/android/browser/autofill/AutofillPopupView;
    .registers 8
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-boolean v0, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance v0, Liz9;

    invoke-direct {v0, p5, p6}, Liz9;-><init>(II)V

    if-eqz p4, :cond_1d

    const/4 p4, 0x5

    if-eq p3, p4, :cond_13

    const/4 p4, 0x3

    if-ne p3, p4, :cond_1d

    :cond_13
    new-instance p4, Lrq2;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p5

    invoke-direct {p4, p2, p5, p3, v0}, Lrq2;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Ldx3;ILiz9;)V

    goto :goto_22

    :cond_1d
    new-instance p4, Lts2;

    invoke-direct {p4, p2, p3, v0}, Lts2;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;ILiz9;)V

    :goto_22
    new-instance p3, Lcom/opera/android/browser/autofill/AutofillPopupView;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/opera/android/browser/autofill/AutofillPopupView;-><init>(JLcom/opera/android/browser/chromium/ChromiumContent;Lqu2;)V

    return-object p3
.end method


# virtual methods
.method public final continueUpdate(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V
    .registers 16
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->e:Ljava/util/ArrayList;

    new-instance v1, Lru2;

    iget v2, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->f:I

    move-object v4, p1

    move-object v6, p2

    move v5, p3

    move v7, p4

    move v3, p5

    move-object v8, p6

    invoke-direct/range {v1 .. v8}, Lru2;-><init>(IZLjava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->f:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->f:I

    return-void
.end method

.method public final finishUpdate()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    iget-object p0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->e:Ljava/util/ArrayList;

    invoke-interface {v0, p0}, Lqu2;->w(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final isShowingBottomSheet()Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    instance-of v0, p0, Lrq2;

    if-eqz v0, :cond_f

    check-cast p0, Lrq2;

    iget-object p0, p0, Lrq2;->h:Lnq2;

    if-eqz p0, :cond_f

    iget-boolean p0, p0, Lnq2;->f:Z

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final onNativeDestroyed()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->a:J

    iget-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->d:Lpu2;

    iget-object p0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    invoke-interface {p0, v0}, Lw6f;->H(Ljava/lang/Object;)V

    invoke-interface {p0}, Lqu2;->d()V

    return-void
.end method

.method public final show()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->d:Lpu2;

    iget-object v1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    invoke-interface {v1, v0}, Lw6f;->F(Ljava/lang/Object;)V

    invoke-interface {v1}, Lqu2;->show()V

    const/4 v0, 0x1

    iget-object p0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->S:Z

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_15
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0}, Liz4;->h()V

    goto :goto_15

    :cond_25
    return-void
.end method

.method public final startUpdate(IIIII)V
    .registers 6

    const/4 p1, 0x0

    iput p1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->f:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->e:Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/opera/android/browser/autofill/AutofillPopupView;->c:Lqu2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
