.class public final synthetic Ll/nbi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/xc00;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nbi0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    iput-object p2, p0, Ll/nbi0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/nbi0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/nbi0;->d:Ll/xc00;

    iput-object p5, p0, Ll/nbi0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/nbi0;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nbi0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    iget-object v1, p0, Ll/nbi0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/nbi0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/nbi0;->d:Ll/xc00;

    iget-object v4, p0, Ll/nbi0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/nbi0;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Ljava/io/File;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->g0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
