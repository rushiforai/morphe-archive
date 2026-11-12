.class public final Ltw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxv3;
.implements Lex3;


# instance fields
.field public final A:Lzv3;

.field public final A0:Lzv3;

.field public final B:Lzv3;

.field public final B0:Lhw3;

.field public final C:Lhw3;

.field public final C0:Lzv3;

.field public final D:Lhw3;

.field public final D0:Lrw3;

.field public final E:Lhw3;

.field public final E0:Lrw3;

.field public final F:Lhw3;

.field public final F0:Lzv3;

.field public final G:Lhw3;

.field public final G0:Lhw3;

.field public final H:Lhw3;

.field public final H0:Lhw3;

.field public final I:Lhw3;

.field public final J:Lhw3;

.field public final K:Lhw3;

.field public final L:Lhw3;

.field public final M:Lhw3;

.field public final N:Lhw3;

.field public final O:Lhw3;

.field public final P:Lhw3;

.field public final Q:Lhw3;

.field public final R:Lhw3;

.field public final S:Lhw3;

.field public final T:Lhw3;

.field public final U:Lhw3;

.field public final V:Lhw3;

.field public final W:Lhw3;

.field public final X:Lrw3;

.field public final Y:Lrw3;

.field public final Z:Lhw3;

.field public final synthetic a:Lhx3;

.field public final a0:Lzv3;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final b0:Lzv3;

.field public final c:Lumi;

.field public final c0:Lzv3;

.field public final d:Lwjh;

.field public final d0:Lzv3;

.field public final e:Lzv3;

.field public final e0:Lzv3;

.field public final f:Lj4c;

.field public final f0:Lrw3;

.field public final g:Lj4c;

.field public final g0:Lhw3;

.field public final h:Lj4c;

.field public final h0:Lzv3;

.field public final i:Lj4c;

.field public final i0:Lzv3;

.field public final j:Lj4c;

.field public final j0:Lhw3;

.field public final k:Lzv3;

.field public final k0:Lzv3;

.field public final l:Lzv3;

.field public final l0:Lhw3;

.field public final m:Lzv3;

.field public final m0:Lj4c;

.field public final n:Lzv3;

.field public final n0:Lj4c;

.field public final o:Lzv3;

.field public final o0:Lj4c;

.field public final p:Lj4c;

.field public final p0:Lj4c;

.field public final q:Lzv3;

.field public final q0:Lj4c;

.field public final r:Lzv3;

.field public final r0:Lzv3;

.field public final s:Lzv3;

.field public final s0:Lj4c;

.field public final t:Lzv3;

.field public final t0:Lhw3;

.field public final u:Lii;

.field public final u0:Lii;

.field public final v:Lzv3;

.field public final v0:Lhw3;

.field public final w:Lzv3;

.field public final w0:Lj4c;

.field public final x:Lzv3;

.field public final x0:Lj4c;

.field public final y:Lzv3;

.field public final y0:Lzv3;

.field public final z:Lzv3;

