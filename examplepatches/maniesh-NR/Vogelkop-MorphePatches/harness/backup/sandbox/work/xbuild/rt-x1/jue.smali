.class public final Ljue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lurg;

.field public final b:Li7f;

.field public c:Lbwf;

.field public final synthetic d:Lkue;


# direct methods
.method public constructor <init>(Lkue;Lurg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljue;->d:Lkue;

    iput-object p2, p0, Ljue;->a:Lurg;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Ljue;->b:Li7f;

    return-void
.end method
