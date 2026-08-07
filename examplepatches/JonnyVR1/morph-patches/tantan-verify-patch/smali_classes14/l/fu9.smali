.class public Ll/fu9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/eu9;


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
.method public a()Ll/eu9;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fu9;->a:Ll/eu9;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ju9;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ju9;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fu9;->a:Ll/eu9;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/fu9;->a:Ll/eu9;

    .line 13
    .line 14
    return-object p0
.end method
