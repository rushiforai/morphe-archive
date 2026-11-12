.class public final Lxpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwpm;


# instance fields
.field public a:Lcom/opera/android/widget/UrlFieldEditText;

.field public final b:Ljava/util/ArrayList;

.field public final c:Lpde;

.field public final d:Lg9l;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lxpm;->b:Ljava/util/ArrayList;

    new-instance p1, Lpde;

    iget-object v0, p0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v0, v0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lxpm;->c:Lpde;

    new-instance p1, Lg9l;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lxpm;->d:Lg9l;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lz6f;

    iget-object v0, p0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    iget-object p0, p0, Lxpm;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lz6f;

    iget-object v0, p0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->n(Lz6f;)V

    iget-object p0, p0, Lxpm;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final L()I
    .registers 1

    iget-object p0, p0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->Q:I

    return p0
.end method
