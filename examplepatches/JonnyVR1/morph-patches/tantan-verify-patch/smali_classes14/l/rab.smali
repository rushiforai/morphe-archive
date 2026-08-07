.class public final synthetic Ll/rab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/rab;->a:Z

    iput-object p2, p0, Ll/rab;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rab;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/rab;->a:Z

    iget-object v1, p0, Ll/rab;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/rab;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/uab;->c3(ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
