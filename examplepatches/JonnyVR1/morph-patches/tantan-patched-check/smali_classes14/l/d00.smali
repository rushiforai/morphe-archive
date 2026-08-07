.class public final synthetic Ll/d00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r00;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/r00;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d00;->a:Ll/r00;

    iput-object p2, p0, Ll/d00;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d00;->a:Ll/r00;

    iget-object p0, p0, Ll/d00;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/r00;->G(Ll/r00;Ljava/io/File;)V

    return-void
.end method
