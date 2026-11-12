.class public final Lup4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/net/URL;

.field public final c:J

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/net/URL;JLjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lup4;->a:I

    iput-object p2, p0, Lup4;->b:Ljava/net/URL;

    iput-wide p3, p0, Lup4;->c:J

    iput-object p5, p0, Lup4;->d:Ljava/lang/String;

    return-void
.end method
