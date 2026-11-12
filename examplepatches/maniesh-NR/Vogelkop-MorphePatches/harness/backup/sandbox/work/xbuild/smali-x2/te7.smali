.class public final Lte7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/io/File;


# direct methods
.method public constructor <init>(JLjava/io/File;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lte7;->a:J

    iput-object p3, p0, Lte7;->b:Ljava/io/File;

    return-void
.end method
