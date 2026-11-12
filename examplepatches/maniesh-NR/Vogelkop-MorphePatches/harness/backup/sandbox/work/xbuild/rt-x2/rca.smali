.class public final Lrca;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Z


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;Z)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lrca;->a:Ljava/lang/String;

    iput-object p6, p0, Lrca;->b:Ljava/lang/String;

    iput-boolean p7, p0, Lrca;->c:Z

    return-void
.end method
