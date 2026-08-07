.class public final synthetic Ll/ud00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ku10$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/UploadSource;

.field public final synthetic d:Ll/x1d0$a;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ku10$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ud00;->a:Ll/ku10$a;

    iput-object p2, p0, Ll/ud00;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ud00;->c:Lcom/p1/mobile/putong/data/UploadSource;

    iput-object p4, p0, Ll/ud00;->d:Ll/x1d0$a;

    iput-object p5, p0, Ll/ud00;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ud00;->a:Ll/ku10$a;

    iget-object v1, p0, Ll/ud00;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ud00;->c:Lcom/p1/mobile/putong/data/UploadSource;

    iget-object v3, p0, Ll/ud00;->d:Ll/x1d0$a;

    iget-object p0, p0, Ll/ud00;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/wd00;->y(Ll/ku10$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
