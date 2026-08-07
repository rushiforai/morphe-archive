.class public final synthetic Ll/jja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jja;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/jja;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jja;->c:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jja;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/jja;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/jja;->c:Lcom/p1/mobile/putong/data/Links;

    invoke-static {v0, v1, p0}, Ll/jka;->y0(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
