.class public final synthetic Ll/rb5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ku10$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/UploadSource;

.field public final synthetic e:Ll/x1d0$a;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rb5;->a:Ll/ku10$a;

    iput-object p2, p0, Ll/rb5;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rb5;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/rb5;->d:Lcom/p1/mobile/putong/data/UploadSource;

    iput-object p5, p0, Ll/rb5;->e:Ll/x1d0$a;

    iput-object p6, p0, Ll/rb5;->f:Ljava/lang/String;

    iput-boolean p7, p0, Ll/rb5;->g:Z

    iput-object p8, p0, Ll/rb5;->h:Ljava/lang/String;

    iput-object p9, p0, Ll/rb5;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/rb5;->a:Ll/ku10$a;

    iget-object v1, p0, Ll/rb5;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/rb5;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/rb5;->d:Lcom/p1/mobile/putong/data/UploadSource;

    iget-object v4, p0, Ll/rb5;->e:Ll/x1d0$a;

    iget-object v5, p0, Ll/rb5;->f:Ljava/lang/String;

    iget-boolean v6, p0, Ll/rb5;->g:Z

    iget-object v7, p0, Ll/rb5;->h:Ljava/lang/String;

    iget-object v8, p0, Ll/rb5;->i:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Ll/yb5;->E(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