.field public final z0:Lj4c;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lwjh;Lhx3;)V
    .registers 21

    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p4

    iput-object v1, v0, Ltw3;->a:Lhx3;

    move-object/from16 v1, p1

    iput-object v1, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    move-object/from16 v1, p2

    iput-object v1, v0, Ltw3;->c:Lumi;

    move-object/from16 v1, p3

    iput-object v1, v0, Ltw3;->d:Lwjh;

    new-instance v1, Lzv3;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->e:Lzv3;

    new-instance v1, Lyv3;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Lyv3;-><init>(Ltw3;B)V

    new-instance v4, Lj4c;

    invoke-direct {v4, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v4, v0, Ltw3;->f:Lj4c;

    new-instance v1, Lyv3;

    const/16 v4, 0xa

    invoke-direct {v1, v0, v4}, Lyv3;-><init>(Ltw3;B)V

    new-instance v5, Lj4c;

    invoke-direct {v5, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v5, v0, Ltw3;->g:Lj4c;

    new-instance v1, Lyv3;

    const/16 v5, 0xb

    invoke-direct {v1, v0, v5}, Lyv3;-><init>(Ltw3;B)V

    new-instance v6, Lj4c;

    invoke-direct {v6, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v6, v0, Ltw3;->h:Lj4c;

    new-instance v1, Lyv3;

    const/16 v6, 0xc

    invoke-direct {v1, v0, v6}, Lyv3;-><init>(Ltw3;B)V

    new-instance v7, Lj4c;

    invoke-direct {v7, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v7, v0, Ltw3;->i:Lj4c;

    new-instance v1, Lyv3;

    const/16 v7, 0xd

    invoke-direct {v1, v0, v7}, Lyv3;-><init>(Ltw3;B)V

    new-instance v8, Lj4c;

    invoke-direct {v8, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v8, v0, Ltw3;->j:Lj4c;

    new-instance v1, Lzv3;

    const/16 v8, 0x8

    invoke-direct {v1, v0, v8}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->k:Lzv3;

    new-instance v1, Lzv3;

    const/16 v9, 0x9

    invoke-direct {v1, v0, v9}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->l:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->m:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v5}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->n:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v7}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->o:Lzv3;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v2}, Lyv3;-><init>(Ltw3;B)V

    new-instance v10, Lj4c;

    invoke-direct {v10, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v10, v0, Ltw3;->p:Lj4c;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v6}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->q:Lzv3;

    new-instance v1, Lzv3;

    const/16 v10, 0xe

    invoke-direct {v1, v0, v10}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->r:Lzv3;

    new-instance v1, Lzv3;

    const/16 v11, 0xf

    invoke-direct {v1, v0, v11}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->s:Lzv3;

    new-instance v1, Lzv3;

    const/16 v12, 0x12

    invoke-direct {v1, v0, v12}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->t:Lzv3;

    new-instance v1, Lii;

    const/4 v13, 0x6

    invoke-direct {v1, v13}, Lii;-><init>(B)V

    iput-object v1, v0, Ltw3;->u:Lii;

    new-instance v1, Lzv3;

    const/16 v14, 0x13

    invoke-direct {v1, v0, v14}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->v:Lzv3;

    new-instance v1, Lzv3;

    const/16 v15, 0x14

    invoke-direct {v1, v0, v15}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->w:Lzv3;

    new-instance v1, Lzv3;

    const/16 v4, 0x15

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->x:Lzv3;

    new-instance v1, Lzv3;

    const/16 v4, 0x16

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->y:Lzv3;

    new-instance v1, Lzv3;

    const/16 v4, 0x17

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->z:Lzv3;

    new-instance v1, Lzv3;

    const/16 v4, 0x18

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->A:Lzv3;

    new-instance v1, Lzv3;

    const/16 v4, 0x1c

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->B:Lzv3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v3}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->C:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v2}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->D:Lhw3;

    new-instance v1, Lhw3;

    const/4 v4, 0x2

    invoke-direct {v1, v0, v4}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->E:Lhw3;

    new-instance v1, Lhw3;

    const/4 v4, 0x4

    invoke-direct {v1, v0, v4}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->F:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v9}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->G:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v5}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->H:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->I:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v11}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->J:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v7}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->K:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v13}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->L:Lhw3;

    new-instance v1, Lhw3;

    const/4 v5, 0x5

    invoke-direct {v1, v0, v5}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->M:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v10}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->N:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v12}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->O:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v14}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->P:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v15}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->Q:Lhw3;

    new-instance v1, Lhw3;

    const/16 v6, 0x16

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->R:Lhw3;

    new-instance v1, Lhw3;

    const/16 v6, 0x18

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->S:Lhw3;

    new-instance v1, Lhw3;

    const/16 v6, 0x19

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->T:Lhw3;

    new-instance v1, Lhw3;

    const/16 v6, 0x1a

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->U:Lhw3;

    new-instance v1, Lhw3;

    const/16 v7, 0x1b

    invoke-direct {v1, v0, v7}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->V:Lhw3;

    new-instance v1, Lhw3;

    const/16 v10, 0x1c

    invoke-direct {v1, v0, v10}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->W:Lhw3;

    new-instance v1, Lrw3;

    const/4 v10, 0x3

    invoke-direct {v1, v0, v10}, Lrw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->X:Lrw3;

    new-instance v1, Lrw3;

    invoke-direct {v1, v0, v2}, Lrw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->Y:Lrw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v8}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->Z:Lhw3;

    new-instance v1, Lzv3;

    const/16 v11, 0x11

    invoke-direct {v1, v0, v11}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->a0:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v3}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->b0:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v5}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->c0:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v10}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->d0:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v13}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->e0:Lzv3;

    new-instance v1, Lrw3;

    const/4 v11, 0x2

    invoke-direct {v1, v0, v11}, Lrw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->f0:Lrw3;

    new-instance v1, Lhw3;

    const/16 v11, 0x15

    invoke-direct {v1, v0, v11}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->g0:Lhw3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v7}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->h0:Lzv3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v4}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->i0:Lzv3;

    new-instance v1, Lhw3;

    const/4 v11, 0x7

    invoke-direct {v1, v0, v11}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->j0:Lhw3;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v6}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->k0:Lzv3;

    new-instance v1, Lhw3;

    const/16 v12, 0xa

    invoke-direct {v1, v0, v12}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->l0:Lhw3;

    new-instance v1, Lyv3;

    const/4 v12, 0x2

    invoke-direct {v1, v0, v12}, Lyv3;-><init>(Ltw3;B)V

    new-instance v12, Lj4c;

    invoke-direct {v12, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v12, v0, Ltw3;->m0:Lj4c;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v10}, Lyv3;-><init>(Ltw3;B)V

    new-instance v12, Lj4c;

    invoke-direct {v12, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v12, v0, Ltw3;->n0:Lj4c;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v4}, Lyv3;-><init>(Ltw3;B)V

    new-instance v12, Lj4c;

    invoke-direct {v12, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v12, v0, Ltw3;->o0:Lj4c;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v5}, Lyv3;-><init>(Ltw3;B)V

    new-instance v12, Lj4c;

    invoke-direct {v12, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v12, v0, Ltw3;->p0:Lj4c;

    new-instance v1, Luu1;

    invoke-direct {v1, v6}, Luu1;-><init>(B)V

    new-instance v6, Lj4c;

    invoke-direct {v6, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v6, v0, Ltw3;->q0:Lj4c;

    new-instance v1, Lzv3;

    invoke-direct {v1, v0, v11}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->r0:Lzv3;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v11}, Lyv3;-><init>(Ltw3;B)V

    new-instance v6, Lj4c;

    invoke-direct {v6, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v6, v0, Ltw3;->s0:Lj4c;

    new-instance v1, Lhw3;

    const/16 v6, 0x17

    invoke-direct {v1, v0, v6}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->t0:Lhw3;

    new-instance v1, Lii;

    invoke-direct {v1, v5}, Lii;-><init>(B)V

    iput-object v1, v0, Ltw3;->u0:Lii;

    new-instance v1, Lhw3;

    const/16 v5, 0x10

    invoke-direct {v1, v0, v5}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->v0:Lhw3;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v8}, Lyv3;-><init>(Ltw3;B)V

    new-instance v5, Lj4c;

    invoke-direct {v5, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v5, v0, Ltw3;->w0:Lj4c;

    new-instance v1, Lyv3;

    invoke-direct {v1, v0, v9}, Lyv3;-><init>(Ltw3;B)V

    new-instance v5, Lj4c;

    invoke-direct {v5, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v5, v0, Ltw3;->x0:Lj4c;

    new-instance v1, Lzv3;

    const/16 v5, 0x1d

    invoke-direct {v1, v0, v5}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->y0:Lzv3;

    new-instance v1, Luu1;

    invoke-direct {v1, v7}, Luu1;-><init>(B)V

    new-instance v5, Lj4c;

    invoke-direct {v5, v1, v2}, Lj4c;-><init>(Lesk;B)V

    iput-object v5, v0, Ltw3;->z0:Lj4c;

    new-instance v1, Lzv3;

    const/16 v2, 0x10

    invoke-direct {v1, v0, v2}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->A0:Lzv3;

    new-instance v1, Lhw3;

    const/16 v2, 0x1d

    invoke-direct {v1, v0, v2}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->B0:Lhw3;

    new-instance v1, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    new-instance v1, Lzv3;

    const/4 v11, 0x2

    invoke-direct {v1, v0, v11}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->C0:Lzv3;

    new-instance v1, Ljava/util/ArrayList;

    new-instance v1, Lrw3;

    invoke-direct {v1, v0, v3}, Lrw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->D0:Lrw3;

    new-instance v1, Lrw3;

    invoke-direct {v1, v0, v4}, Lrw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->E0:Lrw3;

    new-instance v1, Lzv3;

    const/16 v2, 0x19

    invoke-direct {v1, v0, v2}, Lzv3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->F0:Lzv3;

    new-instance v1, Lhw3;

    const/16 v2, 0x11

    invoke-direct {v1, v0, v2}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->G0:Lhw3;

    new-instance v1, Lhw3;

    invoke-direct {v1, v0, v10}, Lhw3;-><init>(Ltw3;B)V

    iput-object v1, v0, Ltw3;->H0:Lhw3;

    return-void
.end method


# virtual methods
.method public final a()Lzv3;
    .registers 1

    iget-object p0, p0, Ltw3;->a0:Lzv3;

    return-object p0
.end method

.method public final b()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->p:Lfx3;

    return-object p0
.end method

.method public final c()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->m:Lfx3;

    return-object p0
.end method

.method public final d()Lhw3;
    .registers 1

    iget-object p0, p0, Ltw3;->g0:Lhw3;

    return-object p0
.end method

.method public final e()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->a:Lxbf;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lj4c;

    return-object p0
.end method

.method public final f()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->e:Lfx3;

    return-object p0
.end method

.method public final g()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->a:Lxbf;

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Lj4c;

    return-object p0
.end method

.method public final h()Lxm5;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->h()Lxm5;

    move-result-object p0

    return-object p0
.end method

.method public final k()Lcom/opera/android/Lazy;
    .registers 1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->s:Lfx3;

    return-object p0
.end method
