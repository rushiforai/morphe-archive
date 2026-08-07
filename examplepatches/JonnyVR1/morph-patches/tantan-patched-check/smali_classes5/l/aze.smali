.class public final synthetic Ll/aze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bze;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ljava/io/File;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bze;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aze;->a:Ll/bze;

    iput-object p2, p0, Ll/aze;->b:Ljava/io/File;

    iput-object p3, p0, Ll/aze;->c:Ljava/io/File;

    iput-object p4, p0, Ll/aze;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aze;->a:Ll/bze;

    iget-object v1, p0, Ll/aze;->b:Ljava/io/File;

    iget-object v2, p0, Ll/aze;->c:Ljava/io/File;

    iget-object p0, p0, Ll/aze;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/bze;->c(Ll/bze;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method
