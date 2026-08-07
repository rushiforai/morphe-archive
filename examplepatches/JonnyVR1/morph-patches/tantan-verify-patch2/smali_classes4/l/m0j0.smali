.class public final synthetic Ll/m0j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ljava/lang/ClassLoader;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ClassLoader;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m0j0;->a:Ljava/lang/ClassLoader;

    iput-object p2, p0, Ll/m0j0;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m0j0;->a:Ljava/lang/ClassLoader;

    iget-object p0, p0, Ll/m0j0;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/n0j0;->a(Ljava/lang/ClassLoader;Ljava/io/File;)Ljava/lang/Throwable;

    move-result-object p0

    return-object p0
.end method
