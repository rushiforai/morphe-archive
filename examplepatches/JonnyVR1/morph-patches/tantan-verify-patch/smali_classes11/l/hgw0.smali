.class public final Ll/hgw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/jgw0;

.field public final b:Ll/igw0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/jgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hgw0;->a:Ll/jgw0;

    .line 10
    .line 11
    new-instance v1, Ll/igw0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/igw0;-><init>(Ll/ggw0;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/hgw0;->b:Ll/igw0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a()Ll/ggw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hgw0;->b:Ll/igw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/ggw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hgw0;->a:Ll/jgw0;

    .line 2
    .line 3
    return-object p0
.end method
