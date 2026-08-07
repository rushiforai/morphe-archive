.class public final Ll/sir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ser0;


# instance fields
.field public final a:J

.field public final b:Ll/ser0;


# direct methods
.method public constructor <init>(JLl/ser0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/sir0;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/sir0;->b:Ll/ser0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/sir0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/sir0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sir0;->b:Ll/ser0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ser0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(II)Ll/sgr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sir0;->b:Ll/ser0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ser0;->i(II)Ll/sgr0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final j(Ll/bgr0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rir0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p1}, Ll/rir0;-><init>(Ll/sir0;Ll/bgr0;Ll/bgr0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/sir0;->b:Ll/ser0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/ser0;->j(Ll/bgr0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
