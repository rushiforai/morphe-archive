.class public final Lbmg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lki;

.field public final b:Lzyk;


# direct methods
.method public constructor <init>(Lki;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbmg;->a:Lki;

    new-instance p1, Lkof;

    const/16 v0, 0x17

    invoke-direct {p1, v0}, Lkof;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbmg;->b:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lf90;)V
    .registers 19

    iget-object v0, p0, Lbmg;->b:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldeg;

    invoke-static/range {p7 .. p7}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_12

    const/4 v1, 0x0

    goto :goto_16

    :cond_12
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_16
    const/high16 v2, 0x43000000    # 128.0f

    invoke-static {p1, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, v1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v0

    iget-object v1, v0, Ldwh;->b:Lgvh;

    invoke-virtual {v1, p1, p1}, Lgvh;->b(II)V

    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, p1}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    invoke-virtual {v0}, Ldwh;->b()V

    invoke-virtual {v0}, Ldwh;->j()V

    new-instance p1, Lphi;

    new-instance v1, Lue9;

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lue9;-><init>(Lbmg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lf90;)V

    invoke-direct {p1, v1}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v0, p1}, Ldwh;->f(Lacl;)V

    return-void
.end method
