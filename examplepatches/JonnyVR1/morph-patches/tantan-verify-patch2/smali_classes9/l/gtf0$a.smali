.class public Ll/gtf0$a;
.super Ll/qum$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gtf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/hzq;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qum$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()Ll/hzq;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gtf0$a;->a:Ll/hzq;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ll/qum$a;->d()Ll/hzq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object v0
.end method

.method public e()Ll/x250;
    .locals 0

    .line 1
    new-instance p0, Ll/r9t;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/r9t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public f(Ll/hzq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gtf0$a;->a:Ll/hzq;

    .line 2
    .line 3
    return-void
.end method
