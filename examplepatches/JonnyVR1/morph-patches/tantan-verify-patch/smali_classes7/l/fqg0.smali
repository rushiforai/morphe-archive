.class public final synthetic Ll/fqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/osg0;

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/uog0;


# direct methods
.method public synthetic constructor <init>(Ll/osg0;JLjava/lang/String;Ll/uog0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fqg0;->a:Ll/osg0;

    iput-wide p2, p0, Ll/fqg0;->b:J

    iput-object p4, p0, Ll/fqg0;->c:Ljava/lang/String;

    iput-object p5, p0, Ll/fqg0;->d:Ll/uog0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fqg0;->a:Ll/osg0;

    iget-wide v1, p0, Ll/fqg0;->b:J

    iget-object v3, p0, Ll/fqg0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/fqg0;->d:Ll/uog0;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/osg0;->n(JLjava/lang/String;Ll/uog0;)V

    return-void
.end method
