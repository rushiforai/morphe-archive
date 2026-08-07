.class public final synthetic Ll/yvg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wtg0;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wtg0;Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yvg0;->a:Ll/wtg0;

    iput-object p2, p0, Ll/yvg0;->b:Ljava/io/File;

    iput-object p3, p0, Ll/yvg0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/yvg0;->d:Z

    iput-object p5, p0, Ll/yvg0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yvg0;->a:Ll/wtg0;

    iget-object v1, p0, Ll/yvg0;->b:Ljava/io/File;

    iget-object v2, p0, Ll/yvg0;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/yvg0;->d:Z

    iget-object p0, p0, Ll/yvg0;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/gwg0;->c(Ll/wtg0;Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
