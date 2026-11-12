.class public final Ljzj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:D

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljzj;->a:Ljava/lang/String;

    iput-object p2, p0, Ljzj;->b:Ljava/lang/String;

    iput-wide p3, p0, Ljzj;->c:D

    iput-object p5, p0, Ljzj;->d:Ljava/lang/String;

    return-void
.end method
