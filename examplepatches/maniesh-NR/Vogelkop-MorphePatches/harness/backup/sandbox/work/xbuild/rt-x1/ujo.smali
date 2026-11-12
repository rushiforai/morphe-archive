.class public final Lujo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqi8;

.field public b:Z

.field public c:S

.field public d:Ln9h;

.field public e:Landroid/graphics/Bitmap;

.field public f:Landroid/view/TextureView;

.field public g:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkvo;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput-short v0, p0, Lujo;->c:S

    new-instance v0, Lai8;

    invoke-direct {v0, p1}, Lai8;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lai8;->a()Lqi8;

    move-result-object p1

    iput-object p1, p0, Lujo;->a:Lqi8;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lujo;->b:Z

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lqi8;->setVolume(F)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lqi8;->setPlayWhenReady(Z)V

    new-instance v0, Lzgo;

    invoke-direct {v0, p0, p2}, Lzgo;-><init>(Lujo;Lkvo;)V

    iget-object p0, p1, Lqi8;->n:Lijc;

    invoke-virtual {p0, v0}, Lijc;->a(Ljava/lang/Object;)V

    return-void
.end method
