.class public final synthetic Ll/d80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e80;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/e80;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d80;->a:Ll/e80;

    iput-boolean p2, p0, Ll/d80;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d80;->a:Ll/e80;

    iget-boolean p0, p0, Ll/d80;->b:Z

    invoke-static {v0, p0}, Ll/e80;->i4(Ll/e80;Z)V

    return-void
.end method
