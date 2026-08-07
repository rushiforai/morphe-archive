.class public Ll/b8g0;
.super Ljava/lang/Object;


# instance fields
.field public final a:Ll/h6m;


# direct methods
.method public constructor <init>(Ll/h6m;)V
    .locals 1
    .param p1    # Ll/h6m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "delegate"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ll/h6m;

    .line 11
    .line 12
    iput-object p1, p0, Ll/b8g0;->a:Ll/h6m;

    .line 13
    .line 14
    return-void
.end method
