.class public final synthetic Ll/e51;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e51;->a:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e51;->a:Lrx/subjects/a;

    invoke-static {p0}, Ll/l51;->f(Lrx/subjects/a;)V

    return-void
.end method
