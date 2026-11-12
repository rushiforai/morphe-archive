.class public final Lyg;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lk6l;Lnw3;Lnw3;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lyg;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Luu1;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Luu1;-><init>(B)V

    new-instance v2, Lj4c;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lj4c;-><init>(Lesk;B)V

    iput-object v2, p0, Lyg;->c:Ljava/lang/Object;

    iput-object p2, p0, Lyg;->d:Ljava/lang/Object;

    iput-object p3, p0, Lyg;->e:Ljava/lang/Object;

    iput-boolean v0, p0, Lyg;->b:Z

    invoke-virtual {p1, p0}, Lk6l;->b(La2l;)V

    return-void
.end method

.method public constructor <init>(Lv3m;Lk6l;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lyg;->a:B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 32
    iput-boolean v0, p0, Lyg;->b:Z

    .line 33
    iput-object p1, p0, Lyg;->c:Ljava/lang/Object;

    .line 34
    new-instance p1, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    invoke-direct {p1, p2}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;-><init>(Lk6l;)V

    iput-object p1, p0, Lyg;->d:Ljava/lang/Object;

    .line 35
    invoke-virtual {p2, p0}, Lk6l;->a(La2l;)Lf6l;

    return-void
.end method

.method public static W(Lb2l;Z)V
    .registers 3

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->U()Lvz5;

    move-result-object p0

    if-eqz p0, :cond_15

    iget-boolean v0, p0, Lvz5;->c:Z

    if-eq v0, p1, :cond_15

    iput-boolean p1, p0, Lvz5;->c:Z

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lvz5;->b()V

    :cond_15
    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-byte v0, p0, Lyg;->a:B

    packed-switch v0, :pswitch_data_6a

    return-void

    :pswitch_6
    iget-object v0, p0, Lyg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    iget-boolean v1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v1, :cond_68

    const/4 v1, 0x0

    iput-boolean v1, p0, Lyg;->b:Z

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-nez p2, :cond_1a

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lyg;->W(Lb2l;Z)V

    goto :goto_68

    :cond_1a
    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->U()Lvz5;

    move-result-object v3

    if-eqz v3, :cond_68

    invoke-virtual {v0, v3}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c(Lvz5;)V

    iget-object p2, v3, Lvz5;->f:Ljava/lang/Object;

    check-cast p2, Lkze;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj5m;

    iget-object v2, v1, Lj5m;->j:Ljava/lang/Runnable;

    if-eqz v2, :cond_3c

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    const/4 v2, 0x0

    iput-object v2, v1, Lj5m;->j:Ljava/lang/Runnable;

    :cond_3c
    iget-object v1, v3, Lvz5;->d:Ljava/lang/Object;

    check-cast v1, Li5m;

    invoke-virtual {p2, v1}, Lekc;->r(Ljava/lang/Object;)V

    const/4 p2, -0x1

    iput p2, v3, Lvz5;->b:I

    iget-object p0, p0, Lyg;->e:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Lr4m;

    if-eqz v2, :cond_68

    invoke-virtual {v0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-nez p0, :cond_57

    sget-object p0, Lcom/opera/android/translate_web_pages/TranslationData;->c:Lcom/opera/android/translate_web_pages/TranslationData;

    :goto_55
    move-object v5, p0

    goto :goto_5e

    :cond_57
    invoke-static {p0}, LJ/N;->MrRsXZ81(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/translate_web_pages/TranslationData;

    goto :goto_55

    :goto_5e
    new-instance v1, Lp4m;

    const/4 v6, 0x0

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lp4m;-><init>(Lr4m;Lvz5;Lb2l;Lcom/opera/android/translate_web_pages/TranslationData;B)V

    invoke-virtual {v2, v1}, Lr4m;->c0(Ljava/lang/Runnable;)V

    :cond_68
    :goto_68
    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final G(Lb2l;)V
    .registers 9

    iget-byte v0, p0, Lyg;->a:B

    packed-switch v0, :pswitch_data_3a

    return-void

    :pswitch_6
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->U()Lvz5;

    move-result-object v3

    iget-object v0, p0, Lyg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    invoke-virtual {v0, v3}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c(Lvz5;)V

    iget-object p0, p0, Lyg;->e:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Lr4m;

    if-eqz v2, :cond_38

    invoke-virtual {v0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-nez p0, :cond_27

    sget-object p0, Lcom/opera/android/translate_web_pages/TranslationData;->c:Lcom/opera/android/translate_web_pages/TranslationData;

    :goto_25
    move-object v5, p0

    goto :goto_2e

    :cond_27
    invoke-static {p0}, LJ/N;->MrRsXZ81(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/translate_web_pages/TranslationData;

    goto :goto_25

    :goto_2e
    new-instance v1, Lp4m;

    const/4 v6, 0x1

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lp4m;-><init>(Lr4m;Lvz5;Lb2l;Lcom/opera/android/translate_web_pages/TranslationData;B)V

    invoke-virtual {v2, v1}, Lr4m;->c0(Ljava/lang/Runnable;)V

    :cond_38
    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 5

    iget-byte v0, p0, Lyg;->a:B

    packed-switch v0, :pswitch_data_40

    return-void

    :pswitch_6
    iget-object v0, p0, Lyg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p2, :cond_3e

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->U()Lvz5;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c(Lvz5;)V

    iget-object p2, p0, Lyg;->c:Ljava/lang/Object;

    check-cast p2, Lv3m;

    invoke-static {p2, p1}, Ltjm;->I0(Lv3m;Lb2l;)Z

    move-result p2

    if-eqz p2, :cond_37

    invoke-virtual {v0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    if-eqz p2, :cond_37

    invoke-static {p2}, LJ/N;->MrRsXZ81(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/translate_web_pages/TranslationData;

    iget v1, v0, Lcom/opera/android/translate_web_pages/TranslationData;->a:I

    iget-object v0, v0, Lcom/opera/android/translate_web_pages/TranslationData;->b:Ljava/lang/String;

    invoke-static {p2, v1, v0}, LJ/N;->MlKxOGph(Ljava/lang/Object;ILjava/lang/Object;)V

    :cond_37
    const/4 p2, 0x0

    invoke-static {p1, p2}, Lyg;->W(Lb2l;Z)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lyg;->b:Z

    :cond_3e
    return-void

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final S(Ld7l;)V
    .registers 9

    iget-byte v0, p0, Lyg;->a:B

    packed-switch v0, :pswitch_data_32

    return-void

    :pswitch_6
    iget-object v0, p0, Lyg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c(Lvz5;)V

    iget-object p0, p0, Lyg;->e:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Lr4m;

    if-eqz v2, :cond_30

    invoke-virtual {v0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->a()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-nez p0, :cond_1f

    sget-object p0, Lcom/opera/android/translate_web_pages/TranslationData;->c:Lcom/opera/android/translate_web_pages/TranslationData;

    :goto_1d
    move-object v5, p0

    goto :goto_26

    :cond_1f
    invoke-static {p0}, LJ/N;->MrRsXZ81(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/translate_web_pages/TranslationData;

    goto :goto_1d

    :goto_26
    new-instance v1, Lp4m;

    const/4 v6, 0x1

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lp4m;-><init>(Lr4m;Lvz5;Lb2l;Lcom/opera/android/translate_web_pages/TranslationData;B)V

    invoke-virtual {v2, v1}, Lr4m;->c0(Ljava/lang/Runnable;)V

    :cond_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final b(Lb2l;Lyqa;)V
    .registers 3

    iget-byte p2, p0, Lyg;->a:B

    packed-switch p2, :pswitch_data_10

    return-void

    :pswitch_6
    iget-boolean p0, p0, Lyg;->b:Z

    if-nez p0, :cond_e

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lyg;->W(Lb2l;Z)V

    :cond_e
    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lb2l;)V
    .registers 11

    iget-byte v0, p0, Lyg;->a:B

    packed-switch v0, :pswitch_data_11c

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->r()Z

    move-result v0

    if-nez v0, :cond_11b

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c0()Z

    move-result v0

    if-nez v0, :cond_11b

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_11b

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_11b

    add-int/lit8 v6, v4, -0x1

    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v3

    const/4 v6, 0x1

    add-int/2addr v3, v6

    sub-int v7, v4, v3

    const/4 v8, 0x7

    if-ne v7, v8, :cond_11b

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, "booking"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11b

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    const/4 v2, 0x0

    if-eqz p1, :cond_59

    move p1, v2

    goto :goto_75

    :cond_59
    iget-object p1, p0, Lyg;->d:Ljava/lang/Object;

    check-cast p1, Lnw3;

    iget-object p1, p1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p1

    iget-object v3, p1, Lydn;->d:Lvdn;

    iget-boolean v4, v3, Lvdn;->a:Z

    if-eqz v4, :cond_6f

    invoke-virtual {v3}, Lvdn;->a()Z

    move-result v3

    if-nez v3, :cond_71

    :cond_6f
    move p1, v6

    goto :goto_75

    :cond_71
    invoke-virtual {p1, v0}, Lydn;->t(Ljava/lang/String;)Z

    move-result p1

    :goto_75
    if-eqz p1, :cond_11b

    iget-object p1, p0, Lyg;->c:Ljava/lang/Object;

    check-cast p1, Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/regex/Pattern;

    invoke-virtual {p1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_92

    iget-boolean v0, p0, Lyg;->b:Z

    if-eqz v0, :cond_92

    invoke-static {}, LJ/N;->MKxMLHJx()V

    :cond_92
    const-string v0, "aid"

    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9c

    const/4 v0, 0x0

    goto :goto_a8

    :cond_9c
    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v5, :cond_a8

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_a8
    :goto_a8
    iget-object p0, p0, Lyg;->e:Ljava/lang/Object;

    check-cast p0, Lnw3;

    invoke-virtual {p0}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    const-string v1, "1759515"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    check-cast p0, Lx5f;

    iget-boolean v2, p0, Lx5f;->h:Z

    if-eqz v2, :cond_11b

    iget-object v2, p0, Lx5f;->d:Lzpa;

    if-nez v0, :cond_c4

    const-string v0, "missing"

    :cond_c4
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v4

    invoke-virtual {v4, v2}, Lfi0;->x(Lzpa;)Lm80;

    move-result-object v2

    const/4 v4, 0x2

    if-eqz p1, :cond_d8

    xor-int/2addr v1, v6

    invoke-virtual {v2, v1}, Ljf0;->e(I)V

    goto :goto_e0

    :cond_d8
    if-eqz v1, :cond_dc

    move v1, v4

    goto :goto_dd

    :cond_dc
    const/4 v1, 0x3

    :goto_dd
    invoke-virtual {v2, v1}, Ljf0;->e(I)V

    :goto_e0
    const/4 v1, 0x4

    invoke-virtual {v2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    if-eqz v7, :cond_f5

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_f5

    new-instance v8, Lif0;

    invoke-direct {v8, v2, v1, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_102

    :cond_f5
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v1, v6, v7}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lif0;

    invoke-direct {v8, v2, v1, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_102
    invoke-virtual {v8, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt80;

    if-nez v1, :cond_114

    new-instance v1, Lt80;

    const/16 v2, 0x98b

    invoke-direct {v1, v2, v5, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v8, v0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_114
    xor-int/2addr p1, v6

    invoke-virtual {v1, p1}, Ljf0;->e(I)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_11b
    return-void

    :pswitch_data_11c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
