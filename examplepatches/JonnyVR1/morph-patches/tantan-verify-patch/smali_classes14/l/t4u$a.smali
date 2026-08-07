.class public Ll/t4u$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t4u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:J


# direct methods
.method public constructor <init>(Ljava/lang/String;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t4u$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/t4u$a;->b:I

    .line 7
    .line 8
    iput-wide p3, p0, Ll/t4u$a;->c:J

    .line 9
    .line 10
    return-void
.end method
