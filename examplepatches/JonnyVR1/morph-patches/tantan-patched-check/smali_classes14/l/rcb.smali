.class public final synthetic Ll/rcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rcb;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/rcb;->b:Z

    iput-boolean p3, p0, Ll/rcb;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rcb;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/rcb;->b:Z

    iget-boolean p0, p0, Ll/rcb;->c:Z

    invoke-static {v0, v1, p0}, Ll/dkb;->J4(Ljava/lang/String;ZZ)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
