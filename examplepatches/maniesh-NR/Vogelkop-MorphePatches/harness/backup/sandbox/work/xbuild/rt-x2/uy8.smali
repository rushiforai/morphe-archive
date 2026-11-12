.class public final Luy8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final A:Ljava/util/Set;

.field public final B:Ljava/util/Set;

.field public final C:Ljava/util/Set;

.field public final D:Ljava/util/Set;

.field public final E:Ljava/util/Set;

.field public final F:Ljava/util/Set;

.field public final G:Ljava/util/Set;

.field public final H:Lk5o;

.field private final I:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public final J:Landroid/content/Context;

.field public final K:Ly0f;

.field public final L:Lcom/opera/android/settings/SettingsManager;

.field public a:Lqtm;

.field public final b:Ls9i;

.field public final c:Ljava/util/HashSet;

.field public final d:Ljec;

.field public final e:Ljec;

.field public final f:Ljec;

.field public final g:Lue2;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:Ljava/util/Map;

.field public final n:Lb59;

.field public final o:Lqy8;

.field public final p:Lqy8;

.field public final q:Ljava/util/Set;

.field public final r:Ljava/util/Set;

.field public final s:Ljava/util/Set;

.field public final t:Ljava/util/Set;

.field public final u:Ljava/util/Set;

.field public final v:Ljava/util/Set;

.field public final w:Ljava/util/Set;

.field public final x:Ljava/util/Set;

.field public final y:Ljava/util/Set;

