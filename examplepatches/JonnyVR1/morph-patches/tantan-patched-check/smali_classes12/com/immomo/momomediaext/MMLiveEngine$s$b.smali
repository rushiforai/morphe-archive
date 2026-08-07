.class Lcom/immomo/momomediaext/MMLiveEngine$s$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$s;->a(Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplineext/bean/MMLiveSubtitleState;

.field final synthetic b:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/immomo/momomediaext/MMLiveEngine$s;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$s;Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->d:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->a:Lcom/momo/piplineext/bean/MMLiveSubtitleState;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->b:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->d:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->d:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->a:Lcom/momo/piplineext/bean/MMLiveSubtitleState;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->b:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$b;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, p0}, Ll/enw;->i0(Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
