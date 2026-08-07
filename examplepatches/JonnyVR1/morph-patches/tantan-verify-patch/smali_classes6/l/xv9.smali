.class public final synthetic Ll/xv9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv9;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/xv9;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/xv9;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xv9;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/xv9;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/xv9;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/api/b;->w1(Ljava/lang/String;Ljava/lang/String;Z)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
