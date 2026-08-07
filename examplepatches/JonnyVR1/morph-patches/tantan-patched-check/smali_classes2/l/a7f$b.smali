.class Ll/a7f$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a7f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:Lcom/android/volley/Request;

.field private final b:Lcom/android/volley/d;

.field private final c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/android/volley/Request;Lcom/android/volley/d;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a7f$b;->a:Lcom/android/volley/Request;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a7f$b;->b:Lcom/android/volley/d;

    .line 7
    .line 8
    iput-object p3, p0, Ll/a7f$b;->c:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a7f$b;->a:Lcom/android/volley/Request;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/volley/Request;->isCanceled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/a7f$b;->a:Lcom/android/volley/Request;

    .line 10
    .line 11
    const-string v0, "canceled-at-delivery"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/a7f$b;->b:Lcom/android/volley/d;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/volley/d;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/a7f$b;->a:Lcom/android/volley/Request;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/a7f$b;->b:Lcom/android/volley/d;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/android/volley/d;->a:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lcom/android/volley/Request;->deliverResponse(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Ll/a7f$b;->b:Lcom/android/volley/d;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/android/volley/d;->c:Lcom/android/volley/VolleyError;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Lcom/android/volley/Request;->deliverError(Lcom/android/volley/VolleyError;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object v0, p0, Ll/a7f$b;->b:Lcom/android/volley/d;

    .line 43
    .line 44
    iget-boolean v0, v0, Lcom/android/volley/d;->d:Z

    .line 45
    .line 46
    iget-object v1, p0, Ll/a7f$b;->a:Lcom/android/volley/Request;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const-string v0, "intermediate-response"

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const-string v0, "done"

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :goto_1
    iget-object p0, p0, Ll/a7f$b;->c:Ljava/lang/Runnable;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method
