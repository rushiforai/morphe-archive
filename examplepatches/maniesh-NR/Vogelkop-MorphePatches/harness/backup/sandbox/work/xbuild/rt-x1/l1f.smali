.class public final Ll1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Landroid/app/Notification;

.field public B:Landroid/widget/RemoteViews;

.field public C:Landroid/widget/RemoteViews;

.field public D:Ljava/lang/String;

.field public E:Z

.field public final F:Z

.field public final G:Landroid/app/Notification;

.field public H:Landroid/graphics/drawable/Icon;

.field public final I:Ljava/util/ArrayList;

.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/ArrayList;

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/CharSequence;

.field public g:Landroid/app/PendingIntent;

.field public h:Landroidx/core/graphics/drawable/IconCompat;

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Ln1f;

.field public n:Ljava/lang/CharSequence;

.field public o:I

.field public p:I

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:Landroid/os/Bundle;

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll1f;->b:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll1f;->c:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll1f;->d:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll1f;->k:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Ll1f;->t:Z

    iput v1, p0, Ll1f;->y:I

    iput v1, p0, Ll1f;->z:I

    iput-boolean v1, p0, Ll1f;->E:Z

    new-instance v2, Landroid/app/Notification;

    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    iput-object v2, p0, Ll1f;->G:Landroid/app/Notification;

    iput-object p1, p0, Ll1f;->a:Landroid/content/Context;

    iput-object p2, p0, Ll1f;->D:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, v2, Landroid/app/Notification;->when:J

    const/4 p1, -0x1

    iput p1, v2, Landroid/app/Notification;->audioStreamType:I

    iput v1, p0, Ll1f;->j:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll1f;->I:Ljava/util/ArrayList;

    iput-boolean v0, p0, Ll1f;->F:Z

    return-void
.end method

.method public static c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 3

    if-nez p0, :cond_3

    return-object p0

    :cond_3
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x1400

    if-le v0, v1, :cond_10

    const/4 v0, 0x0

    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    :cond_10
    return-object p0
.end method


# virtual methods
.method public final a(ILjava/lang/String;Landroid/app/PendingIntent;)V
    .registers 5

    new-instance v0, Ld1f;

    invoke-direct {v0, p1, p2, p3}, Ld1f;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    iget-object p0, p0, Ll1f;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()Landroid/app/Notification;
    .registers 5

    new-instance v0, Ls9i;

    invoke-direct {v0, p0}, Ls9i;-><init>(Ll1f;)V

    iget-object p0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ll1f;

    iget-object v1, p0, Ll1f;->m:Ln1f;

    if-eqz v1, :cond_10

    invoke-virtual {v1, v0}, Ln1f;->a(Ls9i;)V

    :cond_10
    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget-object v2, p0, Ll1f;->B:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_1e

    iput-object v2, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    :cond_1e
    if-eqz v1, :cond_4e

    iget-object p0, p0, Ll1f;->m:Ln1f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Landroidx/core/app/NotificationCompat;->getExtras(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_4e

    iget-boolean v2, v1, Ln1f;->a:Z

    if-eqz v2, :cond_38

    iget-object v2, v1, Ln1f;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, "android.summaryText"

    invoke-virtual {p0, v3, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_38
    iget-object v2, v1, Ln1f;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_43

    const-string v3, "android.title.big"

    invoke-virtual {p0, v3, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_43
    invoke-virtual {v1}, Ln1f;->b()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4e

    const-string v2, "androidx.core.app.extra.COMPAT_TEMPLATE"

    invoke-virtual {p0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4e
    return-object v0
.end method

.method public final d(Z)V
    .registers 3

    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Ll1f;->h(IZ)V

    return-void
.end method

.method public final e(Ljava/lang/CharSequence;)V
    .registers 2

    invoke-static {p1}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Ll1f;->f:Ljava/lang/CharSequence;

    return-void
.end method

.method public final f(Ljava/lang/CharSequence;)V
    .registers 2

    invoke-static {p1}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Ll1f;->e:Ljava/lang/CharSequence;

    return-void
.end method

.method public final g(I)V
    .registers 2

    iget-object p0, p0, Ll1f;->G:Landroid/app/Notification;

    iput p1, p0, Landroid/app/Notification;->defaults:I

    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_e

    iget p1, p0, Landroid/app/Notification;->flags:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/app/Notification;->flags:I

    :cond_e
    return-void
.end method

.method public final h(IZ)V
    .registers 3

    iget-object p0, p0, Ll1f;->G:Landroid/app/Notification;

    if-eqz p2, :cond_a

    iget p2, p0, Landroid/app/Notification;->flags:I

    or-int/2addr p2, p1

    iput p2, p0, Landroid/app/Notification;->flags:I

    return-void

    :cond_a
    iget p2, p0, Landroid/app/Notification;->flags:I

    not-int p1, p1

    and-int/2addr p2, p1

    iput p2, p0, Landroid/app/Notification;->flags:I

    return-void
.end method

.method public final i(Landroid/graphics/Bitmap;)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_e

    :cond_4
    iget-object v0, p0, Ll1f;->a:Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/core/app/NotificationCompat;->reduceLargeIconSize(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p1

    :goto_e
    iput-object p1, p0, Ll1f;->h:Landroidx/core/graphics/drawable/IconCompat;

    return-void
.end method

.method public final j(Ln1f;)V
    .registers 3

    iget-object v0, p0, Ll1f;->m:Ln1f;

    if-eq v0, p1, :cond_11

    iput-object p1, p0, Ll1f;->m:Ln1f;

    iget-object v0, p1, Ln1f;->b:Ljava/lang/Object;

    check-cast v0, Ll1f;

    if-eq v0, p0, :cond_11

    iput-object p0, p1, Ln1f;->b:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Ll1f;->j(Ln1f;)V

    :cond_11
    return-void
.end method
