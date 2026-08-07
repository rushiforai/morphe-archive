.class public final synthetic Ll/lld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lld;->a:Ll/hk0$a;

    iput-boolean p2, p0, Ll/lld;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lld;->a:Ll/hk0$a;

    iget-boolean p0, p0, Ll/lld;->b:Z

    check-cast p1, Ll/hk0;

    invoke-static {v0, p0, p1}, Ll/wld;->c1(Ll/hk0$a;ZLl/hk0;)V

    return-void
.end method
