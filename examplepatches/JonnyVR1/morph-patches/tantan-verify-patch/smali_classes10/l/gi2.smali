.class public final synthetic Ll/gi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hi2;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ll/gxl;


# direct methods
.method public synthetic constructor <init>(Ll/hi2;IILl/gxl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gi2;->a:Ll/hi2;

    iput p2, p0, Ll/gi2;->b:I

    iput p3, p0, Ll/gi2;->c:I

    iput-object p4, p0, Ll/gi2;->d:Ll/gxl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gi2;->a:Ll/hi2;

    iget v1, p0, Ll/gi2;->b:I

    iget v2, p0, Ll/gi2;->c:I

    iget-object p0, p0, Ll/gi2;->d:Ll/gxl;

    invoke-static {v0, v1, v2, p0}, Ll/hi2;->h(Ll/hi2;IILl/gxl;)V

    return-void
.end method
