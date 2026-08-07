.class public Ll/ctb$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ctb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/ctb;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ctb;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ctb;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/ctb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)Ll/ctb$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ctb;->d(Ll/ctb;Z)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(J)Ll/ctb$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/ctb;->c(Ll/ctb;J)J

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(I)Ll/ctb$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ctb;->e(Ll/ctb;I)I

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e(J)Ll/ctb$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctb$a;->a:Ll/ctb;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/ctb;->f(Ll/ctb;J)J

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
