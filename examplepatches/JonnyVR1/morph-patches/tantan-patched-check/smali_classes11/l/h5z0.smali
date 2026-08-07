.class public abstract Ll/h5z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ll/t2u0;

.field public final c:I

.field public final d:Ll/sqr0;


# direct methods
.method public constructor <init>(ILl/t2u0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/h5z0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/h5z0;->b:Ll/t2u0;

    .line 7
    .line 8
    iput p3, p0, Ll/h5z0;->c:I

    .line 9
    .line 10
    invoke-virtual {p2, p3}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b(Ll/h5z0;)Z
.end method
