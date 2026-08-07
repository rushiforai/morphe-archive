.class public final Ll/up1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sp1;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/up1;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/up1;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/up1;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/up1;->d:I

    .line 11
    .line 12
    return-void
.end method

.method public static b(Ll/ig60;)Ll/up1;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/ig60;->V(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x4

    .line 19
    invoke-virtual {p0, v3}, Ll/ig60;->V(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/16 v4, 0xc

    .line 27
    .line 28
    invoke-virtual {p0, v4}, Ll/ig60;->V(I)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/up1;

    .line 32
    .line 33
    invoke-direct {p0, v0, v1, v2, v3}, Ll/up1;-><init>(IIII)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/up1;->b:I

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    and-int/2addr p0, v0

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const p0, 0x68697661

    .line 2
    .line 3
    .line 4
    return p0
.end method
