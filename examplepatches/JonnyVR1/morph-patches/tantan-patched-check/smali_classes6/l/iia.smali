.class public final synthetic Ll/iia;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iia;->a:Ll/jka;

    iput-object p2, p0, Ll/iia;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/iia;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/iia;->d:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iia;->a:Ll/jka;

    iget-object v1, p0, Ll/iia;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/iia;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/iia;->d:Lcom/p1/mobile/putong/data/Links;

    invoke-static {v0, v1, v2, p0}, Ll/jka;->f6(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
