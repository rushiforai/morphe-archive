.class public final synthetic Ll/tga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Followship;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tga;->a:Ll/jka;

    iput-object p2, p0, Ll/tga;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/tga;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/tga;->d:Lcom/p1/mobile/putong/data/Followship;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tga;->a:Ll/jka;

    iget-object v1, p0, Ll/tga;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/tga;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/tga;->d:Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, v1, v2, p0}, Ll/jka;->o4(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
