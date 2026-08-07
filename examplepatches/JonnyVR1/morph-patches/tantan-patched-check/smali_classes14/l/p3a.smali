.class public final synthetic Ll/p3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/f4a;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/f4a;ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p3a;->a:Ll/f4a;

    iput p2, p0, Ll/p3a;->b:I

    iput-object p3, p0, Ll/p3a;->c:Lcom/p1/mobile/putong/data/Links;

    iput-boolean p4, p0, Ll/p3a;->d:Z

    iput-object p5, p0, Ll/p3a;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p3a;->a:Ll/f4a;

    iget v1, p0, Ll/p3a;->b:I

    iget-object v2, p0, Ll/p3a;->c:Lcom/p1/mobile/putong/data/Links;

    iget-boolean v3, p0, Ll/p3a;->d:Z

    iget-object p0, p0, Ll/p3a;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/f4a;->a3(Ll/f4a;ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
