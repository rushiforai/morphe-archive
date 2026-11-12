.class public final Lxe7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Z

.field public final d:Lre7;


# direct methods
.method public constructor <init>(JZ)V
    .registers 4

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-wide p1, p0, Lxe7;->a:J

    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lxe7;->b:Z

    .line 22
    iput-boolean p3, p0, Lxe7;->c:Z

    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lxe7;->d:Lre7;

    return-void
.end method

.method public constructor <init>(Lre7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-wide v0, p1, Lre7;->o:J

    iput-wide v0, p0, Lxe7;->a:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lxe7;->b:Z

    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    iput-boolean v0, p0, Lxe7;->c:Z

    iput-object p1, p0, Lxe7;->d:Lre7;

    return-void
.end method
