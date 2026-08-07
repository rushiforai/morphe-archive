.class public Landroidx/activity/result/ActivityResultRegistry$a;
.super Ll/c60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/result/ActivityResultRegistry;->j(Ljava/lang/String;Ll/ker;Ll/x50;Ll/w50;)Ll/c60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/c60<",
        "TI;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Ll/x50;

.field public final synthetic d:Landroidx/activity/result/ActivityResultRegistry;


# direct methods
.method public constructor <init>(Landroidx/activity/result/ActivityResultRegistry;Ljava/lang/String;ILl/x50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$a;->d:Landroidx/activity/result/ActivityResultRegistry;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Landroidx/activity/result/ActivityResultRegistry$a;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/activity/result/ActivityResultRegistry$a;->c:Ll/x50;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/c60;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/x50;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/x50<",
            "TI;*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->c:Ll/x50;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/Object;Ll/u50;)V
    .locals 2
    .param p2    # Ll/u50;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;",
            "Ll/u50;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->d:Landroidx/activity/result/ActivityResultRegistry;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/activity/result/ActivityResultRegistry;->e:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/activity/result/ActivityResultRegistry$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->d:Landroidx/activity/result/ActivityResultRegistry;

    .line 11
    .line 12
    iget v1, p0, Landroidx/activity/result/ActivityResultRegistry$a;->b:I

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->c:Ll/x50;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0, p1, p2}, Landroidx/activity/result/ActivityResultRegistry;->f(ILl/x50;Ljava/lang/Object;Ll/u50;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->d:Landroidx/activity/result/ActivityResultRegistry;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/activity/result/ActivityResultRegistry$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroidx/activity/result/ActivityResultRegistry;->l(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
