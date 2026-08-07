.class public final synthetic Ll/vzc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xzc0;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/xzc0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vzc0;->a:Ll/xzc0;

    iput-object p2, p0, Ll/vzc0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vzc0;->a:Ll/xzc0;

    iget-object p0, p0, Ll/vzc0;->b:Ll/x20;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Ll/xzc0;->b(Ll/xzc0;Ll/x20;Ll/bkj0;)V

    return-void
.end method
