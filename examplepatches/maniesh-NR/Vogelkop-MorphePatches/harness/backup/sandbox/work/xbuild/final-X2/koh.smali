.class public final Lkoh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbuk;

.field public final b:Lzpl;

.field public final c:B

.field public d:Z

.field public e:I

.field public f:Ljava/util/concurrent/ScheduledFuture;

.field public final synthetic g:Lmoh;


# direct methods
.method public constructor <init>(Lmoh;Lbuk;Lzpl;ZI)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkoh;->g:Lmoh;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkoh;->d:Z

    iput v0, p0, Lkoh;->e:I

    const/4 v0, 0x0

    iput-object v0, p0, Lkoh;->f:Ljava/util/concurrent/ScheduledFuture;

    iput-object p2, p0, Lkoh;->a:Lbuk;

    iput-object p3, p0, Lkoh;->b:Lzpl;

    iput-boolean p4, p1, Lmoh;->z:Z

    iput-byte p5, p0, Lkoh;->c:B

    return-void
.end method
