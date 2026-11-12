.class public final Lupk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh1b;

.field public final b:I


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p1

    iput-object p1, p0, Lupk;->a:Lh1b;

    iput p2, p0, Lupk;->b:I

    return-void
.end method
