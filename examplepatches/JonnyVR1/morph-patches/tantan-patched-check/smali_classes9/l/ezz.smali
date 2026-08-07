.class public final synthetic Ll/ezz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ezz;->a:Ll/qzz;

    iput p2, p0, Ll/ezz;->b:I

    iput-object p3, p0, Ll/ezz;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ezz;->a:Ll/qzz;

    iget v1, p0, Ll/ezz;->b:I

    iget-object p0, p0, Ll/ezz;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/qzz;->c(Ll/qzz;ILjava/lang/Runnable;)V

    return-void
.end method