.field public final z:Ljava/util/Set;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lstm;Ls9i;Lcom/opera/android/settings/SettingsManager;Ly0f;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Luy8;->c:Ljava/util/HashSet;

    new-instance v2, Lue2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    const/4 v4, 0x4

    invoke-direct {v2, p0, v3, v4}, Lue2;-><init>(Ljava/lang/Object;Landroid/os/Looper;B)V

    iput-object v2, p0, Luy8;->g:Lue2;

    const/16 v7, 0x1f4

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->q:Ljava/util/Set;

    const/16 v2, 0xc8

    invoke-static {v2}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Luy8;->r:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Luy8;->s:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Luy8;->t:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Luy8;->u:Ljava/util/Set;

    invoke-static {v2}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->v:Ljava/util/Set;

    const/16 v2, 0xbb8

    invoke-static {v2}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Luy8;->w:Ljava/util/Set;

    invoke-static {v2}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->x:Ljava/util/Set;

    const/16 v8, 0x3e8

    invoke-static {v8}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->y:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->z:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->A:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->B:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->C:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->D:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->E:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->F:Ljava/util/Set;

    invoke-static {v7}, Luy8;->f(I)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Luy8;->G:Ljava/util/Set;

    new-instance v2, Lk5o;

    invoke-direct {v2, v4}, Lk5o;-><init>(B)V

    iput-object v2, p0, Luy8;->H:Lk5o;

    sget-object v2, Lvml;->d:Lumi;

    const/4 v9, 0x0

    new-array v3, v9, [Lbg1;

    const-string v4, "newsfeed_feedback_tracker"

    invoke-static {p1, v2, v4, v3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v2

    iput-object v2, p0, Luy8;->n:Lb59;

    iput-object p1, p0, Luy8;->J:Landroid/content/Context;

    new-instance v0, Lqy8;

    const-wide/32 v4, 0xea60

    const/4 v6, 0x1

    const-string v2, "EVENTS"

    const/4 v3, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lqy8;-><init>(Luy8;Ljava/lang/String;IJZ)V

    iput-object v0, p0, Luy8;->o:Lqy8;

    new-instance v0, Lqy8;

    const-wide/32 v4, 0x36ee80

    const/4 v6, 0x0

    const-string v2, "INFO"

    const/4 v3, 0x2

    invoke-direct/range {v0 .. v6}, Lqy8;-><init>(Luy8;Ljava/lang/String;IJZ)V

    iput-object v0, p0, Luy8;->p:Lqy8;

    new-instance v0, Lwx8;

    invoke-direct {v0, p0, p2}, Lwx8;-><init>(Luy8;Lstm;)V

    iput-object v0, p0, Luy8;->I:Lq8j;

    invoke-virtual {p2, v0}, Lt7j;->b(Lq8j;)V

    iput-object p4, p0, Luy8;->L:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Luy8;->b:Ls9i;

    new-instance v0, Ljec;

    invoke-direct {v0, v8}, Ljec;-><init>(I)V

    iput-object v0, p0, Luy8;->d:Ljec;

    new-instance v0, Ljec;

    invoke-direct {v0, v7}, Ljec;-><init>(I)V

    iput-object v0, p0, Luy8;->e:Ljec;

    new-instance v0, Ljec;

    invoke-direct {v0, v7}, Ljec;-><init>(I)V

    iput-object v0, p0, Luy8;->f:Ljec;

    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Luy8;->m:Ljava/util/Map;

    move-object v0, p5

    iput-object v0, p0, Luy8;->K:Ly0f;

    new-instance v0, Liy8;

    invoke-direct {v0, p0, v9}, Liy8;-><init>(Ljava/lang/Object;B)V

    new-array v1, v9, [Ljava/lang/Void;

    invoke-static {v0, v1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic a(Luy8;)Lq8j;
    .registers 1

    iget-object p0, p0, Luy8;->I:Lq8j;

    return-object p0
.end method

.method public static f(I)Ljava/util/Set;
    .registers 2

    new-instance v0, Lxx8;

    invoke-direct {v0, p0}, Lxx8;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljec;Lmsh;)V
    .registers 7

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_19

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p0, v0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    :cond_19
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_21
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldy8;

    instance-of v3, v2, Ley8;

    if-eqz v3, :cond_21

    check-cast v2, Ley8;

    iget-object v3, p1, Lmsh;->v:Lp12;

    iget-object v3, v3, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v2, Lzx8;->d:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_21

    iget-wide p0, v2, Ley8;->n:D

    const-wide/16 v3, 0x0

    cmpg-double p0, p0, v3

    if-gez p0, :cond_5b

    iget-wide p0, v2, Ley8;->m:J

    const-wide/16 v3, 0x0

    cmp-long v3, p0, v3

    if-ltz v3, :cond_5b

    sub-long/2addr v0, p0

    long-to-double p0, v0

    const-wide v0, 0x408f400000000000L    # 1000.0

    div-double/2addr p0, v0

    iput-wide p0, v2, Ley8;->n:D

    :cond_5b
    return-void
.end method


# virtual methods
.method public final b(Ljava/util/List;)V
    .registers 7

    iget-boolean v0, p0, Luy8;->j:Z

    if-eqz v0, :cond_59

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8
    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loqe;

    instance-of v1, v0, Lmsh;

    iget-object v2, p0, Luy8;->y:Ljava/util/Set;

    iget-object v3, p0, Luy8;->H:Lk5o;

    if-eqz v1, :cond_2e

    check-cast v0, Lmsh;

    iget-object v1, v0, Lmsh;->v:Lp12;

    iget-object v1, v1, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {v3, v0}, Lk5o;->d(Loqe;)V

    goto :goto_8

    :cond_2e
    instance-of v1, v0, Lere;

    if-eqz v1, :cond_8

    check-cast v0, Lere;

    invoke-virtual {v3, v0}, Lk5o;->d(Loqe;)V

    iget-object v0, v0, Lere;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3d
    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmsh;

    iget-object v4, v1, Lmsh;->v:Lp12;

    iget-object v4, v4, Lp12;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3d

    invoke-virtual {v3, v1}, Lk5o;->d(Loqe;)V

    goto :goto_3d

    :cond_59
    return-void
.end method

.method public final c(Ldy8;)V
    .registers 3

    iget-object v0, p0, Luy8;->d:Ljec;

    invoke-virtual {p0, v0, p1}, Luy8;->d(Ljec;Ldy8;)V

    return-void
.end method

.method public final d(Ljec;Ldy8;)V
    .registers 5

    invoke-virtual {p1, p2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Luy8;->n()V

    iget-object p1, p0, Luy8;->d:Ljec;

    iget-object p1, p1, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object p2, p0, Luy8;->e:Ljec;

    iget-object p2, p2, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/2addr p2, p1

    iget-object p1, p0, Luy8;->f:Ljec;

    iget-object p1, p1, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/2addr p1, p2

    iget-object p2, p0, Luy8;->n:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    const-string v0, "FEEDBACK_TRACKER_ARTICLES_CLICKED"

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    const/16 v0, 0xf

    if-ge p2, v0, :cond_35

    const/4 p2, 0x5

    goto :goto_37

    :cond_35
    const/16 p2, 0x19

    :goto_37
    if-lt p1, p2, :cond_3f

    iget-object p0, p0, Luy8;->o:Lqy8;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lqy8;->c(Z)V

    :cond_3f
    return-void
.end method

.method public final e(Lzx8;)V
    .registers 3

    iget-object v0, p0, Luy8;->e:Ljec;

    invoke-virtual {p0, v0, p1}, Luy8;->d(Ljec;Ldy8;)V

    return-void
.end method

.method public final g(Lmsh;)V
    .registers 6

    iget-object v0, p1, Lmsh;->v:Lp12;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Luy8;->v:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->u:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->t:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->q:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->s:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->r:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->z:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->A:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->B:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->C:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->D:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    instance-of v1, p1, Lfre;

    if-eqz v1, :cond_53

    check-cast p1, Lfre;

    iget-object p1, p1, Lfre;->D:Ljb8;

    iget-object v1, p0, Luy8;->F:Ljava/util/Set;

    iget-object v2, p1, Ljb8;->k:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Luy8;->G:Ljava/util/Set;

    iget-object p1, p1, Ljb8;->k:Ljava/lang/String;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_53
    iget-object p1, p0, Luy8;->E:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Luy8;->x:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Luy8;->y:Ljava/util/Set;

    iget-object v3, p0, Luy8;->w:Ljava/util/Set;

    if-eqz v1, :cond_6e

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6e

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_6e
    invoke-interface {v3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    iget-object p0, p0, Luy8;->H:Lk5o;

    invoke-virtual {p0, v0, v1}, Lk5o;->r(Ljava/lang/String;Z)V

    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final h(ILmsh;)V
    .registers 10

    iget-object v0, p2, Lmsh;->v:Lp12;

    iget-object v1, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Luy8;->q:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    iget-object v3, p0, Luy8;->K:Ly0f;

    if-eqz v0, :cond_43

    iget-object v0, p0, Luy8;->n:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "FEEDBACK_TRACKER_ARTICLES_CLICKED"

    const/4 v6, 0x0

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    add-int/2addr v0, v2

    invoke-interface {v4, v5, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v3, p2}, Ly0f;->a(Lmsh;)V

    iget-object v0, p0, Luy8;->L:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v0

    if-eqz v0, :cond_43

    new-instance v0, Lby8;

    invoke-direct {v0, p2, v6}, Lby8;-><init>(Lmsh;B)V

    invoke-virtual {p0, v0}, Luy8;->c(Ldy8;)V

    :cond_43
    if-eq p1, v2, :cond_6d

    const/4 p2, 0x2

    if-ne p1, p2, :cond_90

    iget-object p0, p0, Luy8;->D:Ljava/util/Set;

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_90

    iget-object p0, v3, Ly0f;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_90

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-virtual {p2, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p1

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljf0;->e(I)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_6d
    iget-object p0, p0, Luy8;->B:Ljava/util/Set;

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_90

    iget-object p0, v3, Ly0f;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_90

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-virtual {p2, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->e(I)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_90
    return-void
.end method

.method public final j(Loqe;I)V
    .registers 14

    instance-of v0, p1, Lmsh;

    iget-object v1, p0, Luy8;->H:Lk5o;

    const/4 v2, 0x1

    if-eqz v0, :cond_22

    move-object v3, p1

    check-cast v3, Lmsh;

    iget-object v1, v1, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v3, v3, Lmsh;->v:Lp12;

    iget-object v3, v3, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh92;

    if-eqz v1, :cond_40

    iget-object v1, v1, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_40

    :cond_22
    instance-of v3, p1, Lere;

    if-eqz v3, :cond_3d

    move-object v3, p1

    check-cast v3, Lere;

    iget-object v1, v1, Lk5o;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v3, v3, Lere;->e:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li92;

    if-eqz v1, :cond_40

    iget-object v1, v1, Li92;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_40

    :cond_3d
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_40
    :goto_40
    if-eqz v0, :cond_101

    move-object v0, p1

    check-cast v0, Lmsh;

    iget-object v1, v0, Lmsh;->v:Lp12;

    iget-object v1, v1, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Luy8;->x:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Luy8;->K:Ly0f;

    if-eqz v3, :cond_b4

    iget-object v3, v4, Ly0f;->a:Lx5f;

    iget-object v5, v3, Lx5f;->d:Lzpa;

    iget-boolean v6, v3, Lx5f;->h:Z

    if-eqz v6, :cond_6f

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v7

    invoke-virtual {v7, v5}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljf0;->e(I)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    :cond_6f
    iget-object v6, v0, Lmsh;->B:Lnb8;

    if-eqz v6, :cond_90

    iget-object v6, v6, Lnb8;->i:Ljava/lang/String;

    iget-boolean v7, v3, Lx5f;->h:Z

    if-eqz v7, :cond_90

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    new-instance v8, Lck0;

    invoke-direct {v8, v5, v7}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v5, Lj5f;

    sget-object v9, Lod0;->b:Lod0;

    const/4 v10, 0x4

    invoke-direct {v5, v6, v9, v10}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v8, v5}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v3, v7}, Lx5f;->U0(Lx56;)V

    :cond_90
    instance-of v3, p1, Ldre;

    if-eqz v3, :cond_9f

    new-instance p1, Ley8;

    invoke-direct {p1, v0}, Ley8;-><init>(Lmsh;)V

    iget-object v0, p0, Luy8;->f:Ljec;

    invoke-virtual {p0, v0, p1}, Luy8;->d(Ljec;Ldy8;)V

    goto :goto_b4

    :cond_9f
    instance-of p1, p1, Lure;

    if-eqz p1, :cond_ac

    new-instance p1, Ley8;

    invoke-direct {p1, v0}, Ley8;-><init>(Lmsh;)V

    invoke-virtual {p0, p1}, Luy8;->e(Lzx8;)V

    goto :goto_b4

    :cond_ac
    new-instance p1, Ley8;

    invoke-direct {p1, v0}, Ley8;-><init>(Lmsh;)V

    invoke-virtual {p0, p1}, Luy8;->c(Ldy8;)V

    :cond_b4
    :goto_b4
    if-eq p2, v2, :cond_de

    const/4 p1, 0x2

    if-ne p2, p1, :cond_101

    iget-object p0, p0, Luy8;->E:Ljava/util/Set;

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_101

    iget-object p0, v4, Ly0f;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_101

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-virtual {p2, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p1

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljf0;->e(I)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_de
    iget-object p0, p0, Luy8;->C:Ljava/util/Set;

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_101

    iget-object p0, v4, Ly0f;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_101

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-virtual {p2, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p1

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljf0;->e(I)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_101
    return-void
.end method

.method public final k(Lmsh;Ljava/util/List;Z)V
    .registers 6

    if-eqz p3, :cond_5

    const/16 p3, 0xb

    goto :goto_7

    :cond_5
    const/16 p3, 0xa

    :goto_7
    iget-object v0, p1, Lmsh;->v:Lp12;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Luy8;->A:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    instance-of v0, p1, Lure;

    invoke-static {p3}, Lo18;->g(I)Ljava/lang/String;

    move-result-object p3

    const/4 v1, 0x1

    if-eqz v0, :cond_27

    new-instance v0, Lfy8;

    invoke-direct {v0, p1, p2, p3, v1}, Lfy8;-><init>(Lmsh;Ljava/util/List;Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Luy8;->e(Lzx8;)V

    goto :goto_2f

    :cond_27
    new-instance v0, Lfy8;

    invoke-direct {v0, p1, p2, p3, v1}, Lfy8;-><init>(Lmsh;Ljava/util/List;Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Luy8;->c(Ldy8;)V

    :goto_2f
    iget-object p0, p0, Luy8;->o:Lqy8;

    invoke-virtual {p0, v1}, Lqy8;->c(Z)V

    :cond_34
    return-void
.end method

.method public final l(ILjava/lang/String;)V
    .registers 6

    new-instance v0, Lsy8;

    new-instance v1, Ljava/lang/StringBuilder;

    if-eqz p1, :cond_15

    const/4 v2, 0x1

    if-eq p1, v2, :cond_12

    const/4 v2, 0x2

    if-eq p1, v2, :cond_f

    const-string p1, ""

    goto :goto_17

    :cond_f
    const-string p1, "audio_slide_roundup:"

    goto :goto_17

    :cond_12
    const-string p1, "roundup_slide_roundup:"

    goto :goto_17

    :cond_15
    const-string p1, "roundup:"

    :goto_17
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    const-string v1, "podcast_card"

    invoke-direct {v0, v1, p1, p2}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Luy8;->c(Ldy8;)V

    return-void
.end method

.method public final m(ILjava/lang/String;)V
    .registers 7

    new-instance v0, Lsy8;

    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    if-eqz p1, :cond_15

    if-eq p1, v2, :cond_12

    const/4 v3, 0x2

    if-eq p1, v3, :cond_f

    const-string p1, ""

    goto :goto_17

    :cond_f
    const-string p1, "audio_slide_roundup:"

    goto :goto_17

    :cond_12
    const-string p1, "roundup_slide_roundup:"

    goto :goto_17

    :cond_15
    const-string p1, "roundup:"

    :goto_17
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "podcast_card"

    invoke-direct {v0, p2, p1, v2}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Luy8;->c(Ldy8;)V

    return-void
.end method

.method public final n()V
    .registers 5

    iget-boolean v0, p0, Luy8;->j:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget v0, p0, Luy8;->l:I

    if-nez v0, :cond_11

    const/4 v0, 0x3

    const-wide/16 v1, 0x1388

    iget-object v3, p0, Luy8;->g:Lue2;

    invoke-virtual {v3, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_11
    iget v0, p0, Luy8;->l:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Luy8;->l:I

    return-void
.end method
