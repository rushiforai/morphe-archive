.class public final synthetic Ll/k5h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>([ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k5h0;->a:[Z

    iput-object p2, p0, Ll/k5h0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h0;->a:[Z

    iget-object p0, p0, Ll/k5h0;->b:Ll/x20;

    check-cast p1, Ll/tj3;

    invoke-static {v0, p0, p1}, Ll/o5h0;->o([ZLl/x20;Ll/tj3;)V

    return-void
.end method
