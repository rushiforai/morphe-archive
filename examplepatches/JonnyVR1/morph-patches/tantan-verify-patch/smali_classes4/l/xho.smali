.class public final synthetic Ll/xho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xho;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/xho;->b:Z

    iput-object p3, p0, Ll/xho;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/xho;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xho;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/xho;->b:Z

    iget-object v2, p0, Ll/xho;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/xho;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/yho;->b(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method
