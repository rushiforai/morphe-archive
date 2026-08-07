.class public final synthetic Ll/v3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g5z0;


# instance fields
.field public final synthetic a:Ll/l5z0;

.field public final synthetic b:Ll/h4z0;

.field public final synthetic c:Z

.field public final synthetic d:[I


# direct methods
.method public synthetic constructor <init>(Ll/l5z0;Ll/h4z0;Z[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v3z0;->a:Ll/l5z0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v3z0;->b:Ll/h4z0;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/v3z0;->c:Z

    .line 9
    .line 10
    iput-object p4, p0, Ll/v3z0;->d:[I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(ILl/t2u0;[I)Ljava/util/List;
    .locals 10

    .line 1
    new-instance v7, Ll/u3z0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/v3z0;->a:Ll/l5z0;

    .line 4
    .line 5
    invoke-direct {v7, v0}, Ll/u3z0;-><init>(Ll/l5z0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/v3z0;->d:[I

    .line 9
    .line 10
    aget v8, v0, p1

    .line 11
    .line 12
    new-instance v9, Ll/mqw0;

    .line 13
    .line 14
    invoke-direct {v9}, Ll/mqw0;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    move v3, v0

    .line 19
    :goto_0
    iget v0, p2, Ll/t2u0;->a:I

    .line 20
    .line 21
    if-gtz v3, :cond_0

    .line 22
    .line 23
    iget-boolean v6, p0, Ll/v3z0;->c:Z

    .line 24
    .line 25
    iget-object v4, p0, Ll/v3z0;->b:Ll/h4z0;

    .line 26
    .line 27
    new-instance v0, Ll/a4z0;

    .line 28
    .line 29
    aget v5, p3, v3

    .line 30
    .line 31
    move v1, p1

    .line 32
    move-object v2, p2

    .line 33
    invoke-direct/range {v0 .. v8}, Ll/a4z0;-><init>(ILl/t2u0;ILl/h4z0;IZLl/uow0;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v9, v0}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 37
    .line 38
    .line 39
    add-int/lit8 v3, v3, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v9}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
