.class public final synthetic Ll/lp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/lp3;->a:Z

    iput-object p2, p0, Ll/lp3;->b:Ljava/lang/String;

    iput p3, p0, Ll/lp3;->c:I

    iput-object p4, p0, Ll/lp3;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/lp3;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/lp3;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/lp3;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/lp3;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/lp3;->a:Z

    iget-object v1, p0, Ll/lp3;->b:Ljava/lang/String;

    iget v2, p0, Ll/lp3;->c:I

    iget-object v3, p0, Ll/lp3;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/lp3;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/lp3;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/lp3;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/lp3;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i(ZLjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    return-void
.end method
