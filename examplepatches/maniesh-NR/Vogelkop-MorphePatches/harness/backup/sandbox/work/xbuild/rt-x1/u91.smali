.class public final Lu91;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final b:Lu91;

.field public static final c:Lu91;

.field public static final d:Lu91;

.field public static final e:Lu91;

.field public static final f:Lu91;

.field public static final g:Lu91;

.field public static final h:Lu91;

.field public static final i:Lu91;

.field public static final j:Lu91;

.field public static final k:Lu91;

.field public static final l:Lu91;

.field public static final m:Lu91;

.field public static final n:Lu91;

.field public static final o:Lu91;

.field public static final p:Lu91;

.field public static final q:Lu91;

.field public static final r:Lu91;

.field public static final s:Lu91;

.field public static final t:Lu91;

.field public static final u:Lu91;

.field public static final v:Lu91;


# instance fields
.field public final synthetic a:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lu91;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->b:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->c:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->d:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->e:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->f:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->g:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->h:Lu91;

    new-instance v0, Lu91;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->i:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->j:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->k:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->l:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->m:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->n:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->o:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->p:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->q:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->r:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->s:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->t:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->u:Lu91;

    new-instance v0, Lu91;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lu91;-><init>(B)V

    sput-object v0, Lu91;->v:Lu91;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lu91;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte p0, p0, Lu91;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_fc

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_34

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    invoke-interface {p1, p0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    :cond_17
    invoke-interface {p0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-interface {p0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li7i;

    instance-of v2, v2, Lz6i;

    if-eqz v2, :cond_17

    move-object v2, p1

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/util/ListIterator;->nextIndex()I

    move-result p0

    add-int/2addr p0, v0

    invoke-static {v2, p0}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p0

    goto :goto_36

    :cond_34
    sget-object p0, Ll08;->a:Ll08;

    :goto_36
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3d

    move-object v1, p0

    :cond_3d
    if-nez v1, :cond_45

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v1

    :cond_45
    return-object v1

    :pswitch_46
    instance-of p0, p1, Lax7;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_4d
    instance-of p0, p1, Lax7;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_54
    instance-of p0, p1, Lax7;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_5b
    instance-of p0, p1, Lax7;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_62
    instance-of p0, p1, Lcom/opera/android/custom_views/StylingImageRadio;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_69
    check-cast p1, Lbza;

    return-object v1

    :pswitch_6c
    check-cast p1, Ljava/lang/Throwable;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_71
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_81

    sget-wide p0, Lu95;->g:J

    new-instance v0, Lu95;

    invoke-direct {v0, p0, p1}, Lu95;-><init>(J)V

    goto :goto_90

    :cond_81
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p0}, Lcs5;->c(I)J

    move-result-wide p0

    new-instance v0, Lu95;

    invoke-direct {v0, p0, p1}, Lu95;-><init>(J)V

    :goto_90
    return-object v0

    :pswitch_91
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    if-le p0, v0, :cond_9a

    move-object v1, p1

    :cond_9a
    if-eqz v1, :cond_a3

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->H(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_a3

    move-object p1, p0

    :cond_a3
    return-object p1

    :pswitch_a4
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    return-object v1

    :pswitch_aa
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    return-object v1

    :pswitch_b0
    check-cast p1, Ljava/lang/String;

    new-instance p0, Le8a;

    invoke-direct {p0, p1}, Le8a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_b8
    check-cast p1, Ljava/lang/String;

    new-instance p0, Ld8a;

    invoke-direct {p0, p1}, Ld8a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_c0
    check-cast p1, Ljava/lang/String;

    new-instance p0, Lc8a;

    invoke-direct {p0, p1}, Lc8a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_c8
    check-cast p1, Ljava/lang/String;

    new-instance p0, Lb8a;

    invoke-direct {p0, p1}, Lb8a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_d0
    check-cast p1, Ljava/lang/String;

    new-instance p0, La8a;

    invoke-direct {p0, p1}, La8a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_d8
    check-cast p1, Ljava/lang/String;

    new-instance p0, Lz7a;

    invoke-direct {p0, p1}, Lz7a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_e0
    check-cast p1, Ljava/lang/String;

    new-instance p0, Lu7a;

    invoke-direct {p0, p1}, Lu7a;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_e8
    check-cast p1, Lafd;

    iget-object p0, p1, Lafd;->a:[F

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ef
    check-cast p1, Lafd;

    iget-object p0, p1, Lafd;->a:[F

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f6
    check-cast p1, Lp1d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_fc
    .packed-switch 0x0
        :pswitch_f6
        :pswitch_ef
        :pswitch_e8
        :pswitch_e0
        :pswitch_d8
        :pswitch_d0
        :pswitch_c8
        :pswitch_c0
        :pswitch_b8
        :pswitch_b0
        :pswitch_aa
        :pswitch_a4
        :pswitch_91
        :pswitch_71
        :pswitch_6c
        :pswitch_69
        :pswitch_62
        :pswitch_5b
        :pswitch_54
        :pswitch_4d
        :pswitch_46
    .end packed-switch
.end method
