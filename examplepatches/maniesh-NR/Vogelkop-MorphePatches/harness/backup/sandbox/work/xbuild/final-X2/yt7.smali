.class public final synthetic Lyt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;
.implements Lxjj;
.implements Lh93;
.implements Lee5;
.implements Lfjc;
.implements Lgjc;
.implements Lcom/google/android/gms/tasks/Continuation;
.implements Lp9n;
.implements Lybc;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lyt7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lqi8;)V
    .registers 2

    const/16 p1, 0xd

    iput-byte p1, p0, Lyt7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Ljava/lang/Object;)Landroid/widget/inline/InlinePresentationSpec;
    .registers 1

    check-cast p0, Landroid/widget/inline/InlinePresentationSpec;

    return-object p0
.end method

.method public static synthetic b(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic e(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic f(Ljava/lang/String;)V
    .registers 2

    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0, p0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic g(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static synthetic j(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic k(Ljava/lang/String;)V
    .registers 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 6

    iget-byte p0, p0, Lyt7;->a:B

    packed-switch p0, :pswitch_data_70

    :pswitch_5
    new-instance p0, Lpu7;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Lkf;->h(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object p1

    invoke-direct {p0, p1}, Lpu7;-><init>(Lkf;)V

    return-object p0

    :pswitch_17
    new-instance p0, Lbu7;

    const v0, 0x7f0d0302

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a02ef

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_4b

    new-instance v0, Lb98;

    check-cast v1, Landroid/widget/FrameLayout;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v1, 0x7f0a08f1

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_4a

    new-instance v1, Lov0;

    check-cast p1, Landroid/widget/FrameLayout;

    const/16 v3, 0x19

    invoke-direct {v1, p1, v0, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v1}, Lbu7;-><init>(Lov0;)V

    goto :goto_5d

    :cond_4a
    move v0, v1

    :cond_4b
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_5d
    return-object p0

    :pswitch_5e
    new-instance p0, Liu7;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Lkf;->h(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object p1

    invoke-direct {p0, p1}, Liu7;-><init>(Lkf;)V

    return-object p0

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_5
        :pswitch_17
    .end packed-switch
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    iget-byte p0, p0, Lyt7;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_5e

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v1, "android.hardware.type.television"

    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_16

    const-string v0, "tv"

    goto :goto_42

    :cond_16
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v1, "android.hardware.type.watch"

    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_25

    const-string v0, "watch"

    goto :goto_42

    :cond_25
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v1, "android.hardware.type.automotive"

    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_34

    const-string v0, "auto"

    goto :goto_42

    :cond_34
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string p1, "android.hardware.type.embedded"

    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_42

    const-string v0, "embedded"

    :cond_42
    :goto_42
    return-object v0

    :pswitch_43
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-eqz p0, :cond_4f

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->minSdkVersion:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :cond_4f
    return-object v0

    :pswitch_50
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-eqz p0, :cond_5c

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :cond_5c
    return-object v0

    nop

    :pswitch_data_5e
    .packed-switch 0x1b
        :pswitch_50
        :pswitch_43
    .end packed-switch
.end method

.method public final h(Landroid/view/View;)V
    .registers 2

    iget-byte p0, p0, Lyt7;->a:B

    check-cast p1, Landroid/webkit/WebView;

    packed-switch p0, :pswitch_data_10

    invoke-virtual {p1}, Landroid/webkit/WebView;->onPause()V

    return-void

    :pswitch_b
    invoke-virtual {p1}, Landroid/webkit/WebView;->onResume()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x11
        :pswitch_b
    .end packed-switch
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-byte p0, p0, Lyt7;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_8a

    :pswitch_7
    check-cast p1, Llu7;

    check-cast p2, Lou7;

    iput-object p1, p2, Lou7;->e:Llu7;

    invoke-virtual {p2}, Lou7;->U()V

    iget-object p0, p2, Lou7;->b:Lov0;

    iget-object v2, p0, Lov0;->c:Ljava/lang/Object;

    check-cast v2, Lb98;

    iget-object v2, v2, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v3, Lnu7;

    invoke-direct {v3, p2, p1, v1}, Lnu7;-><init>(Lou7;Llu7;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    new-instance v1, Lnu7;

    invoke-direct {v1, p2, p1, v0}, Lnu7;-><init>(Lou7;Llu7;B)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2d
    check-cast p1, Lfu7;

    check-cast p2, Lju7;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p1, Lfu7;->l:Ljava/lang/String;

    invoke-static {p0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\s+"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, p0, v1}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, p2, Lju7;->b:Lov0;

    iget-object v1, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v0, Ljf7;

    const/4 v1, 0x4

    invoke-direct {v0, p2, p1, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_64
    check-cast p1, Ldu7;

    check-cast p2, Lhu7;

    iput-object p1, p2, Lhu7;->e:Ldu7;

    invoke-virtual {p2}, Lhu7;->U()V

    iget-object p0, p2, Lhu7;->b:Lov0;

    iget-object v2, p0, Lov0;->c:Ljava/lang/Object;

    check-cast v2, Lb98;

    iget-object v2, v2, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v3, Lgu7;

    invoke-direct {v3, p2, p1, v1}, Lgu7;-><init>(Lhu7;Ldu7;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    new-instance v1, Lgu7;

    invoke-direct {v1, p2, p1, v0}, Lgu7;-><init>(Lhu7;Ldu7;B)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_8a
    .packed-switch 0x1
        :pswitch_64
        :pswitch_7
        :pswitch_2d
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 3

    iget-byte p0, p0, Lyt7;->a:B

    check-cast p1, Leig;

    packed-switch p0, :pswitch_data_1c

    invoke-interface {p1}, Leig;->onRenderedFirstFrame()V

    return-void

    :pswitch_b
    new-instance p0, Le22;

    const-string v0, "Player release timed out."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x3eb

    invoke-static {v0, p0}, Lzh8;->h(ILjava/lang/RuntimeException;)Lzh8;

    move-result-object p0

    invoke-interface {p1, p0}, Leig;->F(Lrhg;)V

    return-void

    :pswitch_data_1c
    .packed-switch 0xc
        :pswitch_b
    .end packed-switch
.end method

.method public final o(Ljava/lang/Object;Lw69;)V
    .registers 3

    check-cast p1, Leig;

    new-instance p0, Ldig;

    invoke-direct {p0, p2}, Ldig;-><init>(Lw69;)V

    invoke-interface {p1, p0}, Leig;->c(Ldig;)V

    return-void
.end method

.method public final r(Lx79;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lyt7;->a:B

    packed-switch p0, :pswitch_data_26

    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Lm4c;

    sget-object p0, Lxim;->a:Lxim;

    return-object p0

    :pswitch_a
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->b:Lm4c;

    invoke-virtual {p0}, Lm4c;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0

    :pswitch_13
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->c:Lm4c;

    invoke-virtual {p0}, Lm4c;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0

    :pswitch_1c
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Lm4c;

    invoke-virtual {p0}, Lm4c;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x8
        :pswitch_1c
        :pswitch_13
        :pswitch_a
    .end packed-switch
.end method

.method public final s()V
    .registers 1

    return-void
.end method

.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lyt7;->a:B

    packed-switch p0, :pswitch_data_e

    const/4 p0, -0x1

    :goto_6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_b
    const/16 p0, 0x193

    goto :goto_6

    :pswitch_data_e
    .packed-switch 0xf
        :pswitch_b
    .end packed-switch
.end method
