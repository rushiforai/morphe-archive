.class public final Lc4l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnw3;

.field public final b:Lnw3;

.field public final c:Loji;

.field public final d:Lzg;

.field public final e:Lwci;


# direct methods
.method public constructor <init>(Lnw3;Lnw3;Lnw3;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc4l;->a:Lnw3;

    iput-object p3, p0, Lc4l;->b:Lnw3;

    new-instance p3, Loji;

    invoke-direct {p3, p1}, Loji;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lc4l;->c:Loji;

    new-instance p1, Lzg;

    new-instance v0, Lj1k;

    const/4 v6, 0x0

    const/16 v7, 0xb

    const/4 v1, 0x0

    const-class v3, Lc4l;

    const-string v4, "onBubbleTourStepShown"

    const-string v5, "onBubbleTourStepShown()V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p3, p1, Lzg;->b:Ljava/lang/Object;

    iput-object v0, p1, Lzg;->c:Ljava/lang/Object;

    iput-object p1, v2, Lc4l;->d:Lzg;

    new-instance p0, Lwci;

    const/4 p1, 0x1

    invoke-direct {p0, p2, p3, p1}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p0, v2, Lc4l;->e:Lwci;

    return-void
.end method
