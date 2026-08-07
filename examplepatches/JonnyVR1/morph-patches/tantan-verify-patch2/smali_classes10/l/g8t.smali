.class public Ll/g8t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z


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
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g8t;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g8t;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/g8t;->a:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/g8t;->b:Z

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/g8t;->a:Z

    .line 6
    .line 7
    return-void
.end method
