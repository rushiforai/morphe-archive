.class public final synthetic Ll/ubq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ccq0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ubq0;->a:Ll/ccq0;

    iput-object p2, p0, Ll/ubq0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ubq0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ubq0;->d:Ljava/lang/Runnable;

    iput-object p5, p0, Ll/ubq0;->e:Ll/y20;

    iput-object p6, p0, Ll/ubq0;->f:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ubq0;->a:Ll/ccq0;

    iget-object v1, p0, Ll/ubq0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ubq0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ubq0;->d:Ljava/lang/Runnable;

    iget-object v4, p0, Ll/ubq0;->e:Ll/y20;

    iget-object v5, p0, Ll/ubq0;->f:Ljava/lang/Runnable;

    move-object v6, p1

    check-cast v6, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v6}, Ll/ccq0;->r2(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method
