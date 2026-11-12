.class public final Lm39;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Las2;

.field public final c:Lub2;

.field public final d:Lvu2;

.field public final e:Landroid/service/autofill/FillRequest;

.field public final f:Landroid/os/CancellationSignal;

.field public final g:Landroid/service/autofill/FillCallback;

.field public final h:Lzyk;

.field public final i:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Las2;Lx77;Lub2;Lvu2;Landroid/service/autofill/FillRequest;Landroid/os/CancellationSignal;Landroid/service/autofill/FillCallback;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm39;->a:Landroid/content/Context;

    iput-object p2, p0, Lm39;->b:Las2;

    iput-object p4, p0, Lm39;->c:Lub2;

    iput-object p5, p0, Lm39;->d:Lvu2;

    iput-object p6, p0, Lm39;->e:Landroid/service/autofill/FillRequest;

    iput-object p7, p0, Lm39;->f:Landroid/os/CancellationSignal;

    iput-object p8, p0, Lm39;->g:Landroid/service/autofill/FillCallback;

    new-instance p1, Ll39;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ll39;-><init>(Lm39;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lm39;->h:Lzyk;

    new-instance p1, Ll39;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ll39;-><init>(Lm39;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lm39;->i:Lzyk;

    return-void
.end method

.method public static final d(Lm39;)Landroid/widget/inline/InlinePresentationSpec;
    .registers 4

    iget-object p0, p0, Lm39;->e:Landroid/service/autofill/FillRequest;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-lt v0, v1, :cond_14

    invoke-virtual {p0}, Landroid/service/autofill/FillRequest;->getInlineSuggestionsRequest()Landroid/view/inputmethod/InlineSuggestionsRequest;

    move-result-object p0

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Landroid/view/inputmethod/InlineSuggestionsRequest;->getInlinePresentationSpecs()Ljava/util/List;

    move-result-object p0

    goto :goto_15

    :cond_14
    move-object p0, v2

    :goto_15
    if-eqz p0, :cond_20

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lyt7;->a(Ljava/lang/Object;)Landroid/widget/inline/InlinePresentationSpec;

    move-result-object p0

    return-object p0

    :cond_20
    return-object v2
.end method


# virtual methods
.method public final a(Landroid/service/autofill/FillResponse$Builder;Ld16;)V
    .registers 5

    new-instance v0, Landroid/service/autofill/SaveInfo$Builder;

    iget-object v1, p2, Lk2g;->a:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object p2, p2, Lk2g;->b:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroid/view/autofill/AutofillId;

    invoke-direct {v0, v1, p2}, Landroid/service/autofill/SaveInfo$Builder;-><init>(I[Landroid/view/autofill/AutofillId;)V

    invoke-virtual {p0}, Lm39;->b()Ls45;

    move-result-object p0

    iget-object p0, p0, Ls45;->a:Landroid/os/Bundle;

    if-eqz p0, :cond_2e

    const-string p2, "com.opera.android.autofill.EXTRA_PASSWORD_FIELD_ID"

    const-class v1, Landroid/view/autofill/AutofillId;

    invoke-static {p0, p2, v1}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    check-cast p0, Landroid/view/autofill/AutofillId;

    goto :goto_2f

    :cond_2e
    const/4 p0, 0x0

    :goto_2f
    if-nez p0, :cond_33

    const/4 p0, 0x4

    goto :goto_34

    :cond_33
    const/4 p0, 0x1

    :goto_34
    invoke-virtual {v0, p0}, Landroid/service/autofill/SaveInfo$Builder;->setFlags(I)Landroid/service/autofill/SaveInfo$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/service/autofill/SaveInfo$Builder;->build()Landroid/service/autofill/SaveInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/service/autofill/FillResponse$Builder;->setSaveInfo(Landroid/service/autofill/SaveInfo;)Landroid/service/autofill/FillResponse$Builder;

    return-void
.end method

.method public final b()Ls45;
    .registers 1

    iget-object p0, p0, Lm39;->h:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls45;

    return-object p0
.end method

.method public final c()Landroid/widget/inline/InlinePresentationSpec;
    .registers 1

    iget-object p0, p0, Lm39;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lyt7;->a(Ljava/lang/Object;)Landroid/widget/inline/InlinePresentationSpec;

    move-result-object p0

    return-object p0
.end method
