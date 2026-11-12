.class public final Lwre;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwre;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 11

    invoke-static {p1}, Ls16;->n([I)Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x4

    const/4 v3, 0x0

    const-class v4, Lpte;

    invoke-direct {v2, v3, v4, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz p1, :cond_13

    move-object v3, p1

    :cond_13
    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lwre;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
