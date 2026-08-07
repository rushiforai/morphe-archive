.class public final synthetic Ll/awg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uwg0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/nzg0;


# direct methods
.method public synthetic constructor <init>(Ll/uwg0;ZLjava/lang/String;Ljava/lang/String;Ll/nzg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/awg0;->a:Ll/uwg0;

    iput-boolean p2, p0, Ll/awg0;->b:Z

    iput-object p3, p0, Ll/awg0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/awg0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/awg0;->e:Ll/nzg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/awg0;->a:Ll/uwg0;

    iget-boolean v1, p0, Ll/awg0;->b:Z

    iget-object v2, p0, Ll/awg0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/awg0;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/awg0;->e:Ll/nzg0;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/uwg0;->g(ZLjava/lang/String;Ljava/lang/String;Ll/nzg0;)V

    return-void
.end method
