.class public final Lk4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La9l;


# instance fields
.field public final a:I

.field public final b:Lcom/opera/android/browser/TabInfo;

.field public final synthetic c:Lcom/opera/android/browser/SessionStore;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/SessionStore;ILcom/opera/android/browser/TabInfo;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk4j;->c:Lcom/opera/android/browser/SessionStore;

    iput p2, p0, Lk4j;->a:I

    iput-object p3, p0, Lk4j;->b:Lcom/opera/android/browser/TabInfo;

    return-void
.end method


# virtual methods
.method public final a()Lcom/opera/android/browser/TabInfo;
    .registers 1

    iget-object p0, p0, Lk4j;->b:Lcom/opera/android/browser/TabInfo;

    return-object p0
.end method

.method public final d()I
    .registers 1

    invoke-virtual {p0}, Lk4j;->i()Ljke;

    move-result-object p0

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->d()I

    move-result p0

    return p0
.end method

.method public final i()Ljke;
    .registers 3

    new-instance v0, Lbp;

    iget-object v1, p0, Lk4j;->c:Lcom/opera/android/browser/SessionStore;

    iget p0, p0, Lk4j;->a:I

    invoke-direct {v0, v1, p0}, Lbp;-><init>(Lcom/opera/android/browser/SessionStore;I)V

    return-object v0
.end method

.method public final j()I
    .registers 1

    invoke-virtual {p0}, Lk4j;->i()Ljke;

    move-result-object p0

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->j()I

    move-result p0

    return p0
.end method

.method public final k()Lz8l;
    .registers 3

    invoke-virtual {p0}, Lk4j;->i()Ljke;

    move-result-object v0

    check-cast v0, Lbp;

    invoke-virtual {v0}, Lbp;->d()I

    move-result v1

    if-nez v1, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    invoke-virtual {v0}, Lbp;->j()I

    move-result v1

    invoke-virtual {v0, v1}, Lbp;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v0

    new-instance v1, Llld;

    invoke-direct {v1, p0, v0}, Llld;-><init>(Lk4j;Lcom/opera/android/browser/NavigationEntry;)V

    return-object v1
.end method

.method public final l(Lxbf;)Ld7l;
    .registers 2

    invoke-virtual {p1, p0}, Lxbf;->r(La9l;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final m()I
    .registers 1

    iget p0, p0, Lk4j;->a:I

    return p0
.end method
