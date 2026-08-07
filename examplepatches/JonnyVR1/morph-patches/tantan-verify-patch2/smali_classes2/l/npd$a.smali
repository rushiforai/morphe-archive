.class public Ll/npd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/shm;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/npd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/npd;


# direct methods
.method public constructor <init>(Ll/npd;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/npd$a;->a:Ll/npd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/n0f;ILl/qvb0;Ll/phm;)Ll/db5;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/npd$a;->a:Ll/npd;

    .line 6
    .line 7
    invoke-static {v1}, Ll/npd;->b(Ll/npd;)Ll/a7h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p4, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/n0f;->v()Landroid/graphics/ColorSpace;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    :cond_0
    :goto_0
    move-object v7, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v1, p4, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :goto_1
    sget-object v1, Ll/ppd;->a:Ll/him;

    .line 37
    .line 38
    if-ne v0, v1, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ll/npd$a;->a:Ll/npd;

    .line 41
    .line 42
    move-object v3, p1

    .line 43
    move v4, p2

    .line 44
    move-object v5, p3

    .line 45
    move-object v6, p4

    .line 46
    invoke-virtual/range {v2 .. v7}, Ll/npd;->e(Ll/n0f;ILl/qvb0;Ll/phm;Landroid/graphics/ColorSpace;)Ll/ib5;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    move-object v3, p1

    .line 52
    move v4, p2

    .line 53
    move-object v5, p3

    .line 54
    move-object v6, p4

    .line 55
    sget-object p1, Ll/ppd;->c:Ll/him;

    .line 56
    .line 57
    if-ne v0, p1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/npd$a;->a:Ll/npd;

    .line 60
    .line 61
    invoke-virtual {p0, v3, v4, v5, v6}, Ll/npd;->d(Ll/n0f;ILl/qvb0;Ll/phm;)Ll/db5;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_3
    sget-object p1, Ll/ppd;->j:Ll/him;

    .line 67
    .line 68
    if-ne v0, p1, :cond_4

    .line 69
    .line 70
    iget-object p0, p0, Ll/npd$a;->a:Ll/npd;

    .line 71
    .line 72
    invoke-virtual {p0, v3, v4, v5, v6}, Ll/npd;->c(Ll/n0f;ILl/qvb0;Ll/phm;)Ll/db5;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_4
    sget-object p1, Ll/him;->c:Ll/him;

    .line 78
    .line 79
    if-eq v0, p1, :cond_5

    .line 80
    .line 81
    iget-object p0, p0, Ll/npd$a;->a:Ll/npd;

    .line 82
    .line 83
    invoke-virtual {p0, v3, v6}, Ll/npd;->f(Ll/n0f;Ll/phm;)Ll/ib5;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_5
    new-instance p0, Lcom/facebook/imagepipeline/decoder/DecodeException;

    .line 89
    .line 90
    const-string p1, "unknown image format"

    .line 91
    .line 92
    invoke-direct {p0, p1, v3}, Lcom/facebook/imagepipeline/decoder/DecodeException;-><init>(Ljava/lang/String;Ll/n0f;)V

    .line 93
    .line 94
    .line 95
    throw p0
.end method
