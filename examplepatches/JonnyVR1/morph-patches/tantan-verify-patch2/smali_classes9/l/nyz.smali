.class public final synthetic Ll/nyz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyz;->a:Ll/qzz;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyz;->a:Ll/qzz;

    invoke-static {p0}, Ll/qzz;->b(Ll/qzz;)V

    return-void
.end method
