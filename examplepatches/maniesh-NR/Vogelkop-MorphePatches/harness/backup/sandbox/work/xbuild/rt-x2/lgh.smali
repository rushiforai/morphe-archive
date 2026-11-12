.class public final Llgh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/List;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Llgh;->a:I

    iput-object p2, p0, Llgh;->b:Ljava/lang/String;

    iput-object p3, p0, Llgh;->c:Ljava/util/List;

    return-void
.end method
