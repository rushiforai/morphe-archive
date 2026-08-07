.class public final synthetic Ll/a8c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g8c;

.field public final synthetic b:Z

.field public final synthetic c:Ll/pcj;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/g8c;ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a8c;->a:Ll/g8c;

    iput-boolean p2, p0, Ll/a8c;->b:Z

    iput-object p3, p0, Ll/a8c;->c:Ll/pcj;

    iput-object p4, p0, Ll/a8c;->d:Ll/y20;

    iput-object p5, p0, Ll/a8c;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/a8c;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/a8c;->a:Ll/g8c;

    iget-boolean v1, p0, Ll/a8c;->b:Z

    iget-object v2, p0, Ll/a8c;->c:Ll/pcj;

    iget-object v3, p0, Ll/a8c;->d:Ll/y20;

    iget-object v4, p0, Ll/a8c;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/a8c;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/g8c;->b(Ll/g8c;ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V

    return-void
.end method
