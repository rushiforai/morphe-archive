.class public final Lfge;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljbl;


# static fields
.field public static S:Z


# instance fields
.field public A:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public B:Landroid/view/View;

.field public C:Landroid/view/View;

.field public D:Landroid/view/View;

.field public E:Z

.field public F:Lcom/opera/android/custom_views/StylingEditText;

.field public G:Landroid/animation/ValueAnimator;

.field public final H:Lyfe;

.field public final I:Lage;

.field public final J:Luv1;

.field public K:Landroid/view/MenuItem;

.field public L:Landroid/net/Uri;

.field public M:Ljava/lang/String;

.field public N:Ljava/lang/Long;

.field public O:Ljava/lang/String;

.field public final P:Lbge;

.field public Q:Z

.field public R:Landroid/os/Bundle;

.field public final r:Lcom/opera/android/BrowserActivity;

.field public final s:Ltcl;

.field public final t:Lbf9;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Lx5f;

.field public final w:Lxc9;

.field public final x:Lrc9;

.field public final y:Lha2;

.field public final z:Lbc9;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V
    .registers 15

    const v0, 0x7f0d02d0

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v3, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v3, Litl;

    const/4 v4, 0x1

    iput-boolean v4, v3, Litl;->e:Z

    const v5, 0x7f1407ad

    invoke-virtual {v0, v5}, Lu7k;->s(I)V

    const v0, 0x7f100020

    iput v0, v3, Litl;->b:I

    invoke-direct {p0, v3}, Lltl;-><init>(Litl;)V

    new-instance v10, La83;

    const/16 v0, 0xb

    invoke-direct {v10, p0, v0}, La83;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lyfe;

    invoke-direct {v0, p0}, Lyfe;-><init>(Lfge;)V

    iput-object v0, p0, Lfge;->H:Lyfe;

    new-instance v0, Lage;

    invoke-direct {v0, p0}, Lage;-><init>(Lfge;)V

    iput-object v0, p0, Lfge;->I:Lage;

    new-instance v0, Luv1;

    invoke-direct {v0, p0, v4}, Luv1;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfge;->J:Luv1;

    new-instance v0, Lbge;

    invoke-direct {v0, p0}, Lbge;-><init>(Lfge;)V

    iput-object v0, p0, Lfge;->P:Lbge;

    iput-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lfge;->s:Ltcl;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    iput-object v0, p0, Lfge;->t:Lbf9;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iput-object v3, p0, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lfge;->v:Lx5f;

    new-instance v6, Lxc9;

    invoke-direct {v6, p1, p2}, Lxc9;-><init>(Landroid/content/Context;Ltcl;)V

    iput-object v6, p0, Lfge;->w:Lxc9;

    new-instance v4, Lrc9;

    invoke-direct {v4, p2, v0}, Lrc9;-><init>(Ltcl;Lbf9;)V

    iput-object v4, p0, Lfge;->x:Lrc9;

    new-instance v3, Lha2;

    iget-object v5, p1, Ldx3;->l:Ltni;

    invoke-direct {v3, v5}, Lha2;-><init>(Ltni;)V

    iput-object v3, p0, Lfge;->y:Lha2;

    new-instance v5, Lbc9;

    move-object v7, v5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v5

    iget-object v0, v0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    iget-object v8, v8, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v8, v8, Lxv1;->o1:Lj4c;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lwun;

    move-object v1, v7

    move-object v7, v0

    move-object v0, v1

    move-object v9, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v9}, Lbc9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lha2;Lrc9;Ltcc;Lxc9;Ljava/lang/String;Lwun;Lfge;)V

    iput-object v0, p0, Lfge;->z:Lbc9;

    invoke-virtual {v3, v0}, Lha2;->G(Lfa2;)V

    invoke-virtual {v3, v10}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method


# virtual methods
.method public final G0(Lib9;)Z
    .registers 5

    iget-object v0, p1, Lib9;->l:Landroid/net/Uri;

    const/4 v1, 0x0

    if-eqz v0, :cond_31

    iget-object v0, p1, Lhb9;->d:Ljava/lang/String;

    iget-object v2, p0, Lfge;->t:Lbf9;

    iget-object v2, v2, Lbf9;->a:Loji;

    invoke-virtual {v2}, Loji;->u()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    iget-object p1, p1, Lib9;->l:Landroid/net/Uri;

    invoke-virtual {p0, p1, v1}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p0

    if-eqz p0, :cond_31

    :cond_2f
    const/4 p0, 0x1

    return p0

    :cond_31
    return v1
.end method

