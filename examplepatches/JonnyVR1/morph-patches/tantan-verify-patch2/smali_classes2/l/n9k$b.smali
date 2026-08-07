.class public Ll/n9k$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n9k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public constructor <init>(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/n9k$b;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/n9k$b;->b:J

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(IJLl/n9k$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Ll/n9k$b;-><init>(IJ)V

    return-void
.end method
