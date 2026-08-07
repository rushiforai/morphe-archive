.class public final synthetic Ll/dbj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jbj0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/jbj0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbj0;->a:Ll/jbj0;

    iput-boolean p2, p0, Ll/dbj0;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dbj0;->a:Ll/jbj0;

    iget-boolean p0, p0, Ll/dbj0;->b:Z

    invoke-static {v0, p0}, Ll/jbj0;->b(Ll/jbj0;Z)V

    return-void
.end method
