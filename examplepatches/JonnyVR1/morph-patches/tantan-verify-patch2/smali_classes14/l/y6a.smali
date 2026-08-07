.class public final synthetic Ll/y6a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y6a;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/y6a;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/y6a;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/y6a;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/y6a;->e:Z

    iput-object p6, p0, Ll/y6a;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/y6a;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/y6a;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/y6a;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/y6a;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/y6a;->e:Z

    iget-object v5, p0, Ll/y6a;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/v;->K3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
