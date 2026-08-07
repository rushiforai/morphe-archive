.class public final synthetic Ll/chv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w8e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/e4d0;


# direct methods
.method public synthetic constructor <init>(Ll/w8e;Ljava/lang/String;Ll/e4d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/chv;->a:Ll/w8e;

    iput-object p2, p0, Ll/chv;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/chv;->c:Ll/e4d0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/chv;->a:Ll/w8e;

    iget-object v1, p0, Ll/chv;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/chv;->c:Ll/e4d0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/aiv;->u(Ll/w8e;Ljava/lang/String;Ll/e4d0;Ljava/lang/Throwable;)V

    return-void
.end method
