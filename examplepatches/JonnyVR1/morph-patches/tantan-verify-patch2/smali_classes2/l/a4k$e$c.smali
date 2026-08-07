.class Ll/a4k$e$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a4k$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a4k$e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Request threw uncaught throwable"

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