.method public final H0(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 16

    iget-object v0, p0, Lfge;->t:Lbf9;

    iget-object v0, v0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    new-instance v5, Lz0c;

    const/16 v1, 0x18

    invoke-direct {v5, p0, p1, v1}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lege;

    invoke-direct {v1, p0, v0}, Lege;-><init>(Lfge;Ljava/lang/String;)V

    iget-object p0, p0, Lfge;->x:Lrc9;

    iget-object v2, p0, Lrc9;->b:Lbf9;

    iget-object p0, v2, Lbf9;->b:Landroid/content/Context;

    invoke-virtual {v2}, Lbf9;->q()Lpc9;

    move-result-object v6

    if-nez v6, :cond_27

    invoke-virtual {v1}, Lege;->a()V

    return-void

    :cond_27
    invoke-virtual {v2}, Lbf9;->r()I

    move-result v0

    const/4 v3, 0x2

    if-ge v0, v3, :cond_32

    invoke-virtual {v1}, Lege;->a()V

    return-void

    :cond_32
    invoke-static {p1}, Lc26;->A(Landroid/net/Uri;)Z

    move-result v0

    const/4 v10, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_a9

    invoke-static {p1}, Lc26;->A(Landroid/net/Uri;)Z

    move-result p0

    const/16 v0, 0x2c

    const/4 v4, 0x0

    if-eqz p0, :cond_63

    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedSchemeSpecificPart()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_63

    invoke-virtual {p0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const/16 v7, 0x3b

    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_5d

    invoke-virtual {p0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_5d
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_64

    :cond_63
    move-object p0, v4

    :cond_64
    new-instance v7, Leq6;

    invoke-static {p1}, Lc26;->A(Landroid/net/Uri;)Z

    move-result v8

    if-eqz v8, :cond_a1

    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedSchemeSpecificPart()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v8, 0x7

    if-lt v0, v8, :cond_8f

    add-int/lit8 v8, v0, -0x7

    invoke-virtual {p1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const-string v9, ";base64"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8f

    add-int/2addr v0, v10

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    goto :goto_a2

    :cond_8f
    if-ltz v0, :cond_a1

    add-int/2addr v0, v10

    :try_start_92
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1
    :try_end_a0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_92 .. :try_end_a0} :catch_a1

    goto :goto_a2

    :catch_a1
    :cond_a1
    move-object p1, v4

    :goto_a2
    invoke-direct {v7, p1}, Leq6;-><init>(Ljava/lang/Object;)V

    const-string p1, ""

    move-object v9, v4

    goto :goto_f7

    :cond_a9
    sget-object v0, Ls29;->a:Ljava/util/HashSet;

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e1

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v7, Lqq6;

    const/16 v8, 0xe

    invoke-direct {v7, p0, v8}, Lqq6;-><init>(Ljava/lang/Object;B)V

    :goto_dd
    move-object v9, p1

    move-object p1, v0

    move-object p0, v4

    goto :goto_f7

    :cond_e1
    invoke-static {p0, p1}, Lorg/chromium/base/ContentUriUtils;->c(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/chromium/base/ContentUriUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v7, Lqq8;

    invoke-direct {v7, p0, p1}, Lqq8;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_dd

    :goto_f7
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_106

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_105

    const-string p2, "unnamed"

    :cond_105
    move-object p1, p2

    :cond_106
    if-eqz p0, :cond_12c

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v4, -0x1

    if-ne v0, v4, :cond_12c

    sget-object v0, Ls29;->a:Ljava/util/HashSet;

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12c

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_12c
    if-nez p0, :cond_130

    const-string p0, "application/octet-stream"

    :cond_130
    move-object v8, p0

    invoke-interface {v7}, Lkc9;->length()J

    move-result-wide v11

    iput-object p1, v1, Lege;->b:Ljava/lang/String;

    iget-object p0, v1, Lege;->a:Lzb9;

    iput-object p1, p0, Lzb9;->e:Ljava/lang/String;

    iput-object v8, p0, Lzb9;->f:Ljava/lang/String;

    iput-wide v11, p0, Lzb9;->h:J

    iget-object p0, p0, Lzb9;->j:Lac9;

    if-eqz p0, :cond_146

    invoke-virtual {p0}, Lac9;->b0()V

    :cond_146
    new-instance v4, Lk5o;

    const/16 p0, 0x11

    invoke-direct {v4, p0, v3}, Lk5o;-><init>(BZ)V

    iput-object v1, v4, Lk5o;->c:Ljava/lang/Object;

    iget-object p0, v2, Lbf9;->e:Lle9;

    new-instance v1, Lue9;

    move-object v3, v7

    move-object v7, p1

    invoke-direct/range {v1 .. v9}, Lue9;-><init>(Lbf9;Lkc9;Lk5o;Lz0c;Lpc9;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)V

    new-instance p1, Lpe9;

    invoke-direct {p1, v4, v10}, Lpe9;-><init>(Lk5o;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, La32;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v1, p1, v0}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, p1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    iput-object p0, v4, Lk5o;->b:Ljava/lang/Object;

    return-void
.end method

.method public final I0(Lo93;)V
    .registers 3

    iget-object p0, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final J0(J)V
    .registers 10

    iget-object v0, p0, Lfge;->x:Lrc9;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, v0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    :cond_12
    if-ge v3, v0, :cond_3e

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lhb9;

    iget-wide v5, v4, Lhb9;->b:J

    cmp-long v5, v5, p1

    if-nez v5, :cond_12

    instance-of p1, v4, Lib9;

    if-eqz p1, :cond_3e

    check-cast v4, Lib9;

    iget-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Ldx3;->o:Lqim;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lqim;->d:Lnej;

    new-instance p2, Lzfe;

    invoke-direct {p2, p0, v4, v2}, Lzfe;-><init>(Lltl;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, p2, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_3e
    return-void
.end method

.method public final K0(Lib9;Z)Z
    .registers 12

    iget-object v0, p1, Lib9;->l:Landroid/net/Uri;

    const/4 v1, 0x0

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v2, v0, Lsf7;->a:Lrf7;

    iget-object v0, p1, Lhb9;->d:Ljava/lang/String;

    iget-object v3, p0, Lfge;->t:Lbf9;

    iget-object v3, v3, Lbf9;->a:Loji;

    invoke-virtual {v3}, Loji;->u()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lufe;

    invoke-direct {v4, p0}, Lufe;-><init>(Lfge;)V

    iget-object v5, p1, Lib9;->l:Landroid/net/Uri;

    iget-object v6, p1, Lib9;->h:Ljava/lang/String;

    move v7, p2

    invoke-virtual/range {v2 .. v7}, Lrf7;->q(Landroid/content/Context;Lvwh;Landroid/net/Uri;Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_3a
    move v7, p2

    iget-object p1, p1, Lib9;->l:Landroid/net/Uri;

    invoke-virtual {v2, p1, v1}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object v4

    if-nez v4, :cond_44

    :cond_43
    return v1

    :cond_44
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v4}, Lre7;->g()Landroid/net/Uri;

    move-result-object v5

    if-eqz v5, :cond_6a

    const/4 p1, 0x1

    invoke-static {v3, v4, p1}, Lrf7;->n(Landroid/content/Context;Lre7;Z)Z

    move-result p1

    if-eqz p1, :cond_6a

    move v8, v7

    invoke-static {v4}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object p1

    invoke-virtual {v4}, Lre7;->f()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v7}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v6

    invoke-virtual/range {v2 .. v8}, Lrf7;->o(Landroid/content/Context;Lre7;Landroid/net/Uri;Lo29;Ljava/lang/String;Z)Z

    move-result v1

    :cond_6a
    if-nez v1, :cond_79

    new-instance p1, Lglj;

    const p2, 0x7f1405c6

    const/16 v0, 0x9c4

    invoke-direct {p1, p2, v0}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lfge;->I0(Lo93;)V

    :cond_79
    return v1
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lfge;->P:Lbge;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lbge;->a:J

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->c0:Ljc9;

    const-string v0, "flow"

    iget-object p1, p1, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    iput-object p1, p0, Lfge;->R:Landroid/os/Bundle;

    return-void
.end method

.method public final onDestroy()V
    .registers 1

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Lfge;->y:Lha2;

    invoke-virtual {p0}, Lha2;->onDestroy()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 5

    iget-object v0, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    iget-object v2, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    if-nez v1, :cond_25

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v3, "MESSAGE_TEXT"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->c0:Ljc9;

    const-string v3, "flow"

    iget-object v0, v0, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_25
    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->D:Ljvj;

    const/4 v1, 0x0

    if-nez v0, :cond_2e

    move-object v0, v1

    :cond_2e
    iget-object v2, p0, Lfge;->P:Lbge;

    iget-object v0, v0, Ljvj;->a:Lh7f;

    invoke-virtual {v0, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_3e

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    :cond_3e
    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, p0, Lfge;->B:Landroid/view/View;

    iput-object v1, p0, Lfge;->C:Landroid/view/View;

    iput-object v1, p0, Lfge;->D:Landroid/view/View;

    iput-object v1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    iget-object v0, p0, Lfge;->K:Landroid/view/MenuItem;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lfge;->H:Lyfe;

    iget-object v2, p0, Lfge;->x:Lrc9;

    iget-object v2, v2, Lrc9;->d:Lh7f;

    invoke-virtual {v2, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iput-object v1, p0, Lfge;->K:Landroid/view/MenuItem;

    :cond_5c
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0260

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1e

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    return v2

    :cond_1e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0220

    const/4 v3, 0x0

    if-ne v0, v1, :cond_73

    new-instance p1, Lrxh;

    const v0, 0x7f140782

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    new-instance v0, Lufe;

    invoke-direct {v0, p0}, Lufe;-><init>(Lfge;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    new-instance v1, Lgkj;

    invoke-direct {v1, v3, v3}, Lnz0;-><init>(ZZ)V

    const/4 v3, 0x0

    iput-object v3, v1, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v1, Lgkj;->e:Lekj;

    iput-object v3, v1, Lgkj;->f:Lfkj;

    iput-object v3, v1, Lgkj;->g:Lqp2;

    iput-object v0, v1, Lgkj;->h:Ldkj;

    iput-object v3, v1, Lgkj;->i:Ldkj;

    iput-object v3, v1, Lgkj;->j:Lql;

    const v0, 0x7f140436

    iput v0, v1, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, v1, Lgkj;->l:I

    const v0, 0x7f140783

    iput v0, v1, Lgkj;->m:I

    iput-boolean v2, v1, Lgkj;->n:Z

    iput-object p1, v1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    return v2

    :cond_73
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a063c

    if-ne p1, v0, :cond_8f

    new-instance p1, Lam5;

    invoke-direct {p1}, Lam5;-><init>()V

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return v2

    :cond_8f
    return v3
.end method

.method public final onPause()V
    .registers 1

    invoke-super {p0}, Lltl;->onPause()V

    const/4 p0, 0x0

    sput-boolean p0, Lfge;->S:Z

    return-void
.end method

.method public final onResume()V
    .registers 10

    invoke-super {p0}, Lltl;->onResume()V

    const/4 v0, 0x1

    sput-boolean v0, Lfge;->S:Z

    iget-object v1, p0, Lfge;->w:Lxc9;

    invoke-virtual {v1}, Lxc9;->a()V

    iget-object v1, v1, Lxc9;->c:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "opened_my_flow_fragment"

    invoke-static {v1, v2, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    new-instance v1, Ltfe;

    invoke-direct {v1, p0, v0}, Ltfe;-><init>(Lfge;B)V

    iget-object p0, p0, Lfge;->x:Lrc9;

    iget-object v2, p0, Lrc9;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lrc9;->g:Lih4;

    if-eqz v1, :cond_29

    return-void

    :cond_29
    iget-object v1, p0, Lrc9;->b:Lbf9;

    new-instance v2, Ldg7;

    const/16 v3, 0x15

    invoke-direct {v2, p0, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Lbf9;->q()Lpc9;

    move-result-object v3

    invoke-virtual {v1}, Lbf9;->r()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_79

    if-eqz v3, :cond_79

    new-instance v4, Lmgh;

    const/4 v5, 0x0

    const/16 v6, 0x8

    invoke-direct {v4, v5, v2, v6}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lsu;

    const/16 v8, 0x18

    invoke-direct {v7, v1, v4, v2, v8}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lmgh;

    invoke-direct {v1, v5, v7, v6}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v3, Lpc9;->g:Lqie;

    iget-object v6, v3, Lpc9;->b:Lumi;

    new-instance v7, Lec9;

    invoke-direct {v7, v3, v0}, Lec9;-><init>(Lpc9;B)V

    invoke-interface {v6, v7}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v3, Lbm8;

    const/16 v7, 0xb

    invoke-direct {v3, v1, v7}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v3

    invoke-virtual {v0, v3}, Lnml;->b(Lnml;)V

    new-instance v3, Loml;

    invoke-direct {v3, v0}, Loml;-><init>(Lnml;)V

    invoke-virtual {v2, v3, v5}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    iput-object v1, v4, Lmgh;->b:Ljava/lang/Object;

    goto :goto_80

    :cond_79
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Ldg7;->run(Ljava/lang/Object;)V

    sget-object v4, Lbf9;->A:Lbxl;

    :goto_80
    iput-object v4, p0, Lrc9;->g:Lih4;

    return-void
.end method

.method public final onStart()V
    .registers 7

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-boolean v0, p0, Lfge;->Q:Z

    iget-object v1, p0, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lfge;->t:Lbf9;

    if-nez v0, :cond_32

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result v0

    if-nez v0, :cond_32

    new-instance v0, Lgge;

    invoke-direct {v0, v2, v1}, Lgge;-><init>(Lbf9;Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v3

    new-instance v4, Lob;

    const/16 v5, 0x9

    invoke-direct {v4, p0, v5}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Ltcc;->a(Lmdc;)V

    const/4 v3, 0x1

    iput-boolean v3, p0, Lfge;->Q:Z

    const/16 v3, 0x1003

    invoke-static {v0, v3}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object v3, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, v3}, Lzhj;->c(Landroid/content/Context;)V

    :cond_32
    iget-object v0, p0, Lfge;->I:Lage;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {v2, v0}, Lbf9;->b(Lhxl;)V

    iget-object p0, p0, Lfge;->J:Luv1;

    invoke-virtual {v2, p0}, Lbf9;->b(Lhxl;)V

    return-void
.end method

.method public final onStop()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_f
    iget-object v0, p0, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lfge;->I:Lage;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lfge;->t:Lbf9;

    invoke-virtual {v0, v1}, Lbf9;->D(Lhxl;)V

    iget-object p0, p0, Lfge;->J:Luv1;

    invoke-virtual {v0, p0}, Lbf9;->D(Lhxl;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0220

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lfge;->K:Landroid/view/MenuItem;

    if-eqz p1, :cond_22

    iget-object v0, p0, Lfge;->x:Lrc9;

    iget-object v1, v0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_17

    const/4 v1, 0x1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object p0, p0, Lfge;->H:Lyfe;

    iget-object p1, v0, Lrc9;->d:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_22
    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "flow"

    return-object p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 9

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a08c0

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p2, p1}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    new-instance p1, Ldge;

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p1}, Ldge;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    iget-object v1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    iget-object v1, p0, Lfge;->y:Lha2;

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Lcge;

    iget-object v3, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-direct {v2, v3, v1}, Lcge;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lha2;)V

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Llv2;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Llv2;-><init>(B)V

    const/4 v4, 0x0

    iput-boolean v4, v2, Lxkj;->g:Z

    invoke-virtual {p1, v2}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object p1, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_5c

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v1, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_5c
    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v1, Llzb;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    new-instance p1, Landroid/view/GestureDetector;

    iget-object v1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lv35;

    const/4 v5, 0x4

    invoke-direct {v2, p0, v5}, Lv35;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iget-object v1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Lvfe;

    invoke-direct {v2, p1, v4}, Lvfe;-><init>(Landroid/view/GestureDetector;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const p1, 0x7f0a097b

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lfge;->B:Landroid/view/View;

    invoke-virtual {p1, v4}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lfge;->B:Landroid/view/View;

    invoke-virtual {p1, v4}, Landroid/view/View;->setActivated(Z)V

    const p1, 0x7f0a0979

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingEditText;

    iput-object p1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    new-instance v1, Lmj2;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    new-instance v1, Lzp2;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lzp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lfge;->R:Landroid/os/Bundle;

    if-eqz p1, :cond_cd

    const-string v1, "MESSAGE_TEXT"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_cd

    iget-object v1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_cd
    iget-object p1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    iget-object v1, p0, Lfge;->B:Landroid/view/View;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lca;

    invoke-direct {v2, v1, v5}, Lca;-><init>(Landroid/view/View;B)V

    new-instance v1, Lys7;

    invoke-direct {v1, v2, v0}, Lys7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object p1, p0, Lfge;->B:Landroid/view/View;

    new-instance v1, Lwfe;

    invoke-direct {v1, p0, v4}, Lwfe;-><init>(Lfge;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a008c

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lfge;->C:Landroid/view/View;

    new-instance v1, Lwfe;

    invoke-direct {v1, p0, v0}, Lwfe;-><init>(Lfge;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a092b

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lfge;->D:Landroid/view/View;

    new-instance v0, Lwfe;

    invoke-direct {v0, p0, v3}, Lwfe;-><init>(Lfge;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v0, Lyc3;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lyc3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    const p1, 0x7f0a097c

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Latj;->a(Landroid/view/View;)V

    iget-object p1, p0, Lfge;->O:Ljava/lang/String;

    const/4 p2, 0x0

    if-eqz p1, :cond_139

    iget-object v0, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object p2, p0, Lfge;->O:Ljava/lang/String;

    iget-object p1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    :cond_139
    iget-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->D:Ljvj;

    if-eqz p1, :cond_140

    move-object p2, p1

    :cond_140
    iget-object p0, p0, Lfge;->P:Lbge;

    iget-object p1, p2, Ljvj;->a:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method
