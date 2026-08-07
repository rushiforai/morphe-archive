.class public final synthetic Ll/pfi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfi0;->a:Ll/bqq;

    iput-object p2, p0, Ll/pfi0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pfi0;->a:Ll/bqq;

    iget-object p0, p0, Ll/pfi0;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/bgi0;->a0(Ll/bqq;Ll/y20;)V

    return-void
.end method
