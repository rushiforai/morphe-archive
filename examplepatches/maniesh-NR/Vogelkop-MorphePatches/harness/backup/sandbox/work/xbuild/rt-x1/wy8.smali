.class public abstract Lwy8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashSet;

.field private final b:Ldy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final c:Lwy;


# direct methods
.method public constructor <init>(Lwy;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lwy8;->a:Ljava/util/HashSet;

    new-instance v0, Lrx;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lrx;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwy8;->b:Ldy;

    iput-object p1, p0, Lwy8;->c:Lwy;

    return-void
.end method
