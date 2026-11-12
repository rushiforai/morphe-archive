.class public final synthetic Lpje;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;B)V
    .registers 3

    iput-byte p2, p0, Lpje;->a:B

    iput-object p1, p0, Lpje;->b:Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lpje;->a:B

    iget-object p0, p0, Lpje;->b:Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    packed-switch v0, :pswitch_data_2a

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->b()V

    return-void

    :pswitch_d
    check-cast p1, Ld5m;

    invoke-virtual {p0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->b()V

    return-void

    :pswitch_13
    check-cast p1, Lj5m;

    iget-object v0, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->b:Lpje;

    iget-object v1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->g:Lj5m;

    if-eqz v1, :cond_20

    iget-object v1, v1, Lj5m;->d:Lkze;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    :cond_20
    iput-object p1, p0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->g:Lj5m;

    if-eqz p1, :cond_29

    iget-object p0, p1, Lj5m;->d:Lkze;

    invoke-virtual {p0, v0}, Lekc;->k(Lf7f;)V

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
