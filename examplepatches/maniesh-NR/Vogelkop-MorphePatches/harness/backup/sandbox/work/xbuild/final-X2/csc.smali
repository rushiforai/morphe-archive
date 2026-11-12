.class public final Lcsc;
.super Lesc;
.source "SourceFile"


# instance fields
.field public final b:Ldeg;

.field public final c:Landroid/net/Uri;

.field public final d:Ltt2;


# direct methods
.method public constructor <init>(Ldeg;Landroid/net/Uri;Ltt2;Lfnn;)V
    .registers 5

    invoke-direct {p0, p4}, Lesc;-><init>(Lfnn;)V

    iput-object p1, p0, Lcsc;->b:Ldeg;

    iput-object p2, p0, Lcsc;->c:Landroid/net/Uri;

    iput-object p3, p0, Lcsc;->d:Ltt2;

    invoke-virtual {p1, p2}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p1

    invoke-virtual {p3, p1}, Ltt2;->run(Ljava/lang/Object;)V

    const/4 p2, 0x0

    new-array p2, p2, [I

    const/4 p3, 0x3

    invoke-virtual {p1, p3, p2}, Ldwh;->i(I[I)V

    invoke-virtual {p1, p0}, Ldwh;->f(Lacl;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    new-instance p1, Ldsc;

    iget-object p2, p0, Lesc;->a:Lfnn;

    invoke-direct {p1, p2}, Lesc;-><init>(Lfnn;)V

    iget-object p2, p0, Lcsc;->b:Ldeg;

    iget-object v0, p0, Lcsc;->c:Landroid/net/Uri;

    invoke-virtual {p2, v0}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p2

    iget-object v0, p0, Lcsc;->d:Ltt2;

    invoke-virtual {v0, p2}, Ltt2;->run(Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [I

    const/4 v1, 0x1

    invoke-virtual {p2, v1, v0}, Ldwh;->i(I[I)V

    invoke-virtual {p2, p1}, Ldwh;->f(Lacl;)V

    sget-object p1, Lfsc;->a:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
