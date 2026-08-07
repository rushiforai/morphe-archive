.class public final Ll/c3g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bsf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:Ll/bsf;


# direct methods
.method public constructor <init>(JLl/bsf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/c3g0;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/c3g0;->b:Ll/bsf;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/c3g0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/c3g0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public b(II)Ll/qfj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c3g0;->b:Ll/bsf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/bsf;->b(II)Ll/qfj0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k(Ll/mke0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c3g0;->b:Ll/bsf;

    .line 2
    .line 3
    new-instance v1, Ll/c3g0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/c3g0$a;-><init>(Ll/c3g0;Ll/mke0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/bsf;->k(Ll/mke0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c3g0;->b:Ll/bsf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bsf;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
