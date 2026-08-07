.class public final synthetic Ll/n4d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/s4d0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/StringBuffer;


# direct methods
.method public synthetic constructor <init>(Ll/s4d0;Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n4d0;->a:Ll/s4d0;

    iput-object p2, p0, Ll/n4d0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/n4d0;->c:Ljava/lang/StringBuffer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n4d0;->a:Ll/s4d0;

    iget-object v1, p0, Ll/n4d0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/n4d0;->c:Ljava/lang/StringBuffer;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1, p2}, Ll/s4d0;->j(Ll/s4d0;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
