.class public final Lcom/tantanapp/android/injecter/facade/Postcard;
.super Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
.source "SourceFile"


# instance fields
.field private flags:I

.field private mBundle:Landroid/os/Bundle;

.field private provider:Lcom/tantanapp/android/injecter/facade/template/IProvider;

.field private tag:Ljava/lang/Object;

.field private timeout:I

.field private uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/tantanapp/android/injecter/facade/Postcard;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->flags:I

    .line 6
    .line 7
    const/16 v0, 0x12c

    .line 8
    .line 9
    iput v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->timeout:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setPath(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setGroup(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p3}, Lcom/tantanapp/android/injecter/facade/Postcard;->setUri(Landroid/net/Uri;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 18
    .line 19
    .line 20
    if-nez p4, :cond_0

    .line 21
    .line 22
    new-instance p4, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {p4}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iput-object p4, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public getExtras()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProvider()Lcom/tantanapp/android/injecter/facade/template/IProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->provider:Lcom/tantanapp/android/injecter/facade/template/IProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->timeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->uri:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public navigation()Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/mum;->f(Lcom/tantanapp/android/injecter/facade/Postcard;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setProvider(Lcom/tantanapp/android/injecter/facade/template/IProvider;)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->provider:Lcom/tantanapp/android/injecter/facade/template/IProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTag(Ljava/lang/Object;)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTimeout(I)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->timeout:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setUri(Landroid/net/Uri;)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->uri:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Postcard{uri="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->uri:Landroid/net/Uri;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", tag="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->tag:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", mBundle="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", flags="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->flags:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", timeout="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->timeout:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", provider="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->provider:Lcom/tantanapp/android/injecter/facade/template/IProvider;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "}\n"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-super {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public withBoolean(Ljava/lang/String;Z)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withByte(Ljava/lang/String;B)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withDouble(Ljava/lang/String;D)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withFloat(Ljava/lang/String;F)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withInt(Ljava/lang/String;I)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withLong(Ljava/lang/String;J)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withShort(Ljava/lang/String;S)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putShort(Ljava/lang/String;S)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public withString(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/android/injecter/facade/Postcard;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
