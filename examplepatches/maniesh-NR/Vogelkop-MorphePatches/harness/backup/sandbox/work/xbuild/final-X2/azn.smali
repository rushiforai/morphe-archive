.class public final Lazn;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Lpke;
.implements Lp5j;


# instance fields
.field public final a:Lqke;

.field public final b:Lxnh;

.field public final c:Lox3;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Lk6l;

.field public final f:Lnw3;

.field public final g:Lgeb;

.field public h:Z


# direct methods
.method public constructor <init>(Lqke;Lcom/opera/android/settings/SettingsManager;Lxnh;Lox3;Lk6l;Lnw3;Lgeb;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lazn;->a:Lqke;

    iput-object p2, p0, Lazn;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lazn;->b:Lxnh;

    iput-object p4, p0, Lazn;->c:Lox3;

    iput-object p5, p0, Lazn;->e:Lk6l;

    iput-object p6, p0, Lazn;->f:Lnw3;

    iput-object p7, p0, Lazn;->g:Lgeb;

    const-string p3, "collect_website_categories"

    invoke-virtual {p2, p3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    iput-boolean p3, p0, Lazn;->h:Z

    invoke-virtual {p5, p0}, Lk6l;->b(La2l;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p1, p0}, Lqke;->W(Lpke;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "collect_website_categories"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lazn;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lazn;->h:Z

    :cond_10
    return-void
.end method

.method public final W(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    iget-object p0, p0, Lazn;->b:Lxnh;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/high16 v0, 0x400000

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-eqz p0, :cond_11

    return-object p1

    :cond_11
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lhyg;->m(Ljava/lang/String;)Lehc;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p1

    :cond_1f
    :goto_1f
    move-object v0, p1

    check-cast v0, Lmea;

    invoke-virtual {v0}, Lmea;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_45

    invoke-virtual {v0}, Lmea;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x64

    if-lt v0, v1, :cond_1f

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_41

    const/16 v1, 0x3b

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_41
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1f

    :cond_45
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ld7l;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    iget-boolean v0, p0, Lazn;->h:Z

    if-eqz v0, :cond_107

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-nez v0, :cond_107

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c0()Z

    move-result v0

    if-nez v0, :cond_107

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->r()Z

    move-result v0

    if-nez v0, :cond_107

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result v0

    if-nez v0, :cond_107

    iget-object v0, p0, Lazn;->f:Lnw3;

    iget-object v0, v0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    iget-object v0, v0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->a()Z

    move-result v0

    if-nez v0, :cond_107

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lwqm;->F(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_107

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LJ/N;->MfdpAXw7(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v0, "unavailable"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_107

    const-string v0, "uncategorized"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_107

    filled-new-array {p2, p3, p4, p5}, [Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    move p4, p3

    :goto_5f
    const/4 p5, 0x4

    if-ge p4, p5, :cond_78

    aget-object p5, p2, p4

    invoke-virtual {p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_75

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p5, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    goto :goto_7a

    :cond_75
    add-int/lit8 p4, p4, 0x1

    goto :goto_5f

    :cond_78
    const-string p2, ""

    :goto_7a
    iget-object p4, p0, Lazn;->g:Lgeb;

    invoke-virtual {p4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lfeb;

    iget-object p5, p4, Lfeb;->b:Ljava/util/Set;

    check-cast p5, Ljava/util/Set;

    if-eqz p5, :cond_9f

    invoke-interface {p5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p5

    :cond_8c
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9f

    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8c

    goto :goto_f0

    :cond_9f
    invoke-static {p1}, Lhyg;->m(Ljava/lang/String;)Lehc;

    move-result-object p5

    invoke-virtual {p5, p3}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p3

    :cond_a7
    move-object p5, p3

    check-cast p5, Lmea;

    invoke-virtual {p5}, Lmea;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_107

    invoke-virtual {p5}, Lmea;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p5

    const/16 v0, 0x64

    if-ge p5, v0, :cond_ce

    iget-object v0, p0, Lazn;->b:Lxnh;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    const/high16 v2, 0x400000

    invoke-virtual {v0, v2}, Lwnh;->b(I)Z

    move-result v0

    if-eqz v0, :cond_a7

    :cond_ce
    iget-object v0, p4, Lfeb;->a:Landroid/util/SparseArray;

    invoke-virtual {v0, p5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/util/Set;

    check-cast p5, Ljava/util/Set;

    if-eqz p5, :cond_a7

    invoke-interface {p5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p5

    :cond_de
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a7

    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_de

    :goto_f0
    iget-object p2, p0, Lazn;->c:Lox3;

    invoke-virtual {p2}, Lox3;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Losf;

    invoke-virtual {p0, p1}, Lazn;->W(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lu5f;

    invoke-direct {p1, p0, v1}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p2, p1}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_107
    return-void
.end method

.method public final w(Lb2l;Loke;JZ)V
    .registers 6

    if-eqz p5, :cond_50

    iget-boolean p2, p2, Loke;->d:Z

    if-nez p2, :cond_50

    iget-boolean p2, p0, Lazn;->h:Z

    if-eqz p2, :cond_50

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LJ/N;->MfdpAXw7(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string p2, "unavailable"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x2

    iget-object p4, p0, Lazn;->c:Lox3;

    if-nez p2, :cond_3f

    const-string p2, "uncategorized"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3f

    invoke-virtual {p4}, Lox3;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Losf;

    invoke-virtual {p0, p1}, Lazn;->W(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lu5f;

    invoke-direct {p1, p0, p3}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p2, p1}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_3f
    invoke-virtual {p4}, Lox3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Losf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lu5f;

    invoke-direct {p2, p1, p3}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p0, p2}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_50
    return-void
.end method
