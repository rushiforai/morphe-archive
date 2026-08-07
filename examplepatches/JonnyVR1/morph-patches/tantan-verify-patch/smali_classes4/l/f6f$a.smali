.class public Ll/f6f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f6f;->e()Ll/k5f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/f6f;


# direct methods
.method public constructor <init>(Ll/f6f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6f$a;->a:Ll/f6f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mod;->c()Ll/mod;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/mod;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setFormat(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/f6f$a;->a:Ll/f6f;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/f6f;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "/"

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setCacheDir(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
