.class public Ll/gu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/fu;


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
.method public a()Ll/fu;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gu;->a:Ll/fu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, v0, Ll/efq0;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    new-instance v0, Ll/efq0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/efq0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/gu;->a:Ll/fu;

    .line 15
    .line 16
    :cond_1
    iget-object p0, p0, Ll/gu;->a:Ll/fu;

    .line 17
    .line 18
    return-object p0
.end method
