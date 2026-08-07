.class public final synthetic Ll/g83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/k83$a;


# direct methods
.method public synthetic constructor <init>(ZLl/k83$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/g83;->a:Z

    iput-object p2, p0, Ll/g83;->b:Ll/k83$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/g83;->a:Z

    iget-object p0, p0, Ll/g83;->b:Ll/k83$a;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/k83;->d(ZLl/k83$a;Ll/uxj0;)V

    return-void
.end method
