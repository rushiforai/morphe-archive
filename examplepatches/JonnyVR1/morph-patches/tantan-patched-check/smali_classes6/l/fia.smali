.class public final synthetic Ll/fia;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/data/Followship;

.field public final synthetic h:Z

.field public final synthetic i:Lcom/p1/mobile/putong/data/MatchScData;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;ZLcom/p1/mobile/putong/data/MatchScData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fia;->a:Ll/jka;

    iput-object p2, p0, Ll/fia;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fia;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/fia;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/fia;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/fia;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/fia;->g:Lcom/p1/mobile/putong/data/Followship;

    iput-boolean p8, p0, Ll/fia;->h:Z

    iput-object p9, p0, Ll/fia;->i:Lcom/p1/mobile/putong/data/MatchScData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/fia;->a:Ll/jka;

    iget-object v1, p0, Ll/fia;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/fia;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/fia;->d:Lcom/p1/mobile/putong/data/User;

    iget-object v4, p0, Ll/fia;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/fia;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/fia;->g:Lcom/p1/mobile/putong/data/Followship;

    iget-boolean v7, p0, Ll/fia;->h:Z

    iget-object v8, p0, Ll/fia;->i:Lcom/p1/mobile/putong/data/MatchScData;

    invoke-static/range {v0 .. v8}, Ll/jka;->Y0(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;ZLcom/p1/mobile/putong/data/MatchScData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
