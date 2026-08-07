.class public final synthetic Ll/hzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/izh;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/izh;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hzh;->a:Ll/izh;

    iput-object p2, p0, Ll/hzh;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hzh;->a:Ll/izh;

    iget-object p0, p0, Ll/hzh;->b:Ll/x20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/izh;->e0(Ll/izh;Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method
