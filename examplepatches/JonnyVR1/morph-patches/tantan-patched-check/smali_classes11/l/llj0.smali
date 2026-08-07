.class public final Ll/llj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:F

.field public final c:F

.field public final d:I

.field public final e:I

.field public final f:F

.field public final g:F

.field public final h:I

.field public final i:F

.field public final j:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 11

    .line 1
    const v9, -0x800001

    .line 2
    .line 3
    .line 4
    const/high16 v10, -0x80000000

    .line 5
    .line 6
    const v2, -0x800001

    .line 7
    .line 8
    .line 9
    const v3, -0x800001

    .line 10
    .line 11
    .line 12
    const/high16 v4, -0x80000000

    .line 13
    .line 14
    const/high16 v5, -0x80000000

    .line 15
    .line 16
    const v6, -0x800001

    .line 17
    .line 18
    .line 19
    const v7, -0x800001

    .line 20
    .line 21
    .line 22
    const/high16 v8, -0x80000000

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    move-object v1, p1

    .line 26
    invoke-direct/range {v0 .. v10}, Ll/llj0;-><init>(Ljava/lang/String;FFIIFFIFI)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;FFIIFFIFI)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Ll/llj0;->a:Ljava/lang/String;

    .line 32
    iput p2, p0, Ll/llj0;->b:F

    .line 33
    iput p3, p0, Ll/llj0;->c:F

    .line 34
    iput p4, p0, Ll/llj0;->d:I

    .line 35
    iput p5, p0, Ll/llj0;->e:I

    .line 36
    iput p6, p0, Ll/llj0;->f:F

    .line 37
    iput p7, p0, Ll/llj0;->g:F

    .line 38
    iput p8, p0, Ll/llj0;->h:I

    .line 39
    iput p9, p0, Ll/llj0;->i:F

    .line 40
    iput p10, p0, Ll/llj0;->j:I

    return-void
.end method
