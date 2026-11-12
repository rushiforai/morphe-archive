.class public Lma;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field public a:Lmyn;

.field public b:Landroid/content/Context;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lma;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .registers 2

    iget-object v0, p0, Lma;->a:Lmyn;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    invoke-virtual {v0}, Lmyn;->b()Ljvn;

    move-result-object v0

    iget-object v0, v0, Ljvn;->b:Lghg;

    invoke-super {p0}, Landroid/webkit/WebChromeClient;->getDefaultVideoPoster()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public final onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .registers 16

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lotb;->d:Lotb;

    iget-object v2, v1, Lhzc;->b:Ljava/lang/String;

    sget-object v3, Leaj;->b:Leaj;

    iget-object v4, v1, Lhzc;->a:Letb;

    iget-object v4, v4, Letb;->a:Leaj;

    invoke-virtual {v4, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    const-string v5, "]"

    const/4 v7, 0x0

    if-gtz v4, :cond_30

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "onPermissionRequest received request for resources ["

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v2, v4, v7}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_30
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_37
    if-ge v4, v2, :cond_f1

    aget-object v6, v1, v4

    if-eqz v6, :cond_83

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_150

    goto :goto_83

    :sswitch_45
    const-string v8, "android.webkit.resource.MIDI_SYSEX"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_83

    iget-object v8, p0, Lma;->a:Lmyn;

    if-nez v8, :cond_52

    move-object v8, v7

    :cond_52
    invoke-virtual {v8}, Lmyn;->b()Ljvn;

    move-result-object v8

    iget-object v8, v8, Ljvn;->b:Lghg;

    goto :goto_83

    :sswitch_59
    const-string v8, "android.webkit.resource.PROTECTED_MEDIA_ID"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_83

    iget-object v8, p0, Lma;->a:Lmyn;

    if-nez v8, :cond_66

    move-object v8, v7

    :cond_66
    invoke-virtual {v8}, Lmyn;->b()Ljvn;

    move-result-object v8

    iget-object v8, v8, Ljvn;->b:Lghg;

    goto :goto_83

    :sswitch_6d
    const-string v8, "android.webkit.resource.AUDIO_CAPTURE"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_83

    const-string v8, "android.permission.RECORD_AUDIO"

    goto :goto_84

    :sswitch_78
    const-string v8, "android.webkit.resource.VIDEO_CAPTURE"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_83

    const-string v8, "android.permission.CAMERA"

    goto :goto_84

    :cond_83
    :goto_83
    move-object v8, v7

    :goto_84
    if-eqz v8, :cond_ed

    iget-object v9, p0, Lma;->b:Landroid/content/Context;

    if-nez v9, :cond_8b

    move-object v9, v7

    :cond_8b
    invoke-static {v9, v8}, Lnb6;->h(Landroid/content/Context;Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_c1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v9, Lotb;->d:Lotb;

    iget-object v10, v9, Lhzc;->b:Ljava/lang/String;

    sget-object v11, Leaj;->b:Leaj;

    iget-object v12, v9, Lhzc;->a:Letb;

    iget-object v12, v12, Letb;->a:Leaj;

    invoke-virtual {v12, v11}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v12

    if-gtz v12, :cond_ed

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "onPermissionRequest permission ["

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, "] was already granted for resource ["

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v11, v10, v6, v7}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_ed

    :cond_c1
    sget-object v9, Lotb;->d:Lotb;

    iget-object v10, v9, Lhzc;->b:Ljava/lang/String;

    sget-object v11, Leaj;->d:Leaj;

    iget-object v12, v9, Lhzc;->a:Letb;

    iget-object v12, v12, Letb;->a:Leaj;

    invoke-virtual {v12, v11}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v12

    if-gtz v12, :cond_ed

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "onPermissionRequest didn\'t find already granted permission ["

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, "] for resource ["

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v11, v10, v6, v7}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_ed
    :goto_ed
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_37

    :cond_f1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_127

    new-array p0, v3, [Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    sget-object p0, Lotb;->d:Lotb;

    iget-object p1, p0, Lhzc;->b:Ljava/lang/String;

    sget-object v8, Leaj;->b:Leaj;

    iget-object v1, p0, Lhzc;->a:Letb;

    iget-object v1, v1, Letb;->a:Leaj;

    invoke-virtual {v1, v8}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_14f

    const/4 v5, 0x0

    const/16 v6, 0x3f

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onPermissionRequest granted permissions: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v8, p1, v0, v7}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_127
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->deny()V

    sget-object p0, Lotb;->d:Lotb;

    iget-object v0, p0, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->b:Leaj;

    iget-object v2, p0, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_14f

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onPermissionRequest denied permissions: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, v0, p1, v7}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_14f
    return-void

    :sswitch_data_150
    .sparse-switch
        -0x62fe2171 -> :sswitch_78
        0x39bbdaea -> :sswitch_6d
        0x3fbf39da -> :sswitch_59
        0x49886d55 -> :sswitch_45
    .end sparse-switch
.end method

.method public final onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    iget-object v0, p0, Lma;->a:Lmyn;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object v0, v1

    :cond_9
    invoke-virtual {v0}, Lmyn;->a()Lktc;

    move-result-object v0

    instance-of v0, v0, Lhtc;

    if-eqz v0, :cond_1e

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lma;->c:Ljava/lang/String;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    return-void

    :cond_1e
    iget-object v0, p0, Lma;->a:Lmyn;

    if-eqz v0, :cond_23

    move-object v1, v0

    :cond_23
    const/16 v0, 0x64

    if-ne p2, v0, :cond_2a

    sget-object p2, Lhtc;->a:Lhtc;

    goto :goto_34

    :cond_2a
    new-instance v0, Ljtc;

    int-to-float p2, p2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr p2, v2

    invoke-direct {v0, p2}, Ljtc;-><init>(F)V

    move-object p2, v0

    :goto_34
    iget-object v0, v1, Lmyn;->c:Lt0g;

    invoke-virtual {v0, p2}, Lt0g;->setValue(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_41

    const-string p1, ""

    :cond_41
    iput-object p1, p0, Lma;->c:Ljava/lang/String;

    return-void
.end method

.method public final onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 10

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const/4 v4, 0x0

    if-gtz v3, :cond_23

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v5, "onReceivedTitle: "

    const-string v6, " url:"

    invoke-static {v5, p2, v6, v3}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_23
    iget-object v0, p0, Lma;->a:Lmyn;

    if-nez v0, :cond_28

    move-object v0, v4

    :cond_28
    iget-object v0, v0, Lmyn;->d:Lt0g;

    invoke-virtual {v0, p2}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p0, p0, Lma;->a:Lmyn;

    if-eqz p0, :cond_32

    move-object v4, p0

    :cond_32
    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_3a

    const-string p0, ""

    :cond_3a
    iget-object p1, v4, Lmyn;->a:Lt0g;

    invoke-virtual {p1, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method
