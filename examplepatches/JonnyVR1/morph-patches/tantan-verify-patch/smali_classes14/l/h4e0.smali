.class public final synthetic Ll/h4e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/abe0;


# direct methods
.method public synthetic constructor <init>(ZLl/abe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/h4e0;->a:Z

    iput-object p2, p0, Ll/h4e0;->b:Ll/abe0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/h4e0;->a:Z

    iget-object p0, p0, Ll/h4e0;->b:Ll/abe0;

    invoke-static {v0, p0}, Ll/i4e0;->e(ZLl/abe0;)V

    return-void
.end method
