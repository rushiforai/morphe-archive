.class public final synthetic Ll/gvo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ivo0;

.field public final synthetic b:Ll/gae0;


# direct methods
.method public synthetic constructor <init>(Ll/ivo0;Ll/gae0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gvo0;->a:Ll/ivo0;

    iput-object p2, p0, Ll/gvo0;->b:Ll/gae0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gvo0;->a:Ll/ivo0;

    iget-object p0, p0, Ll/gvo0;->b:Ll/gae0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/ivo0;->d(Ll/ivo0;Ll/gae0;Ljava/lang/Throwable;)V

    return-void
.end method
