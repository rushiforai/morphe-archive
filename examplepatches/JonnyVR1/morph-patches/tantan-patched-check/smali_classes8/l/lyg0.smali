.class public final synthetic Ll/lyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ll/yjg0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/axg0;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ll/yjg0;Ljava/lang/String;Ll/axg0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lyg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/lyg0;->b:Ll/yjg0;

    iput-object p3, p0, Ll/lyg0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/lyg0;->d:Ll/axg0;

    iput-object p5, p0, Ll/lyg0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lyg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/lyg0;->b:Ll/yjg0;

    iget-object v2, p0, Ll/lyg0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/lyg0;->d:Ll/axg0;

    iget-object p0, p0, Ll/lyg0;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/uyg0;->q(Ll/yjg0;Ljava/lang/String;Ll/axg0;Ljava/lang/String;)V

    return-void
.end method
