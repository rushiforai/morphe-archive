.class public final synthetic Ll/ir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[I

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([IILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ir0;->a:[I

    iput p2, p0, Ll/ir0;->b:I

    iput-object p3, p0, Ll/ir0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ir0;->a:[I

    iget v1, p0, Ll/ir0;->b:I

    iget-object p0, p0, Ll/ir0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/jr0;->a([IILjava/lang/Runnable;)V

    return-void
.end method
