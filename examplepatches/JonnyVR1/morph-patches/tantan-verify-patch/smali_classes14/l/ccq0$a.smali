.class public Ll/ccq0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/tauth/IUiListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ccq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ccq0;


# direct methods
.method public constructor <init>(Ll/ccq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ccq0;->u3(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onComplete(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/ccq0;->r3(Ll/ccq0;Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    instance-of v0, p1, Lorg/json/JSONObject;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast p1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object p0, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Ll/ccq0;->u3(Ll/ccq0;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-static {p0, p1}, Ll/ccq0;->t3(Ll/ccq0;Lorg/json/JSONObject;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 33
    .line 34
    invoke-static {p0}, Ll/ccq0;->u3(Ll/ccq0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onError(Lcom/tencent/tauth/UiError;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0$a;->a:Ll/ccq0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ccq0;->u3(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onWarning(I)V
    .locals 0

    .line 1
    return-void
.end method
