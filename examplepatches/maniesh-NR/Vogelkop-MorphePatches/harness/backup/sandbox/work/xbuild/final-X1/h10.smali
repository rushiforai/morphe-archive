.class public final Lh10;
.super Laqi;
.source "SourceFile"


# instance fields
.field public final u:Lchb;

.field public final v:Ldl;

.field public final w:Lp00;


# direct methods
.method public constructor <init>(Lchb;Ljava/lang/String;Ldl;Lp00;ILi3j;Lap;)V
    .registers 17

    sget-object v1, Lyo;->c:Lyo;

    sget-object v2, Lrm;->f:Lrm;

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Laqi;-><init>(Lyo;Lrm;Ljava/lang/String;Ldl;Lbp;ILi3j;Lap;)V

    iput-object p1, p0, Lh10;->u:Lchb;

    iput-object p3, p0, Lh10;->v:Ldl;

    iput-object p4, p0, Lh10;->w:Lp00;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 2

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Lh10;->u:Lchb;

    sget-object v0, Lrbe;->B:Lrbe;

    iput-object v0, p0, Lbzo;->b:Lbn;

    return-void
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->k:Lv50;

    return-object p0
.end method
