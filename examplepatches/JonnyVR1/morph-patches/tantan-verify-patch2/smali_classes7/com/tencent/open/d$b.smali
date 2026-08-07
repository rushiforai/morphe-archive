.class Lcom/tencent/open/d$b;
.super Lcom/tencent/open/b$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/open/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/open/d;


# direct methods
.method private constructor <init>(Lcom/tencent/open/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/open/d$b;->a:Lcom/tencent/open/d;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/open/b$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/open/d;Lcom/tencent/open/d$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/tencent/open/d$b;-><init>(Lcom/tencent/open/d;)V

    return-void
.end method
