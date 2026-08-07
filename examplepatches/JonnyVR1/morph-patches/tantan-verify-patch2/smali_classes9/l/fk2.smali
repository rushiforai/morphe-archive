.class public abstract Ll/fk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xsl;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/fk2;->a:I

    .line 15
    iput v0, p0, Ll/fk2;->b:I

    return-void
.end method

.method public constructor <init>(Ll/gk2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Ll/gk2;->a:I

    .line 5
    .line 6
    iput v0, p0, Ll/fk2;->a:I

    .line 7
    .line 8
    iget p1, p1, Ll/gk2;->b:I

    .line 9
    .line 10
    iput p1, p0, Ll/fk2;->b:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fk2;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public getAction()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fk2;->b:I

    .line 2
    .line 3
    return p0
.end method
