.class public final Lk1a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 p1, p1, 0x7

    iput p1, p0, Lk1a;->a:I

    iput p2, p0, Lk1a;->b:I

    iput p3, p0, Lk1a;->c:I

    iput p4, p0, Lk1a;->d:I

    iput-object p5, p0, Lk1a;->e:Ljava/lang/String;

    return-void
.end method
