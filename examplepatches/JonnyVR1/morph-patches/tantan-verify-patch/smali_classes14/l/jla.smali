.class public final synthetic Ll/jla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pla;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pla;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jla;->a:Ll/pla;

    iput-boolean p2, p0, Ll/jla;->b:Z

    iput-object p3, p0, Ll/jla;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jla;->a:Ll/pla;

    iget-boolean v1, p0, Ll/jla;->b:Z

    iget-object p0, p0, Ll/jla;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/pla;->b3(Ll/pla;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
