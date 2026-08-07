.class public Ll/jsp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jsp0;-><init>(Ll/x1d0;Ll/lsp0;Ljava/util/Random;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jsp0;


# direct methods
.method public constructor <init>(Ll/jsp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jsp0$a;->a:Ll/jsp0;

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
    .locals 2

    .line 1
    :goto_0
    :try_start_0
    iget-object v0, p0, Ll/jsp0$a;->a:Ll/jsp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jsp0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :catch_0
    move-exception v0

    .line 12
    iget-object p0, p0, Ll/jsp0$a;->a:Ll/jsp0;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/jsp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
