.class public final synthetic Ll/nci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vci0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vci0;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nci0;->a:Ll/vci0;

    iput-object p2, p0, Ll/nci0;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iput-object p3, p0, Ll/nci0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/nci0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nci0;->a:Ll/vci0;

    iget-object v1, p0, Ll/nci0;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iget-object v2, p0, Ll/nci0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/nci0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/vci0;->N(Ll/vci0;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
