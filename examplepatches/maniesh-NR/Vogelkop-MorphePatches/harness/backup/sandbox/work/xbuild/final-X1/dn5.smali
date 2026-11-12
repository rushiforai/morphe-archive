.class public final Ldn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgn5;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(IZZII)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ldn5;->a:I

    iput p4, p0, Ldn5;->b:I

    iput p5, p0, Ldn5;->c:I

    iput-boolean p2, p0, Ldn5;->d:Z

    iput-boolean p3, p0, Ldn5;->e:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Ldn5;->f:Z

    return-void
.end method


# virtual methods
.method public final getId()J
    .registers 3

    iget p0, p0, Ldn5;->a:I

    int-to-long v0, p0

    return-wide v0
.end method

.method public final getType()I
    .registers 1

    iget-boolean p0, p0, Ldn5;->d:Z

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x2

    return p0
.end method
