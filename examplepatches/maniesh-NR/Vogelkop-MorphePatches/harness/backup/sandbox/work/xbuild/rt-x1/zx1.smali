.class public final synthetic Lzx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lzx1;->a:B

    iput-object p1, p0, Lzx1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 8

    iget-byte v0, p0, Lzx1;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lzx1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a4

    check-cast p0, Lqln;

    check-cast p1, Laln;

    iget-object p0, p0, Lqln;->p:Ly9e;

    iget-object p0, p0, Ly9e;->a:Lz7f;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly7f;

    invoke-static {p0}, Ly9e;->b(Ly7f;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_24
    check-cast p0, Ljava/util/Map;

    check-cast p1, Laln;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk15;

    if-eqz p0, :cond_3a

    invoke-virtual {p0}, Lk15;->a()Z

    move-result p0

    if-eqz p0, :cond_3b

    :cond_3a
    move v1, v2

    :cond_3b
    return v1

    :pswitch_3c
    check-cast p0, Lcom/opera/android/undo/UndoBar;

    iget-object p0, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object p0, p0, Lmgh;->b:Ljava/lang/Object;

    check-cast p0, Lmhk;

    iget-object p0, p0, Lmhk;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedList;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_76

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmkm;

    iget-object v0, v0, Lmkm;->a:Le5d;

    iget-object v0, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :cond_63
    if-ge v4, v3, :cond_4c

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lguh;

    iget-object v5, v5, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_63

    move v1, v2

    :cond_76
    xor-int/2addr v1, v2

    return v1

    :pswitch_78
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_85
    check-cast p0, Luoj;

    check-cast p1, Lloj;

    iget-object p0, p0, Luoj;->t:Llag;

    iget-object p1, p1, Lloj;->b:Llag;

    if-eqz p1, :cond_93

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    :cond_93
    return v2

    :pswitch_94
    check-cast p0, Lx37;

    invoke-virtual {p0, p1}, Lx37;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_a1
    check-cast p0, Lh8d;

    check-cast p1, Lamk;

    iget-object p1, p1, Lamk;->a:Lzsk;

    iget-object p1, p1, Lzsk;->a:Ljava/lang/String;

    iget-object p0, p0, Lh8d;->e:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_b1
    check-cast p0, Lq9a;

    invoke-virtual {p0, p1}, Lq9a;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_be
    check-cast p0, Ljava/lang/CharSequence;

    check-cast p1, Landroid/view/KeyEvent;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result p1

    new-instance v0, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0, p0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0

    :pswitch_d4
    check-cast p0, Ltx0;

    invoke-virtual {p0, p1}, Ltx0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_e1
    check-cast p0, Lhq8;

    check-cast p1, Lhq8;

    invoke-virtual {p1}, Lhq8;->e()J

    move-result-wide v3

    invoke-virtual {p0}, Lhq8;->e()J

    move-result-wide p0

    cmp-long p0, v3, p0

    if-nez p0, :cond_f2

    move v1, v2

    :cond_f2
    return v1

    :pswitch_f3
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_100
    check-cast p0, Lx41;

    invoke-virtual {p0, p1}, Lx41;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_10d
    check-cast p0, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;

    if-eqz p1, :cond_11b

    if-ne p1, p0, :cond_11c

    :cond_11b
    move v1, v2

    :cond_11c
    return v1

    :pswitch_11d
    check-cast p0, Lmr3;

    invoke-virtual {p0, p1}, Lmr3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_12a
    check-cast p0, Lcom/opera/android/BrowserActivity;

    check-cast p1, Ljava/lang/String;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->b:Lll9;

    iget-object p0, p0, Lll9;->g:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_141

    const/4 p0, 0x0

    goto :goto_147

    :cond_141
    invoke-static {v2, p0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lryl;

    :goto_147
    if-eqz p0, :cond_156

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-class p1, Lx65;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_156

    move v1, v2

    :cond_156
    return v1

    :pswitch_157
    check-cast p0, Lal3;

    check-cast p1, Lqhc;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v3

    iget-object p0, p1, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide p0

    cmp-long p0, v3, p0

    if-nez p0, :cond_16a

    move v1, v2

    :cond_16a
    return v1

    :pswitch_16b
    check-cast p0, Ljava/util/ArrayList;

    check-cast p1, Lal3;

    invoke-interface {p0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    new-instance v0, Lzx1;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p0

    return p0

    :pswitch_17e
    check-cast p0, Ltu2;

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_189

    move v1, v2

    :cond_189
    return v1

    :pswitch_18a
    check-cast p0, Ltx0;

    invoke-virtual {p0, p1}, Ltx0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_197
    check-cast p0, Lk51;

    invoke-virtual {p0, p1}, Lk51;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_data_1a4
    .packed-switch 0x0
        :pswitch_197
        :pswitch_18a
        :pswitch_17e
        :pswitch_16b
        :pswitch_157
        :pswitch_12a
        :pswitch_11d
        :pswitch_10d
        :pswitch_100
        :pswitch_f3
        :pswitch_e1
        :pswitch_d4
        :pswitch_be
        :pswitch_b1
        :pswitch_a1
        :pswitch_94
        :pswitch_85
        :pswitch_78
        :pswitch_3c
        :pswitch_24
    .end packed-switch
.end method
