.class public final synthetic Ll/s3f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s3f0;->a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    iput-object p2, p0, Ll/s3f0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/s3f0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/s3f0;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s3f0;->a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    iget-object v1, p0, Ll/s3f0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/s3f0;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/s3f0;->d:Z

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->a(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;ZLl/gcg0;)V

    return-void
.end method
