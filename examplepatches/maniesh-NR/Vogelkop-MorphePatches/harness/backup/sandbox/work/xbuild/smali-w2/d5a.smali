.class public final Ld5a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Licp;


# instance fields
.field public a:I

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/io/File;ILjava/util/ArrayList;Ln1p;Ll5b;Ljava/lang/String;)V
    .registers 7

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-object p1, p0, Ld5a;->c:Ljava/lang/Object;

    iput p2, p0, Ld5a;->a:I

    iput-object p3, p0, Ld5a;->d:Ljava/lang/Object;

    iput-object p4, p0, Ld5a;->e:Ljava/lang/Object;

    iput-object p5, p0, Ld5a;->f:Ljava/lang/Object;

    iput-object p6, p0, Ld5a;->g:Ljava/lang/Object;

    .line 141
    iput-object p1, p0, Ld5a;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltsd;Ln4l;Lv8a;Lpde;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ld5a;->b:Ljava/lang/Object;

    iput-object p3, p0, Ld5a;->c:Ljava/lang/Object;

    iput-object p5, p0, Ld5a;->d:Ljava/lang/Object;

    iput-object p6, p0, Ld5a;->e:Ljava/lang/Object;

    iput-object p7, p0, Ld5a;->g:Ljava/lang/Object;

    iput-object p8, p0, Ld5a;->f:Ljava/lang/Object;

    iget-object p5, p2, Ln4l;->b:Landroid/widget/TextView;

    new-instance p6, Lpc5;

    const/16 p7, 0x18

    invoke-direct {p6, p0, p7}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p7

    if-eqz p7, :cond_21

    invoke-static {p7, p5, p6}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_21
    new-instance p5, Lf85;

    const/4 p6, 0x1

    invoke-direct {p5, p0, p6}, Lf85;-><init>(Ljava/lang/Object;B)V

    new-instance p7, Lal7;

    const/16 p8, 0x11

    invoke-direct {p7, p0, p8}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p5, p7}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p3, Lks6;

    const/16 p5, 0x10

    invoke-direct {p3, p0, p5}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p1, p2, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p3, Lc5a;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lc5a;-><init>(Ld5a;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p2, Ln4l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_52

    new-instance p3, Lc5a;

    invoke-direct {p3, p0, p6}, Lc5a;-><init>(Ld5a;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_52
    iget-object p1, p2, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_5f

    new-instance p3, Lc5a;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, Lc5a;-><init>(Ld5a;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_5f
    iget-object p1, p2, Ln4l;->g:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_6c

    new-instance p3, Lc5a;

    const/4 p4, 0x3

    invoke-direct {p3, p0, p4}, Lc5a;-><init>(Ld5a;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_6c
    iget-object p1, p2, Ln4l;->h:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_74
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_8a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    new-instance p3, Lc5a;

    const/4 p4, 0x4

    invoke-direct {p3, p0, p4}, Lc5a;-><init>(Ld5a;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_74

    :cond_8a
    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/Object;)V
    .registers 10

    iget-object p1, p0, Ld5a;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ln1p;

    iget-object p1, p0, Ld5a;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/util/ArrayList;

    iget-object p1, p0, Ld5a;->c:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Ljava/io/File;

    iget v1, p0, Ld5a;->a:I

    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, p2, Lq0i;

    if-eqz v2, :cond_49

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-eq v1, v5, :cond_49

    sget-object p2, Ll1p;->a:Lsa7;

    add-int/lit8 v2, v1, 0x1

    move-object v1, p1

    check-cast v1, Ljava/io/File;

    iget-object p0, p0, Ld5a;->f:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Ll5b;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Ljava/lang/String;

    new-instance v0, Ld5a;

    invoke-direct/range {v0 .. v6}, Ld5a;-><init>(Ljava/io/File;ILjava/util/ArrayList;Ln1p;Ll5b;Ljava/lang/String;)V

    new-instance p0, Lcno;

    const/16 p1, 0x8

    invoke-direct {p0, v5, p1}, Lcno;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lp9p;

    const/16 p2, 0xa

    invoke-direct {p1, v5, p2}, Lp9p;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, p0, p1, v0}, Ldap;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;

    return-void

    :cond_49
    sget-object p1, Ll1p;->b:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Ld5a;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-nez v2, :cond_5f

    check-cast p2, Lz2p;

    new-instance p1, Lkzo;

    invoke-direct {p1, p2, p0}, Lkzo;-><init>(Lz2p;Ljava/lang/String;)V

    move-object p2, p1

    :cond_5f
    new-instance p0, Lt0i;

    invoke-direct {p0, p2}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v4, p0}, Ln1p;->invoke(Ljava/lang/Object;)V

    return-void
.end method

.method public final b()V
    .registers 7

    iget-object v0, p0, Ld5a;->b:Ljava/lang/Object;

    check-cast v0, Ln4l;

    iget-object v1, p0, Ld5a;->c:Ljava/lang/Object;

    check-cast v1, Lv8a;

    iget v2, p0, Ld5a;->a:I

    iget-object v1, v1, Lv8a;->g:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8a;

    if-eqz v1, :cond_54

    iget-object v2, v0, Ln4l;->c:Landroid/widget/TextView;

    iget-object v0, v0, Ln4l;->d:Landroid/widget/TextView;

    if-eqz v2, :cond_43

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    iget v4, v1, Lu8a;->b:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%d"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v4, :cond_40

    const-string v3, "\u2026"

    :cond_40
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_43
    iget-object v1, v1, Lu8a;->a:Lm4l;

    invoke-virtual {v1}, Lm4l;->c()Lpxh;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_54
    invoke-virtual {p0}, Ld5a;->c()V

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Ld5a;->c:Ljava/lang/Object;

    check-cast v0, Lv8a;

    iget v1, p0, Ld5a;->a:I

    iget-object v0, v0, Lv8a;->g:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu8a;

    if-nez v0, :cond_15

    return-void

    :cond_15
    iget-object v0, v0, Lu8a;->a:Lm4l;

    invoke-virtual {v0}, Lm4l;->b()Lk4l;

    move-result-object v0

    iget-object p0, p0, Ld5a;->b:Ljava/lang/Object;

    check-cast p0, Ln4l;

    iget-object p0, p0, Ln4l;->b:Landroid/widget/TextView;

    iget-object v1, v0, Lk4l;->a:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, v0, Lk4l;->b:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final s(Lpzh;)Ljava/lang/Object;
    .registers 8

    iget-object p0, p0, Ld5a;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    const-string v0, "Can\'t rename to target file "

    :try_start_6
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ".b2aa479c.tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_37

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z
    :try_end_37
    .catchall {:try_start_6 .. :try_end_37} :catchall_88

    :cond_37
    :try_start_37
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3c
    .catchall {:try_start_37 .. :try_end_3c} :catchall_83

    :try_start_3c
    iget-object p1, p1, Lpzh;->g:Lvzh;

    invoke-virtual {p1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object p1

    const/16 v3, 0x2000

    new-array v3, v3, [B

    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    :goto_4a
    if-ltz v4, :cond_55

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4
    :try_end_54
    .catchall {:try_start_3c .. :try_end_54} :catchall_7c

    goto :goto_4a

    :cond_55
    :try_start_55
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    invoke-virtual {v1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_6a

    if-eqz p1, :cond_67

    sget-object p1, Lz2p;->b:Lz2p;

    goto :goto_91

    :cond_67
    sget-object p1, Lz2p;->a:Lz2p;

    goto :goto_91

    :cond_6a
    new-instance p1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_7c
    .catchall {:try_start_55 .. :try_end_7c} :catchall_83

    :catchall_7c
    move-exception p1

    :try_start_7d
    throw p1
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_7e

    :catchall_7e
    move-exception v0

    :try_start_7f
    invoke-static {v2, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_83

    :catchall_83
    move-exception p1

    :try_start_84
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw p1
    :try_end_88
    .catchall {:try_start_84 .. :try_end_88} :catchall_88

    :catchall_88
    move-exception p1

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_91
    instance-of v0, p1, Lq0i;

    if-eqz v0, :cond_97

    const/4 v0, 0x0

    goto :goto_98

    :cond_97
    move-object v0, p1

    :goto_98
    check-cast v0, Lz2p;

    if-nez v0, :cond_b3

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_a5

    sget-object v0, Lz2p;->c:Lz2p;

    goto :goto_b3

    :cond_a5
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_b2

    new-instance p0, Ljava/io/IOException;

    const-string p1, "Unknown error"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_b2
    throw p0

    :cond_b3
    :goto_b3
    return-object v0
.end method
