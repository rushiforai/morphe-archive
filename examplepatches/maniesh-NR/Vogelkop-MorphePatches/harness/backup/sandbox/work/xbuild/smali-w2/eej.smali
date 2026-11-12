.class public final Leej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lok5;


# instance fields
.field public final a:Lnej;

.field public final b:Laal;

.field public final c:Lgjm;


# direct methods
.method public constructor <init>(Lnej;Laal;Lgjm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leej;->a:Lnej;

    iput-object p2, p0, Leej;->b:Laal;

    iput-object p3, p0, Leej;->c:Lgjm;

    return-void
.end method


# virtual methods
.method public final a(Lzwk;Llld;Z)Lv4g;
    .registers 12

    const v0, 0x7f140e9b

    if-eqz p3, :cond_38

    new-instance p1, Lv4g;

    new-instance v1, Ls9i;

    new-instance v2, Lrxh;

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const p3, 0x7f140ea9

    invoke-direct {v3, p3}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const p3, 0x7f1415b4

    invoke-direct {v4, p3}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const p3, 0x7f140b3e

    invoke-direct {v5, p3}, Lrxh;-><init>(I)V

    const/16 v6, 0x18

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    new-instance p3, Lodf;

    const/16 v0, 0xc

    invoke-direct {p3, v0}, Lodf;-><init>(B)V

    const/4 v0, 0x0

    invoke-direct {p1, v1, p3, v0, p2}, Lv4g;-><init>(Ls9i;Lodf;ZLlld;)V

    goto :goto_a6

    :cond_38
    new-instance p3, Lv4g;

    new-instance v1, Ls9i;

    new-instance v2, Lrxh;

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result p1

    if-eqz p1, :cond_6f

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object p1

    iget-object p1, p1, Lwyk;->a:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_54
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lne6;

    iget v0, v0, Lne6;->a:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_54

    new-instance p1, Lrxh;

    const v0, 0x7f140e9c

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    move-object v3, p1

    goto :goto_84

    :cond_6f
    new-instance p1, Lrxh;

    const v0, 0x7f1401b7

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    new-instance v0, Lsxh;

    const v3, 0x7f140e98

    invoke-direct {v0, v3, p1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    move-object v3, v0

    :goto_84
    new-instance v4, Lrxh;

    const p1, 0x7f140e9a

    invoke-direct {v4, p1}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const p1, 0x7f140e99

    invoke-direct {v5, p1}, Lrxh;-><init>(I)V

    const/16 v6, 0x18

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    new-instance p1, Lodf;

    const/16 v0, 0xb

    invoke-direct {p1, v0}, Lodf;-><init>(B)V

    const/4 v0, 0x1

    invoke-direct {p3, v1, p1, v0, p2}, Lv4g;-><init>(Ls9i;Lodf;ZLlld;)V

    move-object p1, p3

    :goto_a6
    iget-object p0, p0, Leej;->a:Lnej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    return-object p1
.end method
