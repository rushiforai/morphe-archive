.class public Ll/ox50;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ll/uoe0;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/uoe0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox50;->b:Ll/uoe0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox50;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ox50;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(Z)Ll/ox50;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ox50;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/uoe0;)Ll/ox50;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox50;->b:Ll/uoe0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/ox50;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox50;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
