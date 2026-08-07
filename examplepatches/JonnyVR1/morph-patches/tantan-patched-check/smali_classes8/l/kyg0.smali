.class public final synthetic Ll/kyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/bxg0;

.field public final synthetic e:Ll/bpg0;

.field public final synthetic f:Ll/neg0;

.field public final synthetic g:Ll/vlg0;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kyg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/kyg0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kyg0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/kyg0;->d:Ll/bxg0;

    iput-object p5, p0, Ll/kyg0;->e:Ll/bpg0;

    iput-object p6, p0, Ll/kyg0;->f:Ll/neg0;

    iput-object p7, p0, Ll/kyg0;->g:Ll/vlg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kyg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/kyg0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/kyg0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/kyg0;->d:Ll/bxg0;

    iget-object v4, p0, Ll/kyg0;->e:Ll/bpg0;

    iget-object v5, p0, Ll/kyg0;->f:Ll/neg0;

    iget-object v6, p0, Ll/kyg0;->g:Ll/vlg0;

    invoke-virtual/range {v0 .. v6}, Ll/uyg0;->m(Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V

    return-void
.end method
