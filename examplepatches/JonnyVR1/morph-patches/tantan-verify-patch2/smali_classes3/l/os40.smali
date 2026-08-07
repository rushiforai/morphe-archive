.class public final synthetic Ll/os40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/os40;->a:Ll/y20;

    iput-object p2, p0, Ll/os40;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/os40;->a:Ll/y20;

    iget-object p0, p0, Ll/os40;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/ps40;->b(Ll/y20;Ljava/io/File;)V

    return-void
.end method
