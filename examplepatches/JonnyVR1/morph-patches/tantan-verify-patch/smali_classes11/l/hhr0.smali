.class public final Ll/hhr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bhr0;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hhr0;->a:I

    .line 5
    .line 6
    iput p3, p0, Ll/hhr0;->b:I

    .line 7
    .line 8
    iput p4, p0, Ll/hhr0;->c:I

    .line 9
    .line 10
    iput p5, p0, Ll/hhr0;->d:I

    .line 11
    .line 12
    iput p6, p0, Ll/hhr0;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public static a(Ll/bgw0;)Ll/hhr0;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/hhr0;

    .line 40
    .line 41
    invoke-direct/range {v0 .. v6}, Ll/hhr0;-><init>(IIIIII)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const p0, 0x68727473

    .line 2
    .line 3
    .line 4
    return p0
.end method
