.class Ll/zqw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ro5;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zqw;->j(Ljava/lang/String;)Ll/zqw$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zqw$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/mwc/sdk/exception/MWCException;Ljava/lang/Object;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p2, Ll/zqw;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zqw$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "addWorker failed @error=%s"

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p2, p0, v0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
