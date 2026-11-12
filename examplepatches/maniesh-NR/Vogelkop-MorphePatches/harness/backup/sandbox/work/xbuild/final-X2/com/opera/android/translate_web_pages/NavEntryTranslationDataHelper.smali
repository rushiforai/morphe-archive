.class public final Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpje;

.field public final b:Lpje;

.field public final c:Lpje;

.field public final d:Lk6l;

.field public e:Lkze;

.field public f:Lvz5;

.field public g:Lj5m;

.field public h:Z


# direct methods
.method public constructor <init>(Lk6l;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpje;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpje;-><init>(Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;B)V

    iput-object v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a:Lpje;

    new-instance v0, Lpje;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lpje;-><init>(Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;B)V

    iput-object v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->b:Lpje;

    new-instance v0, Lpje;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lpje;-><init>(Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;B)V

    iput-object v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c:Lpje;

    iput-object p1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->d:Lk6l;

    return-void
.end method

.method public static createTranslationData(ILjava/lang/String;)Lcom/opera/android/translate_web_pages/TranslationData;
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/translate_web_pages/TranslationData;

    invoke-direct {v0, p0, p1}, Lcom/opera/android/translate_web_pages/TranslationData;-><init>(ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final a()Lorg/chromium/content_public/browser/WebContents;
    .registers 2

    iget-object p0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->d:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_11

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_12

    :cond_11
    move-object p0, v0

    :goto_12
    if-nez p0, :cond_15

    return-object v0

    :cond_15
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    return-object p0
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->h:Z

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-nez v0, :cond_b

    :cond_a
    return-void

    :cond_b
    iget-object v1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->g:Lj5m;

    const/4 v2, 0x1

    if-eqz v1, :cond_1f

    iget-object v1, v1, Lj5m;->d:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld5m;

    invoke-virtual {v1}, Ld5m;->b()Z

    move-result v1

    if-eqz v1, :cond_1f

    const/4 v2, 0x2

    :cond_1f
    iget-object p0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->e:Lkze;

    if-nez p0, :cond_26

    const-string p0, ""

    goto :goto_2c

    :cond_26
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_2c
    invoke-static {v0, v2, p0}, LJ/N;->M0t0GVr5(Ljava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method public final c(Lvz5;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->f:Lvz5;

    iget-object v1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a:Lpje;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lvz5;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    :cond_d
    iget-boolean v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->h:Z

    if-eqz v0, :cond_14

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->h:Z

    :cond_14
    iput-object p1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->f:Lvz5;

    if-eqz p1, :cond_1f

    iget-object p0, p1, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0, v1}, Lekc;->k(Lf7f;)V

    :cond_1f
    return-void
.end method
