.class public abstract Lxph;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/d;

.field public final b:La83;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/d;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, La83;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, La83;-><init>(B)V

    iput-object v0, p0, Lxph;->b:La83;

    iput-object p1, p0, Lxph;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method


# virtual methods
.method public abstract a(I)Z
.end method
