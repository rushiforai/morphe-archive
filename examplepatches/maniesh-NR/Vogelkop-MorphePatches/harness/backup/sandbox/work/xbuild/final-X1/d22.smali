.class public final Ld22;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lq3;

.field public final c:Lkze;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lq3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld22;->a:Ljava/lang/String;

    iput-object p2, p0, Ld22;->b:Lq3;

    new-instance p1, Lkze;

    new-instance p2, Lc22;

    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1}, Lc22;-><init>(Ljava/lang/String;Z)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ld22;->c:Lkze;

    return-void
.end method
