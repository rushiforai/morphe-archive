.class public Ll/wnd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/List;

.field public final c:Landroid/os/Bundle;

.field public final d:Ll/w70;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/os/Bundle;Ll/w70;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/w70;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ll/z7y;",
            ">;",
            "Landroid/os/Bundle;",
            "Ll/w70;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wnd0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wnd0;->b:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wnd0;->c:Landroid/os/Bundle;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wnd0;->d:Ll/w70;

    .line 11
    .line 12
    return-void
.end method
