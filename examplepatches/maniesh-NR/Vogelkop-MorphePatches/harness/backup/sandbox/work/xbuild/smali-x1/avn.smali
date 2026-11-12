.class public final Lavn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(ILjava/util/HashMap;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lavn;->a:I

    iput-object p2, p0, Lavn;->b:Ljava/util/HashMap;

    return-void
.end method
