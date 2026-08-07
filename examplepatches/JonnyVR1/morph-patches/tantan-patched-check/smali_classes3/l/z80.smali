.class public abstract Ll/z80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:D

.field public final b:D


# direct methods
.method public constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/z80;->a:D

    .line 5
    .line 6
    iput-wide p3, p0, Ll/z80;->b:D

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a()Ljava/lang/String;
.end method

.method public abstract b()Ljava/lang/String;
.end method

.method public abstract c()Ljava/lang/String;
.end method

.method public d()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/z80;->a:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/z80;->b:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public abstract f()Ljava/lang/String;
.end method
