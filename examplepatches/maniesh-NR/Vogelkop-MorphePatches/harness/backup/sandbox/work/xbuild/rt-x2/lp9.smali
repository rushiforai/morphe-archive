.class public final Llp9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lwv1;

.field public final b:Lorm;

.field public final c:Lru9;

.field public final d:Lnej;

.field public final e:Lji;

.field public final f:Lq2;

.field public g:Lpf;


# direct methods
.method public constructor <init>(Ltcc;Lk6l;Lwv1;Lorm;Lru9;Lnej;Lji;Lq2;)V
    .registers 19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Llp9;->a:Lwv1;

    iput-object p4, p0, Llp9;->b:Lorm;

    iput-object p5, p0, Llp9;->c:Lru9;

    move-object/from16 v0, p6

    iput-object v0, p0, Llp9;->d:Lnej;

    move-object/from16 v0, p7

    iput-object v0, p0, Llp9;->e:Lji;

    move-object/from16 v0, p8

    iput-object v0, p0, Llp9;->f:Lq2;

    new-instance v8, Lwjh;

    new-instance v0, Lci7;

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v1, 0x1

    const-class v3, Llp9;

    const-string v4, "allowedToShow"

    const-string v5, "allowedToShow(Lcom/opera/android/browser/Tab;)Z"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v0

    new-instance v0, Lci7;

    const/4 v7, 0x5

    const-string v4, "show"

    const-string v5, "show(Lcom/opera/android/browser/Tab;)V"

    invoke-direct/range {v0 .. v7}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v2, v0

    invoke-direct {v8, p1, p2, v9, v2}, Lwjh;-><init>(Ltcc;Lk6l;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
