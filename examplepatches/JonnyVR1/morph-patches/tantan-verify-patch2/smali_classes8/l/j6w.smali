.class public final synthetic Ll/j6w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/a30;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;ZLjava/lang/String;Ll/a30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/j6w;->a:Z

    iput-object p2, p0, Ll/j6w;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/j6w;->c:Z

    iput-object p4, p0, Ll/j6w;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/j6w;->e:Ll/a30;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/j6w;->a:Z

    iget-object v1, p0, Ll/j6w;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/j6w;->c:Z

    iget-object v3, p0, Ll/j6w;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/j6w;->e:Ll/a30;

    move-object v5, p1

    check-cast v5, Ll/pf60;

    invoke-static/range {v0 .. v5}, Ll/p6w;->f(ZLjava/lang/String;ZLjava/lang/String;Ll/a30;Ll/pf60;)V

    return-void
.end method
