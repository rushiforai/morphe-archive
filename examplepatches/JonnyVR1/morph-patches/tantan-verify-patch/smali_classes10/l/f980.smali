.class public final synthetic Ll/f980;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g980;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/g980;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f980;->a:Ll/g980;

    iput-object p2, p0, Ll/f980;->b:Ljava/io/File;

    iput-object p3, p0, Ll/f980;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/f980;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/f980;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f980;->a:Ll/g980;

    iget-object v1, p0, Ll/f980;->b:Ljava/io/File;

    iget-object v2, p0, Ll/f980;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/f980;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/f980;->e:Ll/y20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/g980;->e(Ll/g980;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    return-void
.end method
