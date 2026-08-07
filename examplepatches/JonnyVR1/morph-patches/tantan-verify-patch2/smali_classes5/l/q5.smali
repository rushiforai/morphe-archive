.class public final synthetic Ll/q5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/t5;

.field public final synthetic b:I

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/t5;ILl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5;->a:Ll/t5;

    iput p2, p0, Ll/q5;->b:I

    iput-object p3, p0, Ll/q5;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q5;->a:Ll/t5;

    iget v1, p0, Ll/q5;->b:I

    iget-object p0, p0, Ll/q5;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/t5;->e(Ll/t5;ILl/x20;)V

    return-void
.end method
