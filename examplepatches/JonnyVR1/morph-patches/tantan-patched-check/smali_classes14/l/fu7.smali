.class public final synthetic Ll/fu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/fu7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fu7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/fu7;->d:Z

    iput-object p5, p0, Ll/fu7;->e:Ljava/lang/String;

    iput-boolean p6, p0, Ll/fu7;->f:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/fu7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/fu7;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/fu7;->d:Z

    iget-object v4, p0, Ll/fu7;->e:Ljava/lang/String;

    iget-boolean v5, p0, Ll/fu7;->f:Z

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Tb(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
