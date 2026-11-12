.class public final Labn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhh4;
.implements Landroid/speech/RecognitionListener;


# instance fields
.field public final a:Lkotlin/jvm/functions/Function1;

.field public b:Z

.field public c:Z

.field public final d:Lkze;

.field public final e:Lode;

.field public final f:Lode;

.field public final g:Landroid/speech/SpeechRecognizer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Labn;->a:Lkotlin/jvm/functions/Function1;

    new-instance p2, Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Labn;->d:Lkze;

    new-instance p2, Lode;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Labn;->e:Lode;

    new-instance p2, Lode;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Labn;->f:Lode;

    invoke-static {p1}, Landroid/speech/SpeechRecognizer;->createSpeechRecognizer(Landroid/content/Context;)Landroid/speech/SpeechRecognizer;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    iput-object p1, p0, Labn;->g:Landroid/speech/SpeechRecognizer;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Labn;->c:Z

    iget-object p0, p0, Labn;->g:Landroid/speech/SpeechRecognizer;

    invoke-virtual {p0}, Landroid/speech/SpeechRecognizer;->destroy()V

    return-void
.end method

.method public final b(Lhbn;)V
    .registers 3

    iget-boolean v0, p0, Labn;->b:Z

    if-nez v0, :cond_d

    iget-boolean v0, p0, Labn;->c:Z

    if-nez v0, :cond_d

    iget-object p0, p0, Labn;->a:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    return-void
.end method

.method public final cancel()V
    .registers 2

    iget-boolean v0, p0, Labn;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Labn;->g:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->cancel()V

    sget-object v0, Lcbn;->a:Lcbn;

    invoke-virtual {p0, v0}, Labn;->b(Lhbn;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Labn;->b:Z

    invoke-virtual {p0}, Labn;->a()V

    return-void
.end method

.method public final onBeginningOfSpeech()V
    .registers 2

    iget-object p0, p0, Labn;->d:Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onBufferReceived([B)V
    .registers 2

    return-void
.end method

.method public final onEndOfSegmentedSession()V
    .registers 1

    return-void
.end method

.method public final onEndOfSpeech()V
    .registers 2

    iget-object p0, p0, Labn;->d:Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onError(I)V
    .registers 3

    new-instance v0, Lfbn;

    packed-switch p1, :pswitch_data_24

    :pswitch_5
    sget-object p1, Lzan;->g:Lzan;

    goto :goto_19

    :pswitch_8
    sget-object p1, Lzan;->e:Lzan;

    goto :goto_19

    :pswitch_b
    sget-object p1, Lzan;->c:Lzan;

    goto :goto_19

    :pswitch_e
    sget-object p1, Lzan;->d:Lzan;

    goto :goto_19

    :pswitch_11
    sget-object p1, Lzan;->a:Lzan;

    goto :goto_19

    :pswitch_14
    sget-object p1, Lzan;->f:Lzan;

    goto :goto_19

    :pswitch_17
    sget-object p1, Lzan;->e:Lzan;

    :goto_19
    invoke-direct {v0, p1}, Lfbn;-><init>(Lzan;)V

    invoke-virtual {p0, v0}, Labn;->b(Lhbn;)V

    invoke-virtual {p0}, Labn;->a()V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_17
        :pswitch_17
        :pswitch_5
        :pswitch_14
        :pswitch_5
        :pswitch_11
        :pswitch_11
        :pswitch_5
        :pswitch_e
        :pswitch_5
        :pswitch_14
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final onEvent(ILandroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onLanguageDetection(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public final onPartialResults(Landroid/os/Bundle;)V
    .registers 3

    const-string v0, "results_recognition"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    if-nez p1, :cond_14

    const-string p1, ""

    :cond_14
    iget-object p0, p0, Labn;->f:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onReadyForSpeech(Landroid/os/Bundle;)V
    .registers 5

    new-instance p1, Lbbn;

    iget-object v0, p0, Labn;->e:Lode;

    iget-object v1, p0, Labn;->f:Lode;

    iget-object v2, p0, Labn;->d:Lkze;

    invoke-direct {p1, v2, v0, v1}, Lbbn;-><init>(Lkze;Lode;Lode;)V

    invoke-virtual {p0, p1}, Labn;->b(Lhbn;)V

    return-void
.end method

.method public final onResults(Landroid/os/Bundle;)V
    .registers 3

    const-string v0, "results_recognition"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    if-nez p1, :cond_14

    const-string p1, ""

    :cond_14
    iget-object v0, p0, Labn;->f:Lode;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v0, Lebn;

    invoke-direct {v0, p1}, Lebn;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Labn;->b(Lhbn;)V

    invoke-virtual {p0}, Labn;->a()V

    return-void
.end method

.method public final onRmsChanged(F)V
    .registers 2

    iget-object p0, p0, Labn;->e:Lode;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onSegmentResults(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method
