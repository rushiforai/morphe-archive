.class public Ll/yfl$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yfl;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final synthetic b:Ll/yfl;


# direct methods
.method public constructor <init>(Ll/yfl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yfl;->I(Ll/yfl;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/spl0;->Z()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 17
    .line 18
    invoke-static {p0}, Ll/yfl;->M(Ll/yfl;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    invoke-static {}, Ll/spl0;->Z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 8
    .line 9
    invoke-static {v0}, Ll/yfl;->N(Ll/yfl;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/yfl$d;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 21
    .line 22
    invoke-static {v0}, Ll/yfl;->H(Ll/yfl;)Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/yfl$d;->b:Ll/yfl;

    .line 27
    .line 28
    invoke-static {p0}, Ll/yfl;->I(Ll/yfl;)Ljava/lang/Runnable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-wide/16 v1, 0x3e8

    .line 33
    .line 34
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method
