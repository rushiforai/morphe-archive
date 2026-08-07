.class public Ll/w0r$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r;->T()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r$e;->a:Ll/w0r;

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
    iget-object v0, p0, Ll/w0r$e;->a:Ll/w0r;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/w0r;->C(Ll/w0r;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w0r$e;->a:Ll/w0r;

    .line 8
    .line 9
    invoke-static {v0}, Ll/w0r;->D(Ll/w0r;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/w0r$e;->a:Ll/w0r;

    .line 14
    .line 15
    invoke-static {v1}, Ll/w0r;->z(Ll/w0r;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/w0r$e;->a:Ll/w0r;

    .line 28
    .line 29
    iget-object v0, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-static {p0}, Ll/w0r;->z(Ll/w0r;)Ljava/lang/Runnable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-wide/16 v1, 0x82

    .line 36
    .line 37
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
