.class public final Ll/qyv$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qyv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:J

.field public d:Ljava/lang/String;

.field public e:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0x240c8400

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/qyv$b;->c:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ll/qyv;
    .locals 3

    .line 1
    new-instance v0, Ll/qyv;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/qyv;-><init>(Ll/qyv$a;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ll/qyv$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/qyv;->a(Ll/qyv;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/qyv$b;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/qyv;->b(Ll/qyv;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-wide v1, p0, Ll/qyv$b;->c:J

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Ll/qyv;->c(Ll/qyv;J)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/qyv$b;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/qyv;->d(Ll/qyv;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-wide v1, p0, Ll/qyv$b;->e:J

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Ll/qyv;->e(Ll/qyv;J)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public b(Ljava/lang/String;)Ll/qyv$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qyv$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(J)Ll/qyv$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/qyv$b;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/qyv$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qyv$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(J)Ll/qyv$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/qyv$b;->e:J

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/qyv$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qyv$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
