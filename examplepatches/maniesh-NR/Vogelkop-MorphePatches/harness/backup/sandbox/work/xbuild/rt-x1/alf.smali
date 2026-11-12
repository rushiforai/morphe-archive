.class public final Lalf;
.super Laqi;
.source "SourceFile"


# instance fields
.field public final u:Ldhb;

.field public final v:Lbp;


# direct methods
.method public constructor <init>(Ldhb;Ljava/lang/String;Ldl;ILbp;Li3j;Lap;)V
    .registers 17

    sget-object v1, Lyo;->f:Lyo;

    sget-object v2, Lrm;->f:Lrm;

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move v6, p4

    move-object v5, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Laqi;-><init>(Lyo;Lrm;Ljava/lang/String;Ldl;Lbp;ILi3j;Lap;)V

    iput-object p1, p0, Lalf;->u:Ldhb;

    iput-object p5, p0, Lalf;->v:Lbp;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 1

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Lalf;->u:Ldhb;

    invoke-virtual {p0}, Lk8;->P()V

    return-void
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->k:Lv50;

    return-object p0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Lalf;->u:Ldhb;

    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object p0

    invoke-virtual {p0}, Lpxo;->d()Z

    move-result p0

    return p0
.end method
