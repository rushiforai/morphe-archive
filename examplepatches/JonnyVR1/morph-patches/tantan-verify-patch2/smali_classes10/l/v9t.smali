.class public final synthetic Ll/v9t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eat;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/eat;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v9t;->a:Ll/eat;

    iput-boolean p2, p0, Ll/v9t;->b:Z

    iput-boolean p3, p0, Ll/v9t;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v9t;->a:Ll/eat;

    iget-boolean v1, p0, Ll/v9t;->b:Z

    iget-boolean p0, p0, Ll/v9t;->c:Z

    check-cast p1, Ll/zc50;

    invoke-static {v0, v1, p0, p1}, Ll/eat;->L3(Ll/eat;ZZLl/zc50;)V

    return-void
.end method
