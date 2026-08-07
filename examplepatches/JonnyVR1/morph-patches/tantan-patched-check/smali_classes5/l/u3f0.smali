.class public final synthetic Ll/u3f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u3f0;->a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    iput-object p2, p0, Ll/u3f0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u3f0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/u3f0;->d:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u3f0;->a:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    iget-object v1, p0, Ll/u3f0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/u3f0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/u3f0;->d:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->d(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;Ljava/lang/Throwable;)V

    return-void
.end method
