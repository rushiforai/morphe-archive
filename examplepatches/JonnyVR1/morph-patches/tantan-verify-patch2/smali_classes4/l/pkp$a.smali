.class public Ll/pkp$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/a$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pkp;->E0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final synthetic b:Ll/pkp;


# direct methods
.method public constructor <init>(Ll/pkp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pkp$a;->b:Ll/pkp;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pkp;->M(Ll/pkp;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/pkp$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-static {v0}, Ll/pkp;->L(Ll/pkp;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/pkp$a;->b:Ll/pkp;

    .line 16
    .line 17
    invoke-static {p0}, Ll/pkp;->M(Ll/pkp;)Ljava/lang/Runnable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-wide/16 v1, 0x3e8

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
