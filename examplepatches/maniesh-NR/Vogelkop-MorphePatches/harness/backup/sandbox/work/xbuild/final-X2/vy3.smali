.class public final Lvy3;
.super Lzz1;
.source "SourceFile"


# instance fields
.field public final n:Lfx0;

.field public final o:Lg9;

.field public final p:Lf23;

.field public final q:Lfx0;

.field public final r:Lcom/opera/android/Lazy;

.field public final s:Lm02;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lv22;Lfx0;Lg9;Lf23;Lfx0;Lcom/opera/android/Lazy;Ldu3;Lmlj;Lwx;Lwhf;Lji;Lg7m;Lk42;Lv5n;Lm02;Lgjm;)V
    .registers 30

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p8

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    move-object/from16 v7, p12

    move-object/from16 v8, p13

    move-object/from16 v9, p14

    move-object/from16 v10, p15

    move-object/from16 v11, p17

    invoke-direct/range {v0 .. v11}, Lzz1;-><init>(Landroid/content/Context;Lndc;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V

    iput-object p3, p0, Lvy3;->n:Lfx0;

    move-object/from16 p1, p4

    iput-object p1, p0, Lvy3;->o:Lg9;

    move-object/from16 p1, p5

    iput-object p1, p0, Lvy3;->p:Lf23;

    move-object/from16 p1, p6

    iput-object p1, p0, Lvy3;->q:Lfx0;

    move-object/from16 p1, p7

    iput-object p1, p0, Lvy3;->r:Lcom/opera/android/Lazy;

    move-object/from16 p1, p16

    iput-object p1, p0, Lvy3;->s:Lm02;

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 9

    new-instance v4, Lbo3;

    const/16 v0, 0xb

    invoke-direct {v4, p0, v0}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lwth;

    iget-object p0, p0, Lvy3;->s:Lm02;

    const/16 v0, 0xa

    invoke-direct {v1, p0, v0}, Lwth;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lo02;

    const/4 v5, 0x1

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lo02;-><init>(Ljava/lang/Object;JLjava/lang/Object;B)V

    invoke-virtual {v1, v2, v3, v0}, Lwth;->y(JLkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    sget-object v0, Lsnf;->c:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lzz1;->a:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Z)V
    .registers 5

    sget-object v0, Lvz1;->a:Lpsp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lpsp;->n(Ljava/lang/String;)Lvz1;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p0, v0}, Lzz1;->f(Lvz1;)V

    return-void

    :cond_f
    const/4 v0, 0x0

    sget-object v1, Llqm;->y:Llqm;

    invoke-static {p1, v0, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p1

    if-eqz p1, :cond_35

    iget-object v0, p0, Lvy3;->r:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsk6;

    iget-object v1, p1, Lksc;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lsk6;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2a

    iput-object v0, p1, Lksc;->a:Ljava/lang/String;

    :cond_2a
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iget-object p0, p0, Lvy3;->p:Lf23;

    invoke-virtual {p0, p1, v0, p2}, Lf23;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_35
    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 3

    iget-object p0, p0, Lvy3;->q:Lfx0;

    invoke-virtual {p0, p2, p1}, Lfx0;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lvy3;->n:Lfx0;

    invoke-virtual {p0, p1, v0}, Lfx0;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
