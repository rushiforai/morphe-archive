.class public final Lkj8;
.super Ljal;
.source "SourceFile"

# interfaces
.implements Lpkb;
.implements Lhlb;


# instance fields
.field public final b:Lypd;

.field public c:Ll2l;

.field public final d:Ld5a;


# direct methods
.method public constructor <init>(Lpde;Llj8;Lv8a;Lypd;Lpde;)V
    .registers 16

    iget-object v0, p2, Llj8;->a:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p4, p0, Lkj8;->b:Lypd;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p4

    invoke-static {p1, p4}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object v2

    new-instance p1, Ll2l;

    sget-object p4, Ll08;->a:Ll08;

    const/4 v1, 0x0

    invoke-direct {p1, p4, v1}, Ll2l;-><init>(Ljava/util/List;I)V

    iput-object p1, p0, Lkj8;->c:Ll2l;

    iget-object v3, p2, Llj8;->b:Ln4l;

    if-eqz v3, :cond_3e

    move p1, v1

    new-instance v1, Ld5a;

    new-instance v6, Ljj8;

    invoke-direct {v6, p0, p1}, Ljj8;-><init>(Lkj8;B)V

    new-instance v7, Ljj8;

    const/4 p1, 0x1

    invoke-direct {v7, p0, p1}, Ljj8;-><init>(Lkj8;B)V

    new-instance v8, Ltu7;

    const/16 p1, 0x8

    invoke-direct {v8, p0, p1}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Ljj8;

    const/4 p1, 0x2

    invoke-direct {v9, p0, p1}, Ljj8;-><init>(Lkj8;B)V

    move-object v4, p3

    move-object v5, p5

    invoke-direct/range {v1 .. v9}, Ld5a;-><init>(Ltsd;Ln4l;Lv8a;Lpde;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    goto :goto_40

    :cond_3e
    move-object v5, p5

    const/4 v1, 0x0

    :goto_40
    iput-object v1, p0, Lkj8;->d:Ld5a;

    new-instance p1, Lh5k;

    invoke-direct {p1, v2, v5, p2}, Lh5k;-><init>(Ltsd;Lpde;Lre5;)V

    new-instance p1, Lyk4;

    const/16 p2, 0x17

    invoke-direct {p1, p0, p2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final X()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lkj8;->c:Ll2l;

    iget-object p0, p0, Ll2l;->a:Ljava/util/List;

    return-object p0
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getGroupId()I
    .registers 1

    iget-object p0, p0, Lkj8;->c:Ll2l;

    iget p0, p0, Ll2l;->b:I

    return p0
.end method

.method public final n()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final o()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final y()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
