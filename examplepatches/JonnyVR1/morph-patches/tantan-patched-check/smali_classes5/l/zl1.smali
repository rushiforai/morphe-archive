.class public final synthetic Ll/zl1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dm1;


# direct methods
.method public synthetic constructor <init>(Ll/dm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zl1;->a:Ll/dm1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zl1;->a:Ll/dm1;

    invoke-static {p0}, Ll/dm1;->m0(Ll/dm1;)V

    return-void
.end method
