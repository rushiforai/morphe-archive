.class Ll/rnk0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rnk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field a:Ll/rmw$b;

.field b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/rmw$b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rnk0$b;->a:Ll/rmw$b;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rnk0$b;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
