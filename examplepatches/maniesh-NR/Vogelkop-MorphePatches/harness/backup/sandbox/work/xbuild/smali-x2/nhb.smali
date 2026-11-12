.class public final Lnhb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field private final a:Ldy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public b:Lhl;


# direct methods
.method public constructor <init>(Lvzk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lrx;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lrx;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lnhb;->a:Ldy;

    iget-object v1, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Lcy;

    invoke-virtual {v1}, Lcy;->c()Lml;

    move-result-object v1

    iget-object v1, v1, Lml;->f:Lhl;

    iput-object v1, p0, Lnhb;->b:Lhl;

    invoke-virtual {p1, v0}, Lvzk;->h(Ldy;)V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lnhb;->b:Lhl;

    return-object p0
.end method
