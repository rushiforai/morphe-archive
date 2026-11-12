.class public final Lvi5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/nio/ByteBuffer;JJJLjava/nio/ByteBuffer;)V
    .registers 9

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvi5;->d:Ljava/lang/Object;

    iput-wide p2, p0, Lvi5;->a:J

    iput-wide p4, p0, Lvi5;->b:J

    iput-wide p6, p0, Lvi5;->c:J

    iput-object p8, p0, Lvi5;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkw3;Ltw2;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lvi5;->a:J

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lvi5;->b:J

    iput-wide v0, p0, Lvi5;->c:J

    iput-object p2, p0, Lvi5;->d:Ljava/lang/Object;

    iput-object p3, p0, Lvi5;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxi5;)V
    .registers 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvi5;->e:Ljava/lang/Object;

    .line 23
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvi5;->d:Ljava/lang/Object;

    return-void
.end method
