.class public final Lqpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyuh;


# instance fields
.field public final a:Lrpl;

.field public final b:J


# direct methods
.method public constructor <init>(Lrpl;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqpl;->a:Lrpl;

    iput-wide p2, p0, Lqpl;->b:J

    return-void
.end method
