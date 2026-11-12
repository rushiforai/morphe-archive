.class public Lyhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwm;
.implements Lqye;
.implements Lvlf;
.implements Lkod;
.implements Lrwg;
.implements Lh4h;
.implements Lo7h;
.implements Lhti;
.implements Ln2k;
.implements Lhpf;
.implements Lf94;
.implements Lnwh;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 5

    iput-byte p1, p0, Lyhe;->a:B

    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_dc

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lu9d;

    invoke-direct {p1}, Lu9d;-><init>()V

    const-string v0, "first"

    const-string v1, "name"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lnf2;->c:Lnf2;

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "last"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "given"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "family"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "full"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "set"

    const-string v1, "password"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lnf2;->m:Lnf2;

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "choose"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "new"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "confirm"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lnf2;->g:Lnf2;

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "email"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lnf2;->e:Lnf2;

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "user"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lnf2;->h:Lnf2;

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "username"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "login"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "birth"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lnf2;->k:Lnf2;

    invoke-virtual {p1, v0, v1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lu9d;->g()Lu9d;

    move-result-object p1

    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    return-void

    :sswitch_aa
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lurj;

    invoke-direct {p1, v0}, Lurj;-><init>(B)V

    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    return-void

    :sswitch_b5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_b9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class p1, Landroidx/camera/camera2/compat/quirk/ExtraCroppingQuirk;

    invoke-static {p1}, Ld77;->a(Ljava/lang/Class;)Ltgh;

    move-result-object p1

    check-cast p1, Landroidx/camera/camera2/compat/quirk/ExtraCroppingQuirk;

    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    return-void

    :sswitch_c7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lwub;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lyp9;

    const/16 v2, 0x86

    invoke-direct {v1, p1, v2, v0}, Lyp9;-><init>(Ljava/lang/Object;IB)V

    iput-object v1, p1, Lwub;->a:Ljava/lang/Object;

    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_dc
    .sparse-switch
        0xe -> :sswitch_c7
        0xf -> :sswitch_b9
        0x14 -> :sswitch_b5
        0x18 -> :sswitch_aa
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/view/View;Lgim;Lhim;)V
    .registers 5

    const/4 v0, 0x7

    iput-byte v0, p0, Lyhe;->a:B

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    .line 224
    new-instance p0, Lzvd;

    const/16 v0, 0x9

    invoke-direct {p0, p2, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    new-instance p0, Lzt;

    const/16 p2, 0xc

    invoke-direct {p0, p3, p2}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public constructor <init>(Lcie;Lbn;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lyhe;->a:B

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyhe;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld4d;)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Lyhe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iget-byte v0, p1, Ld4d;->c:B

    .line 232
    iget-byte v1, p1, Ld4d;->d:B

    .line 233
    new-array v2, v0, [Lwub;

    iput-object v2, p0, Lyhe;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v0, :cond_20

    iget-object v3, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v3, [Lwub;

    new-instance v4, Lwub;

    invoke-direct {v4, p1, v1}, Lwub;-><init>(Ld4d;I)V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_20
    return-void
.end method

.method public constructor <init>(Lhjf;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lyhe;->a:B

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    const-class v0, Landroid/view/autofill/AutofillManager;

    .line 228
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 229
    check-cast p1, Landroid/view/autofill/AutofillManager;

    .line 230
    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 221
    iput-byte p2, p0, Lyhe;->a:B

    iput-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([J)V
    .registers 7

    const/16 v0, 0x16

    iput-byte v0, p0, Lyhe;->a:B

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4e

    .line 235
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p1

    .line 236
    new-instance v0, Lrde;

    array-length v1, p1

    invoke-direct {v0, v1}, Lrde;-><init>(I)V

    .line 237
    iget v1, v0, Lrde;->b:I

    if-ltz v1, :cond_47

    .line 238
    array-length v2, p1

    if-eqz v2, :cond_53

    .line 239
    array-length v2, p1

    add-int/2addr v2, v1

    .line 240
    iget-object v3, v0, Lrde;->a:[J

    .line 241
    array-length v4, v3

    if-ge v4, v2, :cond_31

    .line 242
    array-length v4, v3

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x2

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 243
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v3

    iput-object v3, v0, Lrde;->a:[J

    .line 244
    :cond_31
    iget v2, v0, Lrde;->b:I

    if-eq v1, v2, :cond_3b

    .line 245
    array-length v4, p1

    add-int/2addr v4, v1

    sub-int/2addr v2, v1

    .line 246
    invoke-static {v3, v1, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    :cond_3b
    array-length v2, p1

    const/4 v4, 0x0

    .line 248
    invoke-static {p1, v4, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 249
    iget v1, v0, Lrde;->b:I

    array-length p1, p1

    add-int/2addr v1, p1

    iput v1, v0, Lrde;->b:I

    goto :goto_53

    .line 250
    :cond_47
    const-string p0, ""

    invoke-static {p0}, Lzwg;->u(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 251
    :cond_4e
    new-instance v0, Lrde;

    invoke-direct {v0}, Lrde;-><init>()V

    .line 252
    :cond_53
    :goto_53
    iput-object v0, p0, Lyhe;->b:Ljava/lang/Object;

    return-void
.end method

.method public static f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;
    .registers 5

    invoke-static {p4}, Lc26;->s(Z)I

    move-result p4

    or-int/2addr p3, p4

    new-instance p4, Lyhe;

    invoke-static {p0, p1, p2, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const/16 p1, 0x8

    invoke-direct {p4, p0, p1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    return-object p4
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 4

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lhlk;

    iget-object p0, p0, Lhlk;->k:Lo4g;

    iget-object p0, p0, Lo4g;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v0, p1, Lfpf;->b:Ljava/lang/String;

    iget-object p1, p1, Lfpf;->a:Ljava/lang/String;

    const-string v1, "\nID: "

    invoke-static {v0, v1, p1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    return-void
.end method

.method public final a(Lbuk;)V
    .registers 8

    invoke-static {}, Lxug;->n()Z

    move-result v0

    if-nez v0, :cond_1d

    iget-object v0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/camera/view/PreviewView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lq2g;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, v2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1d
    iget-object v0, p1, Lbuk;->e:Lzd4;

    iget-object v1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/view/PreviewView;

    invoke-interface {v0}, Lzd4;->g()Lxd4;

    move-result-object v2

    iput-object v2, v1, Landroidx/camera/view/PreviewView;->k:Lxd4;

    iget-object v1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/view/PreviewView;

    iget-object v1, v1, Landroidx/camera/view/PreviewView;->i:Lbxg;

    invoke-interface {v0}, Lzd4;->g()Lxd4;

    move-result-object v2

    invoke-interface {v2}, Lxd4;->g()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V

    iput-object v3, v1, Lbxg;->a:Landroid/util/Rational;

    monitor-enter v1

    :try_start_4a
    iput-object v2, v1, Lbxg;->c:Landroid/graphics/Rect;

    monitor-exit v1
    :try_end_4d
    .catchall {:try_start_4a .. :try_end_4d} :catchall_f4

    iget-object v1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/view/PreviewView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, La32;

    const/16 v3, 0x1a

    invoke-direct {v2, p0, v0, p1, v3}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v2}, Lbuk;->b(Ljava/util/concurrent/Executor;Lauk;)V

    iget-object v1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/view/PreviewView;

    iget-object v2, v1, Landroidx/camera/view/PreviewView;->b:Ln1f;

    iget v1, v1, Landroidx/camera/view/PreviewView;->a:I

    instance-of v2, v2, Leuk;

    if-eqz v2, :cond_75

    invoke-static {p1, v1}, Landroidx/camera/view/PreviewView;->d(Lbuk;I)Z

    move-result v1

    if-eqz v1, :cond_9e

    :cond_75
    iget-object v1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/view/PreviewView;

    iget v2, v1, Landroidx/camera/view/PreviewView;->a:I

    invoke-static {p1, v2}, Landroidx/camera/view/PreviewView;->d(Lbuk;I)Z

    move-result v2

    iget-object v3, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/camera/view/PreviewView;

    iget-object v4, v3, Landroidx/camera/view/PreviewView;->d:Lywg;

    if-eqz v2, :cond_97

    new-instance v2, Lall;

    invoke-direct {v2, v3, v4}, Ln1f;-><init>(Landroid/widget/FrameLayout;Lywg;)V

    const/4 v3, 0x0

    iput-boolean v3, v2, Lall;->i:Z

    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v3, v2, Lall;->k:Ljava/util/concurrent/atomic/AtomicReference;

    goto :goto_9c

    :cond_97
    new-instance v2, Leuk;

    invoke-direct {v2, v3, v4}, Leuk;-><init>(Landroid/widget/FrameLayout;Lywg;)V

    :goto_9c
    iput-object v2, v1, Landroidx/camera/view/PreviewView;->b:Ln1f;

    :cond_9e
    new-instance v1, Lxwg;

    invoke-interface {v0}, Lzd4;->g()Lxd4;

    move-result-object v2

    iget-object v3, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/camera/view/PreviewView;

    iget-object v4, v3, Landroidx/camera/view/PreviewView;->f:Lode;

    iget-object v3, v3, Landroidx/camera/view/PreviewView;->b:Ln1f;

    invoke-direct {v1, v2, v4, v3}, Lxwg;-><init>(Lxd4;Lode;Ln1f;)V

    iget-object v2, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/camera/view/PreviewView;

    iget-object v2, v2, Landroidx/camera/view/PreviewView;->g:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-interface {v0}, Lzd4;->b()Lx6f;

    move-result-object v2

    iget-object v3, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/camera/view/PreviewView;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lx6f;->g(Ljava/util/concurrent/Executor;Lv6f;)V

    iget-object v2, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/camera/view/PreviewView;

    iget-object v2, v2, Landroidx/camera/view/PreviewView;->b:Ln1f;

    new-instance v3, La32;

    const/16 v4, 0x1b

    invoke-direct {v3, p0, v1, v0, v4}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, p1, v3}, Ln1f;->j(Lbuk;La32;)V

    iget-object p1, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p1, Landroidx/camera/view/PreviewView;

    iget-object v0, p1, Landroidx/camera/view/PreviewView;->c:Lnc;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_f1

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/camera/view/PreviewView;

    iget-object p1, p0, Landroidx/camera/view/PreviewView;->c:Lnc;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_f1
    return-void

    :goto_f2
    :try_start_f2
    monitor-exit v1
    :try_end_f3
    .catchall {:try_start_f2 .. :try_end_f3} :catchall_f4

    throw p0

    :catchall_f4
    move-exception p0

    goto :goto_f2
.end method

.method public final b(ILjava/io/Serializable;)V
    .registers 4

    const/4 v0, 0x6

    if-eq p1, v0, :cond_a

    const/4 v0, 0x7

    if-eq p1, v0, :cond_a

    const/16 v0, 0x8

    if-ne p1, v0, :cond_c

    :cond_a
    check-cast p2, Ljava/lang/Throwable;

    :cond_c
    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/profileinstaller/ProfileInstallReceiver;

    invoke-virtual {p0, p1}, Landroid/content/BroadcastReceiver;->setResultCode(I)V

    return-void
.end method

.method public final c(Lcsh;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lh1b;->u(I)La1b;

    move-result-object p1

    :cond_f
    :goto_f
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqjd;

    iget-object v4, v3, Lqjd;->e:Lvjd;

    invoke-static {v4}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_f

    new-instance v5, Lmkg;

    iget-object v6, v3, Lqjd;->e:Lvjd;

    new-instance v7, Legd;

    invoke-direct {v7, v4}, Legd;-><init>(Landroid/net/Uri;)V

    const/4 v8, 0x0

    iget-object v9, v3, Lqjd;->a:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v8, v9}, Lmkg;-><init>(Lvjd;Legd;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lqjd;->a()Lejd;

    move-result-object v3

    iput-object v4, v3, Lejd;->b:Landroid/net/Uri;

    invoke-virtual {v3}, Lejd;->a()Lqjd;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_43
    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lokg;

    new-array p1, v2, [Lmkg;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lmkg;

    const/4 v1, -0x1

    invoke-virtual {p0, v1, p1}, Lokg;->a(I[Lmkg;)V

    invoke-static {v0}, Lyr9;->c(Ljava/lang/Object;)Lr0b;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lbm;)V
    .registers 2

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lbn;

    invoke-interface {p0, p1}, Lbn;->m(Lbm;)V

    return-void
.end method

.method public final e([B)V
    .registers 16

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, [Lwub;

    array-length v3, v2

    if-ge v1, v3, :cond_6c

    aget-object v2, v2, v1

    shl-int/lit8 v3, v1, 0x8

    move v4, v0

    :goto_e
    iget-object v5, v2, Lwub;->a:Ljava/lang/Object;

    check-cast v5, [Lp8f;

    array-length v6, v5

    if-ge v4, v6, :cond_69

    aget-object v5, v5, v4

    add-int v6, v3, v4

    int-to-short v6, v6

    iget-object v7, v5, Lp8f;->d:Ljava/lang/Object;

    check-cast v7, Liuh;

    iget-object v7, v7, Liuh;->b:Ljava/lang/Object;

    check-cast v7, Lvci;

    const/16 v8, 0x34a

    new-array v8, v8, [B

    invoke-virtual {v7}, Lgub;->reset()V

    int-to-byte v9, v6

    shr-int/lit8 v6, v6, 0x8

    int-to-byte v6, v6

    const/4 v10, 0x2

    new-array v11, v10, [B

    aput-byte v9, v11, v0

    const/4 v9, 0x1

    aput-byte v6, v11, v9

    array-length v6, p1

    invoke-virtual {v7, v0, v6, p1}, Lgub;->g(II[B)V

    invoke-virtual {v7, v0, v10, v11}, Lgub;->g(II[B)V

    const/16 v6, 0x348

    invoke-virtual {v7, v0, v6, v8}, Lvci;->p(II[B)V

    const/16 v9, 0x100

    invoke-static {v5, v0, v9, v8, v6}, Lp8f;->B(Lp8f;II[BI)I

    move-result v10

    :goto_47
    if-ge v10, v9, :cond_66

    rem-int/lit8 v11, v6, 0x3

    move v12, v0

    :goto_4c
    if-ge v12, v11, :cond_58

    sub-int v13, v6, v11

    add-int/2addr v13, v12

    aget-byte v13, v8, v13

    aput-byte v13, v8, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_4c

    :cond_58
    const/16 v6, 0xa8

    invoke-virtual {v7, v11, v6, v8}, Lvci;->p(II[B)V

    add-int/2addr v6, v11

    rsub-int v11, v10, 0x100

    invoke-static {v5, v10, v11, v8, v6}, Lp8f;->B(Lp8f;II[BI)I

    move-result v11

    add-int/2addr v10, v11

    goto :goto_47

    :cond_66
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_69
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6c
    return-void
.end method

.method public final g()V
    .registers 1

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lbn;

    invoke-interface {p0}, Lbn;->I()V

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lqh;

    iget-object p0, p0, Lqh;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    sget-byte v0, Ldni;->d:B

    new-instance v1, Ldni;

    const-string v2, "com.google.android.datatransport.events"

    invoke-direct {v1, p0, v0, v2}, Ldni;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object v1
.end method

.method public final h(Lcpf;)V
    .registers 3

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lhlk;

    iget-object p0, p0, Lhlk;->k:Lo4g;

    iget-object p0, p0, Lo4g;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object p1, p1, Lcpf;->a:Ljava/lang/String;

    const-string v0, "Anonymous account\nID: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    return-void
.end method

.method public i()[Ljava/lang/Integer;
    .registers 2

    const/4 v0, 0x0

    :try_start_1
    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputFormats()[I

    move-result-object p0
    :try_end_b
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_b} :catch_c

    goto :goto_d

    :catch_c
    :cond_c
    move-object p0, v0

    :goto_d
    if-eqz p0, :cond_13

    invoke-static {p0}, Lb82;->l([I)[Ljava/lang/Integer;

    move-result-object v0

    :cond_13
    return-object v0
.end method

.method public j(ILandroid/util/Size;)J
    .registers 3

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputMinFrameDuration(ILandroid/util/Size;)J

    move-result-wide p0

    return-wide p0

    :cond_b
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final k(Landroid/app/assist/AssistStructure$ViewNode;)Lnf2;
    .registers 4

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lu9d;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_11

    invoke-static {p1, p0}, Lr9n;->b(Landroid/app/assist/AssistStructure$ViewNode;Lu9d;)Lnf2;

    move-result-object v0

    if-eqz v0, :cond_11

    return-object v0

    :cond_11
    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->getTextIdEntry()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lscd;->n(Ljava/lang/String;Lu9d;)Lnf2;

    move-result-object v0

    if-eqz v0, :cond_1c

    return-object v0

    :cond_1c
    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->getIdEntry()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lscd;->n(Ljava/lang/String;Lu9d;)Lnf2;

    move-result-object p0

    if-eqz p0, :cond_27

    return-object p0

    :cond_27
    const/4 p0, 0x0

    return-object p0
.end method

.method public l(I)[Landroid/util/Size;
    .registers 2

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(Ljava/lang/String;)Ljava/util/regex/Pattern;
    .registers 4

    iget-object v0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Lwub;

    monitor-enter v0

    :try_start_5
    iget-object v1, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v1, Lyp9;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_2b

    monitor-exit v0

    check-cast v1, Ljava/util/regex/Pattern;

    if-nez v1, :cond_28

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lwub;

    monitor-enter p0

    :try_start_1b
    iget-object v1, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v1, Lyp9;

    invoke-virtual {v1, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_26

    monitor-exit p0

    return-object v0

    :goto_24
    :try_start_24
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_26

    throw p1

    :catchall_26
    move-exception p1

    goto :goto_24

    :cond_28
    return-object v1

    :goto_29
    :try_start_29
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public final o(Landroidx/recyclerview/widget/i;)F
    .registers 7

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq v1, v2, :cond_2a

    iget-object v2, p0, Lz5l;->n:Ltsd;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly5l;

    iget-object v2, v2, Ly5l;->b:Lb3c;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v4, 0x2

    if-eqz v2, :cond_2b

    const/4 p0, 0x1

    if-eq v2, p0, :cond_2a

    if-eq v2, v4, :cond_2a

    const/4 p0, 0x3

    if-eq v2, p0, :cond_2a

    invoke-static {}, Lh9o;->p()V

    :cond_2a
    return v3

    :cond_2b
    iget-object v2, p0, Lz5l;->w:Lqsh;

    invoke-virtual {v2, v0, v1}, Lqsh;->b(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/graphics/Point;

    move-result-object v1

    iget-object p0, p0, Lz5l;->q:Lilb;

    iget-object p0, p0, Lilb;->i:Lxh7;

    iget-object v2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lxh7;->a(Landroid/view/View;)F

    move-result p0

    cmpl-float p0, p0, v3

    if-gtz p0, :cond_45

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v3

    :cond_45
    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result p0

    int-to-float p0, p0

    add-float/2addr v3, p0

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    div-int/2addr p0, v4

    int-to-float p0, p0

    add-float/2addr v3, p0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result p0

    div-int/2addr p0, v4

    int-to-float p0, p0

    sub-float/2addr v3, p0

    iget p0, v1, Landroid/graphics/Point;->x:I

    int-to-float p0, p0

    div-float/2addr v3, p0

    const/high16 p0, -0x41000000    # -0.5f

    const/high16 p1, 0x3f000000    # 0.5f

    invoke-static {v3, p0, p1}, Ldjh;->b(FFF)F

    move-result p0

    return p0
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lbn;

    invoke-interface {p0}, Lbn;->onAdClicked()V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lb94;

    new-instance p1, Lu1m;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_e

    const-string p2, "Unknown failure"

    :cond_e
    invoke-direct {p1, p2}, Lu1m;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 6

    const-string p1, "Bad response: "

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lb94;

    :try_start_6
    iget-boolean v0, p2, Lpzh;->q:Z

    if-eqz v0, :cond_10

    sget-object p1, Lv1m;->a:Lv1m;

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_26

    :cond_10
    new-instance v0, Lu1m;

    iget-object v1, p2, Lpzh;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lu1m;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lb94;->run(Ljava/lang/Object;)V
    :try_end_26
    .catchall {:try_start_6 .. :try_end_26} :catchall_2a

    :goto_26
    invoke-virtual {p2}, Lpzh;->close()V

    return-void

    :catchall_2a
    move-exception p0

    :try_start_2b
    throw p0
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2c

    :catchall_2c
    move-exception p1

    invoke-static {p2, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Loy;

    invoke-virtual {p0, p1}, Loy;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final q()Lm2k;
    .registers 1

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lurj;

    return-object p0
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lhlk;

    iget-object p0, p0, Lhlk;->k:Lo4g;

    iget-object p0, p0, Lo4g;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const-string p1, "No account"

    invoke-static {p0, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    return-void
.end method

.method public final s(Lwub;Lwub;)V
    .registers 20

    move-object/from16 v0, p2

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, [Lp8f;

    const/4 v1, 0x0

    move-object/from16 v2, p0

    move v3, v1

    :goto_a
    iget-object v4, v2, Lyhe;->b:Ljava/lang/Object;

    check-cast v4, [Lwub;

    array-length v5, v4

    if-ge v3, v5, :cond_81

    move-object/from16 v5, p1

    iget-object v6, v5, Lwub;->a:Ljava/lang/Object;

    check-cast v6, [Lp8f;

    aget-object v6, v6, v3

    aget-object v4, v4, v3

    iget-object v7, v6, Lp8f;->b:Ljava/lang/Object;

    check-cast v7, [I

    iget-object v6, v6, Lp8f;->c:Ljava/lang/Object;

    check-cast v6, Ld4d;

    iget-byte v6, v6, Ld4d;->d:B

    iget-object v8, v4, Lwub;->a:Ljava/lang/Object;

    check-cast v8, [Lp8f;

    aget-object v8, v8, v1

    iget-object v8, v8, Lp8f;->b:Ljava/lang/Object;

    check-cast v8, [I

    aget-object v9, v0, v1

    iget-object v9, v9, Lp8f;->b:Ljava/lang/Object;

    check-cast v9, [I

    move v10, v1

    :goto_36
    const/16 v11, 0x100

    if-ge v10, v11, :cond_4a

    aget v11, v8, v10

    int-to-long v11, v11

    aget v13, v9, v10

    int-to-long v13, v13

    mul-long/2addr v11, v13

    invoke-static {v11, v12}, Lhyg;->j(J)I

    move-result v11

    aput v11, v7, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_36

    :cond_4a
    const/4 v8, 0x1

    :goto_4b
    if-ge v8, v6, :cond_7d

    iget-object v9, v4, Lwub;->a:Ljava/lang/Object;

    check-cast v9, [Lp8f;

    aget-object v9, v9, v8

    iget-object v9, v9, Lp8f;->b:Ljava/lang/Object;

    check-cast v9, [I

    aget-object v10, v0, v8

    iget-object v10, v10, Lp8f;->b:Ljava/lang/Object;

    check-cast v10, [I

    move v12, v1

    :goto_5e
    if-ge v12, v11, :cond_77

    aget v13, v7, v12

    aget v14, v9, v12

    int-to-long v14, v14

    aget v1, v10, v12

    move/from16 v16, v12

    int-to-long v11, v1

    mul-long/2addr v14, v11

    invoke-static {v14, v15}, Lhyg;->j(J)I

    move-result v1

    add-int/2addr v1, v13

    aput v1, v7, v16

    add-int/lit8 v12, v16, 0x1

    const/16 v11, 0x100

    goto :goto_5e

    :cond_77
    add-int/lit8 v8, v8, 0x1

    const/4 v1, 0x0

    const/16 v11, 0x100

    goto :goto_4b

    :cond_7d
    add-int/lit8 v3, v3, 0x1

    const/4 v1, 0x0

    goto :goto_a

    :cond_81
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lyhe;->a:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{fragment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lnsk;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_2c
    .packed-switch 0x1c
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-byte v0, p0, Lyhe;->a:B

    packed-switch v0, :pswitch_data_30

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lwzj;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_11
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaRadioGroup;

    iget-boolean p2, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    if-nez p2, :cond_2e

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    iget p2, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    const/4 v0, -0x1

    const/4 v1, 0x0

    if-eq p2, v0, :cond_29

    invoke-virtual {p0, p2, v1}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    :cond_29
    iput-boolean v1, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaRadioGroup;->b(I)V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x6
        :pswitch_11
    .end packed-switch
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Loy;

    invoke-virtual {p0}, Loy;->b()V

    invoke-virtual {p0, p1}, Loy;->g(Ljava/lang/String;)V

    return-void
.end method
