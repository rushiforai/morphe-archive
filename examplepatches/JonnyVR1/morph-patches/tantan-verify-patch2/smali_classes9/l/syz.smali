.class public final synthetic Ll/syz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:F

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;FZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syz;->a:Ll/qzz;

    iput p2, p0, Ll/syz;->b:F

    iput-boolean p3, p0, Ll/syz;->c:Z

    iput-object p4, p0, Ll/syz;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/syz;->a:Ll/qzz;

    iget v1, p0, Ll/syz;->b:F

    iget-boolean v2, p0, Ll/syz;->c:Z

    iget-object p0, p0, Ll/syz;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0}, Ll/qzz;->O(Ll/qzz;FZLjava/lang/Runnable;)V

    return-void
.end method
