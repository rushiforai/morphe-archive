.class public final synthetic Ll/glh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/umh;


# direct methods
.method public synthetic constructor <init>(Ll/umh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/glh;->a:Ll/umh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/glh;->a:Ll/umh;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/umh;->x0(Ll/umh;Ljava/lang/Throwable;)V

    return-void
.end method
