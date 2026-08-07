.class Ll/hh3$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hh3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field a:[B

.field b:Z

.field final synthetic c:Ll/hh3;


# direct methods
.method public constructor <init>(Ll/hh3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hh3$a;->c:Ll/hh3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/hh3$a;->b:Z

    .line 8
    .line 9
    return-void
.end method
