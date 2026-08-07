.class public final synthetic Ll/w3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/w3a;->a:I

    iput-object p2, p0, Ll/w3a;->b:Lcom/p1/mobile/putong/data/Links;

    iput-boolean p3, p0, Ll/w3a;->c:Z

    iput-object p4, p0, Ll/w3a;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Ll/w3a;->a:I

    iget-object v1, p0, Ll/w3a;->b:Lcom/p1/mobile/putong/data/Links;

    iget-boolean v2, p0, Ll/w3a;->c:Z

    iget-object p0, p0, Ll/w3a;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/f4a;->p3(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
