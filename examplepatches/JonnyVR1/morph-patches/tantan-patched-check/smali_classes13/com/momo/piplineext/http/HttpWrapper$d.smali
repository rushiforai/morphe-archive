.class Lcom/momo/piplineext/http/HttpWrapper$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplineext/http/HttpWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# static fields
.field private static a:Lcom/momo/piplineext/http/HttpWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/piplineext/http/HttpWrapper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/piplineext/http/HttpWrapper;-><init>(Lcom/momo/piplineext/http/HttpWrapper$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/momo/piplineext/http/HttpWrapper$d;->a:Lcom/momo/piplineext/http/HttpWrapper;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Lcom/momo/piplineext/http/HttpWrapper;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/http/HttpWrapper$d;->a:Lcom/momo/piplineext/http/HttpWrapper;

    .line 2
    .line 3
    return-object v0
.end method
