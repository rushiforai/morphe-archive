.class public Lcom/tantanapp/beatles/anrmonitor/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/anrmonitor/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/anrmonitor/a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/anrmonitor/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/anrmonitor/a$a;->a:Lcom/tantanapp/beatles/anrmonitor/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a$a;->a:Lcom/tantanapp/beatles/anrmonitor/a;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Lcom/tantanapp/beatles/anrmonitor/a;->a(Lcom/tantanapp/beatles/anrmonitor/a;J)J

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/beatles/anrmonitor/a$a;->a:Lcom/tantanapp/beatles/anrmonitor/a;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Lcom/tantanapp/beatles/anrmonitor/a;->b(Lcom/tantanapp/beatles/anrmonitor/a;Z)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
