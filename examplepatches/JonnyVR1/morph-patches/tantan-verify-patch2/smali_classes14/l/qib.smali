.class public final synthetic Ll/qib;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/qib;->a:Z

    iput-object p2, p0, Ll/qib;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/qib;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/qib;->a:Z

    iget-object v1, p0, Ll/qib;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/qib;->c:Z

    invoke-static {v0, v1, p0}, Ll/dkb;->a3(ZLjava/lang/String;Z)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
