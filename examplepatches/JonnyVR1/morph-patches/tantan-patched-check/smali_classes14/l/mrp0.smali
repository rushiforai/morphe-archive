.class public final synthetic Ll/mrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/prp0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/prp0;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mrp0;->a:Ll/prp0;

    iput-object p2, p0, Ll/mrp0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/mrp0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mrp0;->a:Ll/prp0;

    iget-object v1, p0, Ll/mrp0;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/mrp0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    invoke-static {v0, v1, p0, p1}, Ll/prp0;->a(Ll/prp0;Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method
