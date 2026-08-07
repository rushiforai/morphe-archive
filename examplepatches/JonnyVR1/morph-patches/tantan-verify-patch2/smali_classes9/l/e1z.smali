.class public final synthetic Ll/e1z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/u1z;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e1z;->a:Ll/u1z;

    iput-object p2, p0, Ll/e1z;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e1z;->a:Ll/u1z;

    iget-object p0, p0, Ll/e1z;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/u1z;->I0(Ll/u1z;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
