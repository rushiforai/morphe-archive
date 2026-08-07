.class public final synthetic Ll/mig0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hlg0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/io/File;

.field public final synthetic d:J

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ll/gkg0;


# direct methods
.method public synthetic constructor <init>(Ll/hlg0;Ljava/lang/String;Ljava/io/File;JLjava/lang/Object;Ll/gkg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mig0;->a:Ll/hlg0;

    iput-object p2, p0, Ll/mig0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mig0;->c:Ljava/io/File;

    iput-wide p4, p0, Ll/mig0;->d:J

    iput-object p6, p0, Ll/mig0;->e:Ljava/lang/Object;

    iput-object p7, p0, Ll/mig0;->f:Ll/gkg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/mig0;->a:Ll/hlg0;

    iget-object v1, p0, Ll/mig0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mig0;->c:Ljava/io/File;

    iget-wide v3, p0, Ll/mig0;->d:J

    iget-object v5, p0, Ll/mig0;->e:Ljava/lang/Object;

    iget-object v6, p0, Ll/mig0;->f:Ll/gkg0;

    invoke-virtual/range {v0 .. v6}, Ll/hlg0;->b(Ljava/lang/String;Ljava/io/File;JLjava/lang/Object;Ll/gkg0;)V

    return-void
.end method
