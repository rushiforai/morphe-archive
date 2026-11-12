.class public final Lb0e;
.super Ldt1;
.source "SourceFile"


# static fields
.field public static final n:Lnv6;


# instance fields
.field public final e:Lpde;

.field public final f:Lk6l;

.field public final g:Lpde;

.field public final h:Lg0e;

.field public final i:Lyqa;

.field public final j:Li0e;

.field public final k:Lrn9;

.field public final l:Ltsd;

.field public m:Lx77;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnv6;

    new-instance v1, Luvc;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Luvc;-><init>(B)V

    invoke-direct {v0, v1}, Lnv6;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lb0e;->n:Lnv6;

    return-void
.end method

.method public constructor <init>(Lpde;Lk6l;Lu4l;Lpde;Lv8a;Ls9i;Lpde;Lyhe;Lpde;Lg0e;Lyqa;Li0e;)V
    .registers 28

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v0, p12

    invoke-direct {p0}, Ldt1;-><init>()V

    iput-object v8, p0, Lb0e;->e:Lpde;

    iput-object v9, p0, Lb0e;->f:Lk6l;

    move-object/from16 v2, p7

    iput-object v2, p0, Lb0e;->g:Lpde;

    move-object/from16 v2, p10

    iput-object v2, p0, Lb0e;->h:Lg0e;

    move-object/from16 v2, p11

    iput-object v2, p0, Lb0e;->i:Lyqa;

    iput-object v0, p0, Lb0e;->j:Li0e;

    new-instance v2, Lrn9;

    invoke-direct {v2, p0}, Lrn9;-><init>(Lb0e;)V

    iput-object v2, p0, Lb0e;->k:Lrn9;

    iget-object v0, v0, Li0e;->a:Lrgh;

    iget-object v0, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lp9l;

    iget-object v0, v0, La21;->m:Ljava/lang/Object;

    check-cast v0, Lpde;

    new-instance v2, Lnf8;

    const/16 v3, 0xf

    invoke-direct {v2, v3}, Lnf8;-><init>(B)V

    const/4 v3, 0x0

    move-object/from16 v4, p4

    invoke-static {v3, v4, v0, v2}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object v0

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v10

    iput-object v10, p0, Lb0e;->l:Ltsd;

    new-instance v0, Lx77;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {v0, v2}, Lx77;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lb0e;->m:Lx77;

    new-instance v11, La0e;

    invoke-direct {v11, p0}, La0e;-><init>(Lb0e;)V

    new-instance v12, Lqz;

    const/16 v0, 0xc

    invoke-direct {v12, p0, v0}, Lqz;-><init>(Ljava/lang/Object;B)V

    const/4 v13, 0x1

    invoke-virtual {p0, v13}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v0, Lws1;

    const/16 v5, 0xa

    move-object v1, p0

    move-object/from16 v4, p6

    move-object/from16 v2, p8

    move-object/from16 v3, p9

    invoke-direct/range {v0 .. v5}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lrqd;

    const/4 v14, 0x4

    invoke-direct {v2, v14}, Lrqd;-><init>(B)V

    new-instance v3, La3j;

    invoke-direct {v3, v14}, La3j;-><init>(B)V

    const-class v4, Lzzd;

    invoke-virtual {p0, v4, v0, v2, v3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v0, Lvw1;

    const/4 v7, 0x3

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v6, p6

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    invoke-direct/range {v0 .. v7}, Lvw1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lrqd;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Lrqd;-><init>(B)V

    new-instance v3, La3j;

    invoke-direct {v3, v14}, La3j;-><init>(B)V

    const-class v4, Lyzd;

    invoke-virtual {p0, v4, v0, v2, v3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v0, Luzd;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Luzd;-><init>(Lb0e;B)V

    invoke-static {v9, v8, v11, v0}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v0, v9, Lk6l;->s:Lg6l;

    new-instance v2, Luzd;

    invoke-direct {v2, p0, v13}, Luzd;-><init>(Lb0e;B)V

    invoke-static {v0, v8, v12, v2}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v0, Ld8d;

    const/4 v2, 0x6

    invoke-direct {v0, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {v10, v8, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvzd;

    invoke-interface {p0}, Lvzd;->getId()J

    move-result-wide p0

    return-wide p0
.end method
