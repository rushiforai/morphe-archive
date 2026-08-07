.class public final synthetic Ll/vho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vho;->a:Z

    iput-boolean p2, p0, Ll/vho;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/vho;->a:Z

    iget-boolean p0, p0, Ll/vho;->b:Z

    invoke-static {v0, p0}, Ll/yho;->c(ZZ)V

    return-void
.end method
