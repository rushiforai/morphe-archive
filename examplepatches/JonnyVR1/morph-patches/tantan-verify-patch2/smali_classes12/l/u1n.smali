.class public Ll/u1n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/reactivex/FlowableTransformer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableTransformer<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field private a:Z

.field private final b:Lio/reactivex/functions/Action;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/functions/Action;)V
    .locals 1
    .param p1    # Lio/reactivex/functions/Action;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/u1n;->a:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/u1n;->b:Lio/reactivex/functions/Action;

    .line 8
    .line 9
    return-void
.end method
