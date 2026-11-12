.class public final Lkj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsm5;


# instance fields
.field public final synthetic a:Llj3;


# direct methods
.method public constructor <init>(Llj3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkj3;->a:Llj3;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 7

    if-eqz p1, :cond_3b

    iget-object p1, p0, Lkj3;->a:Llj3;

    iget-object v0, p1, Llj3;->b:Ltm5;

    iget-object v1, v0, Ltm5;->d:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1d

    iget-object p0, v0, Ltm5;->c:Lrle;

    if-eqz p0, :cond_1d

    iget-object p0, p0, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 p0, 0x0

    iput-object p0, v0, Ltm5;->c:Lrle;

    :cond_1d
    iget-object p0, p1, Llj3;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_24
    if-ge v1, v0, :cond_38

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljj3;

    iget-object v3, v2, Ljj3;->a:Landroid/net/Uri;

    iget-object v4, v2, Ljj3;->b:Ljava/lang/String;

    iget-object v2, v2, Ljj3;->c:Lwx;

    invoke-virtual {p1, v3, v4, v2}, Llj3;->a(Landroid/net/Uri;Ljava/lang/String;Lwx;)V

    goto :goto_24

    :cond_38
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    :cond_3b
    return-void
.end method
