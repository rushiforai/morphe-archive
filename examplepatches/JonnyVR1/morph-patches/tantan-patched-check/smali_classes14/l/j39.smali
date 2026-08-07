.class public final synthetic Ll/j39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lrx/subjects/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j39;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/j39;->b:Lrx/subjects/a;

    iput-boolean p3, p0, Ll/j39;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j39;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/j39;->b:Lrx/subjects/a;

    iget-boolean p0, p0, Ll/j39;->c:Z

    invoke-static {v0, v1, p0}, Ll/f49;->m3(Ljava/lang/String;Lrx/subjects/a;Z)V

    return-void
.end method
