.class public final synthetic Ll/o93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/sa3;


# direct methods
.method public synthetic constructor <init>(ZLl/sa3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/o93;->a:Z

    iput-object p2, p0, Ll/o93;->b:Ll/sa3;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/o93;->a:Z

    iget-object p0, p0, Ll/o93;->b:Ll/sa3;

    invoke-static {v0, p0}, Ll/u93;->v(ZLl/sa3;)V

    return-void
.end method
