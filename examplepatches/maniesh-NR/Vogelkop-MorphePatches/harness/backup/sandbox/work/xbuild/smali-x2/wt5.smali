.class public final Lwt5;
.super Ll53;
.source "SourceFile"


# instance fields
.field public final c:Landroid/view/View;

.field public final d:Lj8f;

.field public final e:Lpjn;


# direct methods
.method public constructor <init>(Landroid/view/View;Lj8f;Lpjn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwt5;->c:Landroid/view/View;

    iput-object p2, p0, Lwt5;->d:Lj8f;

    iput-object p3, p0, Lwt5;->e:Lpjn;

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Llz3;
    .registers 11

    new-instance v0, Lexd;

    new-instance v1, Lixh;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    iget-object v2, p0, Lwt5;->c:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    new-instance v3, Ll11;

    const/16 v4, 0x30

    const/4 v5, 0x3

    invoke-direct {v3, v5, v1, v4, v2}, Ll11;-><init>(IIILandroid/view/View;)V

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v4, 0x7f140be8

    invoke-direct {v2, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lut5;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lut5;-><init>(Lwt5;B)V

    const/4 v6, 0x0

    invoke-direct {v1, v2, v6, v4}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    new-instance v2, Lgtd;

    new-instance v4, Lrxh;

    const v7, 0x7f140822

    invoke-direct {v4, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lut5;

    const/4 v8, 0x1

    invoke-direct {v7, p0, v8}, Lut5;-><init>(Lwt5;B)V

    invoke-direct {v2, v4, v6, v7}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    filled-new-array {v1, v2}, [Lgtd;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p1, v3, v1}, Lexd;-><init>(Landroid/view/ViewGroup;Ll11;Ljava/util/List;)V

    new-instance p1, Lvt5;

    invoke-direct {p1, p0, v5}, Lvt5;-><init>(Ll53;B)V

    invoke-virtual {v0, p1}, Llz3;->a(Lkz3;)V

    return-object v0
.end method
