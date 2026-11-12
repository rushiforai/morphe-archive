.class public final Lwud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llcc;


# instance fields
.field public final synthetic a:Lrcc;

.field public final synthetic b:Ljx4;

.field public final synthetic c:Lrcc;

.field public final synthetic d:Ljx4;


# direct methods
.method public constructor <init>(Lrcc;Ljx4;Lrcc;Ljx4;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwud;->a:Lrcc;

    iput-object p2, p0, Lwud;->b:Ljx4;

    iput-object p3, p0, Lwud;->c:Lrcc;

    iput-object p4, p0, Lwud;->d:Ljx4;

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 1

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lwud;->a:Lrcc;

    iget-object v1, p0, Lwud;->b:Ljx4;

    invoke-interface {v0, v1}, Lrcc;->g(Llcc;)V

    iget-object v0, p0, Lwud;->c:Lrcc;

    iget-object p0, p0, Lwud;->d:Ljx4;

    invoke-interface {v0, p0}, Lrcc;->g(Llcc;)V

    return-void
.end method

.method public final onPause()V
    .registers 1

    return-void
.end method

.method public final onResume()V
    .registers 1

    return-void
.end method

.method public final onStart()V
    .registers 1

    return-void
.end method

.method public final onStop()V
    .registers 1

    return-void
.end method
