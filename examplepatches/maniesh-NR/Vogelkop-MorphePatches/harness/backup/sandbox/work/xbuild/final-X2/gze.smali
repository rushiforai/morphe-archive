.class public abstract Lgze;
.super Ln82;
.source "SourceFile"


# instance fields
.field public final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;Ljava/lang/String;)V
    .registers 15

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v7}, Ln82;-><init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;ZZ)V

    iput-object p6, v0, Lgze;->k:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public T(Ld5o;Ljava/lang/String;)Ljava/util/List;
    .registers 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-object p2, p0, Ln82;->g:Ll45;

    iget-object v2, p0, Lgze;->k:Ljava/lang/String;

    invoke-virtual {p2, p1, v2, v0, v1}, Ll45;->R(Ld5o;Ljava/lang/String;J)Ljava/util/ArrayList;

    move-result-object p2

    iget-object p0, p0, Ln82;->f:Luy8;

    invoke-virtual {p0, p2}, Luy8;->b(Ljava/util/List;)V

    iget-object p1, p1, Ld5o;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_23

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_23

    iput-object p1, p0, Luy8;->m:Ljava/util/Map;

    goto :goto_30

    :cond_23
    iget-object p1, p0, Luy8;->m:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2c

    return-object p2

    :cond_2c
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object p1, p0, Luy8;->m:Ljava/util/Map;

    :goto_30
    invoke-virtual {p0}, Luy8;->n()V

    return-object p2
.end method
