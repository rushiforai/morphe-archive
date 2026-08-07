.class public final synthetic Ll/lwp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/xwp;


# direct methods
.method public synthetic constructor <init>(ZLl/xwp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/lwp;->a:Z

    iput-object p2, p0, Ll/lwp;->b:Ll/xwp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lwp;->a:Z

    iget-object p0, p0, Ll/lwp;->b:Ll/xwp;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/xwp;->i4(ZLl/xwp;Ljava/util/List;)V

    return-void
.end method
